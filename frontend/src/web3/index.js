import Web3 from 'web3';

import { contractAddress } from '../config';
import { abi } from './abis/Artifaqt.json';

export const web3 = new Web3(Web3.givenProvider);
export const Artifaqt = new web3.eth.Contract(abi, contractAddress);

const sins = {
  "riva-palace-model": 1,
  "vestibul-peristil": 2,
  "na-kantunu": 3,
  "golden-gate": 4,
  "24pointclock": 5,
  "bajamonti-fountain": 6,
  "matejuska": 7
}

export const keys = Object.keys(sins);

const sinToIndex = sin => sins[sin];

export const claimToken = (sin, address, callback, tokenClaimed, receiptRecieved) => {
  const sinHash = web3.utils.sha3(sin);
  const sinPayloadHash = web3.utils.sha3(sinHash + address.substr(2), { encoding: 'hex' });
  const sinIndex = sinToIndex(sin);

  Artifaqt.methods.claimToken(sinPayloadHash)
    .send({ from: address, gasLimit: 500000, gasPrice: 10**10 })
    .on('transactionHash',  hash => {
      tokenClaimed(sinIndex);
      console.log(`hash = ${hash}`)
    })
    .on('receipt', receipt => {
      console.log(receipt)
      receiptRecieved(sinIndex);
      callback();
    })
    .on('error', () => {
      alert(`Something went wrong.
      You probably already have this token`)
      callback()
    });
}

export const claimChest = (chestname, address) => {
  const chest_id = parseInt(chestname.replace("chest_", ""), 10);
  var tx;
  //alert(chest_id);
  if (chest_id > -1 && chest_id < 6) {
    tx = Artifaqt.methods.claimPrize(chest_id);
  } else {
    tx = Artifaqt.methods.claimMasterPrize();
  }
  tx.send({ from: address, gasLimit: 500000, gasPrice: 10**10 })
    .on('transactionHash',  hash => {
      console.log(`hash = ${hash}`)
      //alert(hash);
    })
    .on('receipt', receipt => {
      console.log(receipt)
      alert("You have opened chest " + chest_id + ". Your reward is coming.");
      //callback();
    })
    .on('error', () => {
      if (!(chest_id > -1)) {
        alert("Failed to open master chest :( Report to Bruno if you have all keys but see this message.");
      } else {
      alert(`Something went wrong.
      Are you sure you have this chest's key? You need key ` + chest_id+1 + `.`)
      }
      //callback()
    });
}