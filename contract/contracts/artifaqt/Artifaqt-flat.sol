pragma solidity 0.4.24;

// File: C:/Users/Bruno/repos/artifaqt/artifaqt/contract/contracts/eip721/EIP721Interface.sol

/// @title ERC-721 Non-Fungible Token Standard
/// @dev See https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
///  Note: the ERC-165 identifier for this interface is 0x6466353c
interface EIP721Interface {

    /// @dev This emits when ownership of any NFT changes by any mechanism.
    ///  This event emits when NFTs are created (`from` == 0) and destroyed
    ///  (`to` == 0). Exception: during contract creation, any number of NFTs
    ///  may be created and assigned without emitting Transfer. At the time of
    ///  any transfer, the approved address for that NFT (if any) is reset to none.
    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);

    /// @dev This emits when the approved address for an NFT is changed or
    ///  reaffirmed. The zero address indicates there is no approved address.
    ///  When a Transfer event emits, this also indicates that the approved
    ///  address for that NFT (if any) is reset to none.
    event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);

    /// @dev This emits when an operator is enabled or disabled for an owner.
    ///  The operator can manage all NFTs of the owner.
    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

    /// @notice Transfers the ownership of an NFT from one address to another address
    /// @dev Throws unless `msg.sender` is the current owner, an authorized
    ///  operator, or the approved address for this NFT. Throws if `_from` is
    ///  not the current owner. Throws if `_to` is the zero address. Throws if
    ///  `_tokenId` is not a valid NFT. When transfer is complete, this function
    ///  checks if `_to` is a smart contract (code size > 0). If so, it calls
    ///  `onERC721Received` on `_to` and throws if the return value is not
    ///  `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`.
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    /// @param data Additional data with no specified format, sent in call to `_to`
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) public payable;

    /// @notice Transfers the ownership of an NFT from one address to another address
    /// @dev This works identically to the other function with an extra data parameter,
    ///  except this function just sets data to ""
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) public payable;

    /// @notice Transfer ownership of an NFT -- THE CALLER IS RESPONSIBLE
    ///  TO CONFIRM THAT `_to` IS CAPABLE OF RECEIVING NFTS OR ELSE
    ///  THEY MAY BE PERMANENTLY LOST
    /// @dev Throws unless `msg.sender` is the current owner, an authorized
    ///  operator, or the approved address for this NFT. Throws if `_from` is
    ///  not the current owner. Throws if `_to` is the zero address. Throws if
    ///  `_tokenId` is not a valid NFT.
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    function transferFrom(address _from, address _to, uint256 _tokenId) public payable;

    /// @notice Change or reaffirm the approved address for an NFT.
    /// @dev The zero address indicates there is no approved address.
    ///  Throws unless `msg.sender` is the current NFT owner, or an authorized
    ///  operator of the current owner.
    /// @param _approved The new approved NFT controller
    /// @param _tokenId The NFT to approve
    function approve(address _approved, uint256 _tokenId) external payable;

    /// @notice Enable or disable approval for a third party ("operator") to manage
    ///  all of `msg.sender`'s assets.
    /// @dev Emits the ApprovalForAll event. The contract MUST allow
    ///  multiple operators per owner.
    /// @param _operator Address to add to the set of authorized operators.
    /// @param _approved True if the operator is approved, false to revoke approval
    function setApprovalForAll(address _operator, bool _approved) external;

    /// @notice Get the approved address for a single NFT
    /// @dev Throws if `_tokenId` is not a valid NFT
    /// @param _tokenId The NFT to find the approved address for
    /// @return The approved address for this NFT, or the zero address if there is none
    function getApproved(uint256 _tokenId) external view returns (address);

    /// @notice Query if an address is an authorized operator for another address
    /// @param _owner The address that owns the NFTs
    /// @param _operator The address that acts on behalf of the owner
    /// @return True if `_operator` is an approved operator for `_owner`, false otherwise
    function isApprovedForAll(address _owner, address _operator) external view returns (bool);

    /// @notice Count all NFTs assigned to an owner
    /// @dev NFTs assigned to the zero address are considered invalid, and this
    ///  function throws for queries about the zero address.
    /// @param _owner An address for whom to query the balance
    /// @return The number of NFTs owned by `_owner`, possibly zero
    function balanceOf(address _owner) external view returns (uint256);

    /// @notice Find the owner of an NFT
    /// @param _tokenId The identifier for an NFT
    /// @dev NFTs assigned to zero address are considered invalid, and queries
    ///  about them do throw.
    /// @return The address of the owner of the NFT
    function ownerOf(uint256 _tokenId) external view returns (address);

}


interface ERC165Interface {
    /// @notice Query if a contract implements an interface
    /// @param interfaceID The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    ///  uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    ///  `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

// File: C:/Users/Bruno/repos/artifaqt/artifaqt/contract/contracts/eip721/EIP721MetadataInterface.sol

/// @title ERC-721 Non-Fungible Token Standard, optional metadata extension
/// @dev See https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
///  Note: the ERC-165 identifier for this interface is 0x5b5e139f
interface EIP721MetadataInterface {
    /// @notice A descriptive name for a collection of NFTs in this contract
    // function name() external view returns (string _name);

    /// @notice An abbreviated name for NFTs in this contract
    // function symbol() external view returns (string _symbol);

    /// @notice A distinct Uniform Resource Identifier (URI) for a given asset.
    /// @dev Throws if `_tokenId` is not a valid NFT. URIs are defined in RFC
    ///  3986. The URI may point to a JSON file that conforms to the "ERC721
    ///  Metadata JSON Schema".
    function tokenURI(uint256 _tokenId) external view returns (string);
}

// File: C:/Users/Bruno/repos/artifaqt/artifaqt/contract/contracts/eip721/EIP721EnumerableInterface.sol

/// @title ERC-721 Non-Fungible Token Standard, optional enumeration extension
/// @dev See https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
///  Note: the ERC-165 identifier for this interface is 0x780e9d63
interface EIP721EnumerableInterface {
    /// @notice Count NFTs tracked by this contract
    /// @return A count of valid NFTs tracked by this contract, where each one of
    ///  them has an assigned and queryable owner not equal to the zero address
    function totalSupply() external view returns (uint256);

    /// @notice Enumerate valid NFTs
    /// @dev Throws if `_index` >= `totalSupply()`.
    /// @param _index A counter less than `totalSupply()`
    /// @return The token identifier for the `_index`th NFT,
    ///  (sort order not specified)
    function tokenByIndex(uint256 _index) external view returns (uint256);

    /// @notice Enumerate NFTs assigned to an owner
    /// @dev Throws if `_index` >= `balanceOf(_owner)` or if
    ///  `_owner` is the zero address, representing invalid NFTs.
    /// @param _owner An address where we are interested in NFTs owned by them
    /// @param _index A counter less than `balanceOf(_owner)`
    /// @return The token identifier for the `_index`th NFT assigned to `_owner`,
    ///   (sort order not specified)
    function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256 _tokenId);
}

// File: C:/Users/Bruno/repos/artifaqt/artifaqt/contract/contracts/eip721/EIP721TokenReceiverInterface.sol

/// @dev Note: the ERC-165 identifier for this interface is 0x150b7a02.
interface EIP721TokenReceiverInterface {
    /// @notice Handle the receipt of an NFT
    /// Note: the application will get the prior owner of the token
    ///  after a `transfer`. This function MAY throw to revert and reject the
    ///  transfer. Return of other than the magic value MUST result in the
    ///  transaction being reverted.
    ///  Note: the contract address is always the message sender.
    /// @param _operator The address which called `safeTransferFrom` function
    /// @param _from The address which previously owned the token
    /// @param _tokenId The NFT identifier which is being transferred
    /// @param _data Additional data with no specified format
    /// @return `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`
    ///  unless throwing
    function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes _data) external returns(bytes4);
}

// File: C:/Users/Bruno/repos/artifaqt/artifaqt/contract/contracts/eip721/EIP721.sol

/*
This is a full implementation of all ERC721's features.
Influenced by OpenZeppelin's implementation with some stylistic changes.
https://github.com/OpenZeppelin/zeppelin-solidity/tree/master/contracts/token/ERC721
*/

contract EIP721 is EIP721Interface, EIP721MetadataInterface, EIP721EnumerableInterface, ERC165Interface {
    string public name;
    string public symbol;

    // all tokens
    uint256[] internal allTokens;
    // mapping of token IDs to its index in all Tokens array.
    mapping(uint256 => uint256) internal allTokensIndex;
    // Array of tokens owned by a specific owner
    mapping(address => uint256[]) internal ownedTokens;
    // Mapping from token ID to owner
    mapping(uint256 => address) internal ownerOfToken;
    // Mapping of the token ID to where it is in the owner's array.
    mapping(uint256 => uint256) internal ownedTokensIndex;

    // Mapping of a token to a specifically approved owner.
    mapping(uint256 => address) internal approvedOwnerOfToken;

    // An operator is allowed to manage all assets of another owner.
    mapping(address => mapping (address => bool)) internal operators;

    mapping(uint256 => string) internal tokenURIs;

    bytes4 internal constant ERC721_BASE_INTERFACE_SIGNATURE = 0x80ac58cd;
    bytes4 internal constant ERC721_METADATA_INTERFACE_SIGNATURE = 0x5b5e139f;
    bytes4 internal constant ERC721_ENUMERABLE_INTERFACE_SIGNATURE = 0x780e9d63;
    bytes4 internal constant ONERC721RECEIVED_FUNCTION_SIGNATURE = 0x150b7a02;

    /* Modifiers */
    modifier tokenExists(uint256 _tokenId) {
        require(ownerOfToken[_tokenId] != 0);
        _;
    }

    // checks: is the owner of the token == msg.sender?
    // OR has the owner of the token granted msg.sender access to operate?
    modifier allowedToOperate(uint256 _tokenId) {
        require(checkIfAllowedToOperate(_tokenId));
        _;
    }

    modifier allowedToTransfer(address _from, address _to, uint256 _tokenId) {
        require(checkIfAllowedToOperate(_tokenId) || approvedOwnerOfToken[_tokenId] == msg.sender);
        require(ownerOfToken[_tokenId] == _from);
        require(_to != 0); //not allowed to burn in transfer method
        _;
    }

    /// @notice Transfer ownership of an NFT -- THE CALLER IS RESPONSIBLE
    ///  TO CONFIRM THAT `_to` IS CAPABLE OF RECEIVING NFTS OR ELSE
    ///  THEY MAY BE PERMANENTLY LOST
    /// @dev Throws unless `msg.sender` is the current owner, an authorized
    ///  operator, or the approved address for this NFT. Throws if `_from` is
    ///  not the current owner. Throws if `_to` is the zero address. Throws if
    ///  `_tokenId` is not a valid NFT.
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    function transferFrom(address _from, address _to, uint256 _tokenId) public payable
    tokenExists(_tokenId)
    allowedToTransfer(_from, _to, _tokenId) {
        //transfer token
        settleTransfer(_from, _to, _tokenId);
    }

    /// @notice Transfers the ownership of an NFT from one address to another address
    /// @dev Throws unless `msg.sender` is the current owner, an authorized
    ///  operator, or the approved address for this NFT. Throws if `_from` is
    ///  not the current owner. Throws if `_to` is the zero address. Throws if
    ///  `_tokenId` is not a valid NFT. When transfer is complete, this function
    ///  checks if `_to` is a smart contract (code size > 0). If so, it calls
    ///  `onERC721Received` on `_to` and throws if the return value is not
    ///  `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`.
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    /// @param data Additional data with no specified format, sent in call to `_to`
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) public payable
    tokenExists(_tokenId)
    allowedToTransfer(_from, _to, _tokenId) {
        settleTransfer(_from, _to, _tokenId);

        // check if a smart contract
        uint256 size;
        assembly { size := extcodesize(_to) }  // solhint-disable-line no-inline-assembly
        if (size > 0) {
            // call on onERC721Received.
            require(EIP721TokenReceiverInterface(_to).onERC721Received(msg.sender, _from, _tokenId, data) == ONERC721RECEIVED_FUNCTION_SIGNATURE);
        }
    }

    /// @notice Transfers the ownership of an NFT from one address to another address
    /// @dev This works identically to the other function with an extra data parameter,
    ///  except this function just sets data to ""
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) public payable
    tokenExists(_tokenId)
    allowedToTransfer(_from, _to, _tokenId) {
        settleTransfer(_from, _to, _tokenId);

        // check if a smart contract
        uint256 size;
        assembly { size := extcodesize(_to) }  // solhint-disable-line no-inline-assembly
        if (size > 0) {
            // call on onERC721Received.
            require(EIP721TokenReceiverInterface(_to).onERC721Received(msg.sender, _from, _tokenId, "") == ONERC721RECEIVED_FUNCTION_SIGNATURE);
        }
    }

    /// @notice Change or reaffirm the approved address for an NFT.
    /// @dev The zero address indicates there is no approved address.
    ///  Throws unless `msg.sender` is the current NFT owner, or an authorized
    ///  operator of the current owner.
    /// @param _approved The new approved NFT controller
    /// @param _tokenId The NFT to approve
    function approve(address _approved, uint256 _tokenId) external payable
    tokenExists(_tokenId)
    allowedToOperate(_tokenId) {
        address owner = ownerOfToken[_tokenId];
        internalApprove(owner, _approved, _tokenId);
    }

    /// @notice Enable or disable approval for a third party ("operator") to manage
    ///  all of `msg.sender`'s assets.
    /// @dev Emits the ApprovalForAll event. The contract MUST allow
    ///  multiple operators per owner.
    /// @param _operator Address to add to the set of authorized operators.
    /// @param _approved True if the operator is approved, false to revoke approval
    function setApprovalForAll(address _operator, bool _approved) external {
        require(_operator != msg.sender); // can't make oneself an operator
        operators[msg.sender][_operator] = _approved;
        emit ApprovalForAll(msg.sender, _operator, _approved);
    }

    /* public View Functions */
    /// @notice Count NFTs tracked by this contract
    /// @return A count of valid NFTs tracked by this contract, where each one of
    ///  them has an assigned and queryable owner not equal to the zero address
    function totalSupply() public view returns (uint256) {
        return allTokens.length;
    }

    /// @notice Find the owner of an NFT
    /// @param _tokenId The identifier for an NFT
    /// @dev NFTs assigned to zero address are considered invalid, and queries
    ///  about them do throw.
    /// @return The address of the owner of the NFT
    function ownerOf(uint256 _tokenId) external view
    tokenExists(_tokenId) returns (address) {
        return ownerOfToken[_tokenId];
    }

    /// @notice Enumerate valid NFTs
    /// @dev Throws if `_index` >= `totalSupply()`.
    /// @param _index A counter less than `totalSupply()`
    /// @return The token identifier for the `_index`th NFT,
    ///  (sort order not specified)
    function tokenByIndex(uint256 _index) external view returns (uint256) {
        require(_index < allTokens.length);
        return allTokens[_index];
    }

    /// @notice Enumerate NFTs assigned to an owner
    /// @dev Throws if `_index` >= `balanceOf(_owner)` or if
    ///  `_owner` is the zero address, representing invalid NFTs.
    /// @param _owner An address where we are interested in NFTs owned by them
    /// @param _index A counter less than `balanceOf(_owner)`
    /// @return The token identifier for the `_index`th NFT assigned to `_owner`,
    ///   (sort order not specified)
    function tokenOfOwnerByIndex(address _owner, uint256 _index) external view
    tokenExists(_tokenId) returns (uint256 _tokenId) {
        require(_index < ownedTokens[_owner].length);
        return ownedTokens[_owner][_index];
    }

    /// @notice Count all NFTs assigned to an owner
    /// @dev NFTs assigned to the zero address are considered invalid, and this
    ///  function throws for queries about the zero address.
    /// @param _owner An address for whom to query the balance
    /// @return The number of NFTs owned by `_owner`, possibly zero
    function balanceOf(address _owner) external view returns (uint256) {
        require(_owner != 0);
        return ownedTokens[_owner].length;
    }

    /// @notice Get the approved address for a single NFT
    /// @dev Throws if `_tokenId` is not a valid NFT
    /// @param _tokenId The NFT to find the approved address for
    // todo: The approved address for this NFT, or the zero address if there is none
    function getApproved(uint256 _tokenId) external view
    tokenExists(_tokenId) returns (address) {
        return approvedOwnerOfToken[_tokenId];
    }

    /// @notice Query if an address is an authorized operator for another address
    /// @param _owner The address that owns the NFTs
    /// @param _operator The address that acts on behalf of the owner
    /// @return True if `_operator` is an approved operator for `_owner`, false otherwise
    function isApprovedForAll(address _owner, address _operator) external view returns (bool) {
        return operators[_owner][_operator];
    }

    /// @notice A distinct Uniform Resource Identifier (URI) for a given asset.
    /// @dev Throws if `_tokenId` is not a valid NFT. URIs are defined in RFC
    ///  3986. The URI may point to a JSON file that conforms to the "ERC721
    ///  Metadata JSON Schema".
    function tokenURI(uint256 _tokenId) external view returns (string) {
        return tokenURIs[_tokenId];
    }

    /// @notice Query if a contract implements an interface
    /// @param interfaceID The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    ///  uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    /// `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(bytes4 interfaceID) external view returns (bool) {

        if (interfaceID == ERC721_BASE_INTERFACE_SIGNATURE ||
        interfaceID == ERC721_METADATA_INTERFACE_SIGNATURE ||
        interfaceID == ERC721_ENUMERABLE_INTERFACE_SIGNATURE) {
            return true;
        } else { return false; }
    }

    /* -- Internal Functions -- */
    function checkIfAllowedToOperate(uint256 _tokenId) internal view returns (bool) {
        return ownerOfToken[_tokenId] == msg.sender || operators[ownerOfToken[_tokenId]][msg.sender];
    }

    function internalApprove(address _owner, address _approved, uint256 _tokenId) internal {
        require(_approved != _owner); //can't approve to owner to itself

        // Note: the following code is equivalent to: require(getApproved(_tokenId) != 0) || _approved != 0);
        // However: I found the following easier to read & understand.
        if (approvedOwnerOfToken[_tokenId] == 0 && _approved == 0) {
            revert(); // add reason for revert?
        } else {
            approvedOwnerOfToken[_tokenId] = _approved;
            emit Approval(_owner, _approved, _tokenId);
        }
    }

    function settleTransfer(address _from, address _to, uint256 _tokenId) internal {
        //clear pending approvals if there are any
        if (approvedOwnerOfToken[_tokenId] != 0) {
            internalApprove(_from, 0, _tokenId);
        }

        removeToken(_from, _tokenId);
        addToken(_to, _tokenId);

        emit Transfer(_from, _to, _tokenId);
    }

    function addToken(address _to, uint256 _tokenId) internal {
        // add new token to all tokens
        allTokens.push(_tokenId);
        // add new token to index of all tokens.
        allTokensIndex[_tokenId] = allTokens.length-1;

        // set token to be owned by address _to
        ownerOfToken[_tokenId] = _to;
        // add that token to an array keeping track of tokens owned by that address
        ownedTokens[_to].push(_tokenId);
        // add newly pushed to index.
        ownedTokensIndex[_tokenId] = ownedTokens[_to].length-1;
    }

    function removeToken(address _from, uint256 _tokenId) internal {

        // remove token from allTokens array.
        uint256 allIndex = allTokensIndex[_tokenId];
        uint256 allTokensLength = allTokens.length;
        //1) Put last tokenID into index of tokenID to be removed.
        allTokens[allIndex] = allTokens[allTokensLength - 1];
        //2) Take last tokenID that has been moved to the removed token & update its new index
        allTokensIndex[allTokens[allTokensLength-1]] = allIndex;
        //3) delete last item (since it's now a duplicate)
        delete allTokens[allTokensLength-1];
        //4) reduce length of array
        allTokens.length -= 1;

        // remove token from owner array.
        // get the index of where this token is in the owner's array
        uint256 ownerIndex = ownedTokensIndex[_tokenId];
        uint256 ownerLength = ownedTokens[_from].length;
        /* Remove Token From Index */
        //1) Put last tokenID into index of token to be removed.
        ownedTokens[_from][ownerIndex] = ownedTokens[_from][ownerLength-1];
        //2) Take last item that has been moved to the removed token & update its index
        ownedTokensIndex[ownedTokens[_from][ownerLength-1]] = ownerIndex;
        //3) delete last item (since it's now a duplicate)
        delete ownedTokens[_from][ownerLength-1];
        //4) reduce length of array
        ownedTokens[_from].length -= 1;

        delete ownerOfToken[_tokenId];
    }
}

// File: contracts\artifaqt\Artifaqt.sol

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
