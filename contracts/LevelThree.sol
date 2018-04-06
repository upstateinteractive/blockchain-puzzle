pragma solidity ^0.4.17;

import "./LevelTwo.sol";

contract LevelThree is LevelTwo { 

	// @dev This is the amount of ETH a user has to spend to make a guess
    uint payToPlayFee = .01 ether;

    // @dev If a user guesses correctly, the incrementLevel() is called and they advance to the next level 
	function levelThree(uint answer) public payable returns (bool) {
			
			uint level = currentLevel(msg.sender);		

			require(msg.value == payToPlayFee);

			if (level == 3 && answer == 3) {
				removeFromPriorLevel();

				incrementLevel();

				return true;
			}
			else {

            	return false;
        	}
		}

}
