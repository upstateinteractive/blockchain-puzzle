pragma solidity ^0.4.17;

import "./LevelOne.sol";

contract LevelTwo is LevelOne { 

	// @dev This is the amount of ETH a user has to spend to make a guess
    uint payToPlayFee = .01 ether;

    // @dev If a user guesses correctly, the incrementLevel() is called and they advance to the next level 
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
