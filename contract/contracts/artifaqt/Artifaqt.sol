pragma solidity 0.4.24;

import "./../eip721/EIP721.sol";


contract Artifaqt is EIP721 {
    address public admin;

    // Bool to pause transfers
    bool transferResumed = false;

    // Array holding the sin hashes
    bytes32[] private sins;

    // Mapping from token ID to token type
    mapping(uint256 => uint256) internal typeOfToken;

    // Cutoff minting time
    uint256 cutoffMintingTime = 1565169880;

    event ToppedUp(uint256 _value);

    uint256 public blocksplitWinners = 0;
    mapping (address => bool) public blocksplitWinnerMapping;
    mapping (uint256 => address[]) public winnersPerChest;

    address public masterWinner;

    /// @notice Contract constructor
    /// Generates the keccak256 hashes of each sin that will be used
    /// when claiming tokens. Saves the admin. Sets a name and symbol.
    constructor() public {
        // Nothing at all
        // sins.push(keccak256("Empty slot to satisfy the gods of zero-indexing"));
        sins.push(keccak256("riva-palace-model"));
        sins.push(keccak256("vestibul-peristil"));
        sins.push(keccak256("na-kantunu"));
        sins.push(keccak256("golden-gate"));
        sins.push(keccak256("24pointclock"));
        sins.push(keccak256("bajamonti-fountain"));
        sins.push(keccak256("matejuska"));

        // Set owner
        admin = msg.sender;

        // Default name and symbol
        name = "Blocksplit 2019 Tokenhunt";
        symbol = "keyz";
    }

    /// @notice Claim tokens by providing the sin payload
    /// Reverts unless the payload was correctly created. Reverts after the party is over and no more tokens should be created.
    /// @param _sinPayload = keccak256(keccak256(sin) + playerAddress)
    /// sin must be one of strings hashed in the constructor that the player will find scattered across the DevCon4 conference
    function claimToken(
        bytes32 _sinPayload
    ) external mintingAllowed {
        // Make sure it's the correct sin
        uint256 tokenType;
        bool found = false;
        for(uint256 i = 0; i < 5; i++) {
            if (_sinPayload == keccak256(abi.encodePacked(sins[i], msg.sender))) {
                tokenType = i;
                found = true;
                break;
            }
        }
        require(found == true, "Payload does not match available token");

        // Make sure the user does not have this type of token
        require(ownerHasTokenType(msg.sender, tokenType) == false, "User must not have this token yet");

        // Create and add token
        uint256 tokenId = totalSupply();
        addToken(msg.sender, tokenId, tokenType);

        // Emit create event
        emit Transfer(0x0, msg.sender, tokenId);
    }

    /// @notice The admin can generate tokens for players
    /// Reverts unless the user already has the token type. Reverts unless the minting happens withing the minting allowed time period.
    /// @param _to The player's address
    /// @param _tokenType A number from 0 to 4 representing the item type
    function mintToken(
        address _to,
        uint256 _tokenType
    ) external onlyAdmin mintingAllowed {
        // Create and add token
        uint256 tokenId = totalSupply();
        addToken(_to, tokenId, _tokenType);

        // Emit create event
        emit Transfer(0x0, _to, tokenId);
    }

    /// @notice Returns the token id, owner and type
    /// Throws unless _tokenId exists
    /// @param _tokenId The token by id
    /// return
    /// - token index
    /// - owner of token
    /// - type of token
    function getToken(
        uint256 _tokenId
    ) external view returns (uint256, address, uint256) {
        return (
            allTokensIndex[_tokenId],
            ownerOfToken[_tokenId],
            typeOfToken[_tokenId]
        );
    }

    /// @notice Returns the claimed tokens for player
    /// Returns an empty array if player does not have any claimed tokens
    /// @param _player The player's address
    function getTokenTypes(
        address _player
    ) external view returns (uint256[]) {
        uint256[] memory claimedTokens = new uint256[](ownedTokens[_player].length);

        for (uint256 i = 0; i < ownedTokens[_player].length; i++) {
            claimedTokens[i] = typeOfToken[ownedTokens[_player][i]];
        }

        return claimedTokens;
    }

    function () public payable {
        emit ToppedUp(msg.value);
    }

    function withdrawEther() external onlyAdmin {
        admin.transfer(address(this).balance);
    }

    function claimPrize(uint256 _chestNum) external {
        require(ownerHasTokenType(msg.sender, _chestNum) == true, "User must have this token");
        
        giveBlocksplit(msg.sender, false);
        uint256 winnersForChest = winnersPerChest[_chestNum].length;

        for (uint8 i = 0; i < winnersForChest; i = i + 1) {
            require (winnersPerChest[_chestNum][i] != msg.sender, "Winner must not already have claimed this chest");
        }
        
        uint256 prize = 0;
        if (winnersForChest == 0) {
            prize = 0.3 ether;
        }
        if (winnersForChest > 0) {
            prize = 0.15 ether;
        }
        if (winnersForChest > 2) {
            prize = 0;
        }

        if (prize > 0 && address(this).balance >= prize) {
            address(msg.sender).transfer(prize);
        }

        winnersPerChest[_chestNum].push(msg.sender);
    }

    function claimMasterPrize() external {

        // make it only claimable once!!!
        require(masterWinner == address(0), "Prize must not have been claimed");

        require(ownerHasTokenType(msg.sender, 0) == true, "User must have token 0");
        require(ownerHasTokenType(msg.sender, 1) == true, "User must have token 1");
        require(ownerHasTokenType(msg.sender, 2) == true, "User must have token 2");
        require(ownerHasTokenType(msg.sender, 3) == true, "User must have token 3");
        require(ownerHasTokenType(msg.sender, 4) == true, "User must have token 4");
        require(ownerHasTokenType(msg.sender, 4) == true, "User must have token 5");
        require(ownerHasTokenType(msg.sender, 4) == true, "User must have token 6");

        masterWinner = msg.sender;

        giveBlocksplit(msg.sender, true);
        if (address(this).balance >= 1 ether) {
            address(msg.sender).transfer(1 ether);
        } else {
            address(msg.sender).transfer(address(this).balance);
        }
    }

    function giveBlocksplit(address _beneficiary, bool _masterprize) internal {
        if (((blocksplitWinners < 6 && !_masterprize) || _masterprize) && blocksplitWinnerMapping[_beneficiary] == false) {
            blocksplitWinners = blocksplitWinners + 1;
            blocksplitWinnerMapping[_beneficiary] = true;
        }
    }

    // TODO: Do not allow any kind of transfers if transfer is paused
    /// @notice Transfers the ownership of a token
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    /// @param data Additional data with no specified format, sent in call to `_to`
    function safeTransferFrom(
        address _from, 
        address _to, 
        uint256 _tokenId, 
        bytes data
    ) public payable transferAllowed {
        super.safeTransferFrom(_from, _to, _tokenId, data);
    }

    /// @notice Transfers the ownership of an NFT from one address to another address
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    function safeTransferFrom(
        address _from, 
        address _to, 
        uint256 _tokenId
    ) public payable transferAllowed {
        super.safeTransferFrom(_from, _to, _tokenId);
    }

    /// @notice Transfer ownership of an NFT -- THE CALLER IS RESPONSIBLE
    ///  TO CONFIRM THAT `_to` IS CAPABLE OF RECEIVING NFTS OR ELSE
    ///  THEY MAY BE PERMANENTLY LOST
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    function transferFrom(
        address _from, 
        address _to, 
        uint256 _tokenId
    ) public payable transferAllowed {
        super.transferFrom(_from, _to, _tokenId);
    }

    /// @notice Enables or disables transfers
    /// If it is set to `false` all functions that transfer tokens are paused and will revert.
    /// Functions that approve transfers (`approve()` and `setTransferForAll()`) still work 
    /// because they do not transfer tokens immediately.
    /// @param _resume This should be set to `true` if transfers should be enabled, `false` otherwise
    function allowTransfer(bool _resume) public onlyAdmin {
        transferResumed = _resume;
    }

    /// @notice Returns true of the `_player` has the requested `_tokenType`
    /// @param _player The player's address
    /// @param _tokenType A number from 0 to 8 representing the sin type
    function ownerHasTokenType(
        address _player,
        uint256 _tokenType
    ) internal view returns (bool) {
        for (uint256 i = 0; i < ownedTokens[_player].length; i++) {
            if (typeOfToken[ownedTokens[_player][i]] == _tokenType) {
                return true;
            }
        }
        return false;
    }

    /// @notice Adds a token for the player
    /// Calls the `super.addToken(address _to, uint256 _tokenId)` method and
    /// saves the token type also. The `_tokenId` must not already exist.
    /// @param _to The player's address
    /// @param _tokenId The new token id
    /// @param _tokenType A number from 0 to 8 representing the sin type
    function addToken(
        address _to,
        uint256 _tokenId,
        uint256 _tokenType
    ) internal {
        super.addToken(_to, _tokenId);

        // Save token type
        typeOfToken[_tokenId] = _tokenType;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
    }

    modifier mintingAllowed() {
        require(block.timestamp <= cutoffMintingTime);
        _;
    }

    modifier transferAllowed() {
        require(transferResumed);
        _;
    }
}