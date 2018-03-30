pragma solidity ^0.4.17;

import "./LevelThree.sol";

contract LevelFour is LevelThree { 

	// 	amount a user has to pay to make a guess
    uint payToPlayFee = .01 ether;

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
