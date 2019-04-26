import React from 'react';

const Network = ({ loading }) =>(
  loading ? <div></div> :
  <div className="network">
    <div className="network-message">
      Hello Bločker! Please connect to the Mainnet after downloading Status on your mobile device &lt;3
    </div>
  </div> 
)

export default Network;
