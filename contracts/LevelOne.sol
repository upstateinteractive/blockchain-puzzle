pragma solidity ^0.4.17;

import "./UserFactory.sol";

contract LevelOne is UserFactory { 

	// 	amount a user has to pay to make a guess
    uint payToPlayFee = .01 ether;

    function levelOne(uint answer) public payable returns (bool) {

			uint level = currentLevel(msg.sender); 

			require(msg.value == payToPlayFee);

			if (level == 0 && answer == 1) {

				incrementLevel();

				return true;
			}
			else {

            	return false;
        	}
    }

}
