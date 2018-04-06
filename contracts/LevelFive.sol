pragma solidity ^0.4.17;

import "./LevelFour.sol";

contract LevelFive is LevelFour { 

	// @dev This is the amount of ETH a user has to spend to make a guess
    uint payToPlayFee = .01 ether;

    // @dev If a user guesses correctly, the incrementLevel() is called and they advance to the next level 
	function levelFive(uint answer) public payable returns (bool) {
			
			uint level = currentLevel(msg.sender);		

			require(msg.value == payToPlayFee);

			if (level == 5 && answer == 5) {
				removeFromPriorLevel();

				incrementLevel();

				return true;
			}
			else {

            	return false;
        	}
		}

}
