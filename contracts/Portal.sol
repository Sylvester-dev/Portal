// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Portal {

  uint totalWaves;

  event NewWave(string message, uint timestamp, address indexed from);

  struct Wave{
    string meaasage;
    uint timestamp;
    address waver;
  }

  Wave[] waves;

  constructor() {
    console.log("Yo yo, I am a contract and I am smart");
  }

  function wave(string memory _message) public{
    totalWaves++;
    console.log("Hey, %s has waved with message %s", msg.sender, _message);

    waves.push(Wave(_message, block.timestamp, msg.sender));

    emit NewWave(_message, block.timestamp, msg.sender);
  }
  
  function getAllWaves() public view returns (Wave[] memory) {
        return waves;
  }

  function getTotalWaves() public view returns(uint){
    console.log("Total waves %d", totalWaves);
    return totalWaves;
  }

//   We,
// 1. Called our wave function.
// 2. Changed the state variable.
// 3. Read the new value of the variable.
}