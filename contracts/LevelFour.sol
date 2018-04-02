pragma solidity ^0.4.17;

import "./LevelThree.sol";

contract LevelFour is LevelThree { 

	// @dev This is the amount of ETH a user has to spend to make a guess
    uint payToPlayFee = .01 ether;

    // @dev If a user guesses correctly, the incrementLevel() is called and they advance to the next level 
	function levelFour(uint answer) public payable returns (bool) {
			
			uint level = currentLevel(msg.sender);		

			require(msg.value == payToPlayFee);

			if (level == 4 && answer == 4) {

				incrementLevel();

				return true;
			}
			else {

            	return false;
        	}
		}

}
