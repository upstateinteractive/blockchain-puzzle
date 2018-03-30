pragma solidity ^0.4.17;

import "./LevelOne.sol";

contract LevelTwo is LevelOne { 

	// 	amount a user has to pay to make a guess
    uint payToPlayFee = .01 ether;

	function levelTwo(uint answer) public payable returns (bool) {
			
			uint level = currentLevel(msg.sender);		

			require(msg.value == payToPlayFee);

			if (level == 2 && answer == 2) {

				incrementLevel();

				return true;
			}
			else {

            	return false;
        	}
		}

}
