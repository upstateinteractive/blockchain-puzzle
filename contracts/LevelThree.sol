pragma solidity ^0.4.17;

import "./LevelTwo.sol";

contract LevelThree is LevelTwo { 

	// 	amount a user has to pay to make a guess
    uint payToPlayFee = .01 ether;

	function levelThree(uint answer) public payable returns (bool) {
			
			uint level = currentLevel(msg.sender);		

			require(msg.value == payToPlayFee);

			if (level == 3 && answer == 3) {

				incrementLevel();

				return true;
			}
			else {

            	return false;
        	}
		}

}
