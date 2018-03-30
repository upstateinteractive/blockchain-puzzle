pragma solidity ^0.4.17;

import "./UserFactory.sol";

contract Puzzles is UserFactory { 

// 	amount a user has to pay to make a guess
    uint payToPlayFee = .01 ether;

    function payWinner() internal {

        uint balance = this.balance;

        owner.transfer(balance / 2);

        msg.sender.transfer(balance / 2);
    }

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

	function levelSix(uint answer) public payable returns (bool) {

		uint level = currentLevel(msg.sender);
	
		require(msg.value == payToPlayFee);

		if (level == 6 && answer == 6) {

			payWinner();
			
			incrementLevel();
		}
		else {

            return false;
        }
    }
}
