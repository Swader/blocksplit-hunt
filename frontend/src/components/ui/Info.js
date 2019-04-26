import React from 'react';

const Info = ({ displayTileInfo, activeTileInfo, closeOverlay, activeNumber, help }) => (
  <div
    className={`infomation-container ${displayTileInfo ? 'visible': ''}`}
  >
    <div className="how-top-play-container">
      <button onClick={() => closeOverlay()}>&times;</button>
    </div>
    {help
      ? <HelpInformation />
      : (
        <div>
          <div className="title-section">
            <div className="tile-container">
              <div className={`tile tile-${activeNumber} tile-info`} />
            </div>
            <h2>{activeTileInfo.get('title')}</h2>
          </div>
          <p>{activeTileInfo.get('description')}</p>
        </div>
      )
    }
  </div>
);


const HelpInformation = () => (
  // <div>
  //   <h3>?&#191;?  how to play  ?&#191;?</h3>
  //   <br />
  //   <br />
  //   <br />
  //   <ol>
  //     <li>Download Status browser on your mobile device.</li>
  //     <li>Scan the qr code to collect the key.</li>
  //     <li>Open the key's chest, or collect all five and open the master chest.</li>
  //   </ol>
  // </div>
  <div>
    
    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <p>Hello, honorable blockchain enthusiast! We have a quest for you.</p>
    <p>We have created five unique conference tokens. To find them, you must carefully <b>read the clues</b> outlined the text shown when you <b>click on the keys</b> and walk around the town to uncover the secret spots described by the clues. You won't have to wander far away – all tokens are located somewhere close to the center of the town. However, the hunt wouldn't be fun if it were too easy, right? You'll have to be cunning and use some deduction skills to decipher the clues and find the locations of the tokens' QR codes.</p>
    <p>You may use whatever means necessary to fulfill this quest. You may be a lone wanderer and search for the tokens by yourself, you may explore the town with a group of like-minded hunters, you may seek the help of the locals, or you may even try to consult the almighty Internet. It's up to you.</p>
    <p>The tokens can earn you some awesome prizes. The discovery of each individual token can earn you a prize, but only if you're the first hunter to find it. If you are lucky enough to find all five tokens, you're in for the grand prize. The prizes can be claimed during the Crypto Party on Saturday night. Good luck!</p>
    <hr/>
    <h2>Instructions</h2>
    <ol>
      <li>Download Status browser on your mobile device.</li>
      <li>Scan the qr code to collect the key.</li>
      <li>Open the key's chest, or collect all five and open the master chest.</li>
    </ol>
  </div>
);

export default Info;