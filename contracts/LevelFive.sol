pragma solidity ^0.4.17;

import "./LevelFour.sol";

contract LevelFive is LevelFour { 

	// 	amount a user has to pay to make a guess
    uint payToPlayFee = .01 ether;

	function levelFive(uint answer) public payable returns (bool) {
			
			uint level = currentLevel(msg.sender);		

			require(msg.value == payToPlayFee);

			if (level == 5 && answer == 5) {

				incrementLevel();

				return true;
			}
			else {

            	return false;
        	}
		}

}
