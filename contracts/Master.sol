pragma solidity ^0.4.17;

import "./puzzles.sol";

contract Master is Puzzles {  
  
  // amount a user has to pay to make a guess
  uint payToPlayFee = .01 ether;

  function payToPlay() external payable {
    require(msg.value == payToPlayFee);
    canPlay[msg.sender] = true;
  }

  function withdraw() external onlyCFO {
    uint balance = this.balance;

    cfoAddress.transfer(balance / 2);
  }

}
