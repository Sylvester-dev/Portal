// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Portal {

  uint totalWaves;

  constructor() {
    console.log("Yo yo, I am a contract and I am smart");
  }

  function wave() public{
    totalWaves++;
    console.log("Hey, %s has waved", msg.sender);
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