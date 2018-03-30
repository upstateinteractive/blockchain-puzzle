pragma solidity ^0.4.17;

import "./LevelFive.sol";

contract LevelSix is LevelFive { 

	// 	amount a user has to pay to make a guess
    uint payToPlayFee = .01 ether;

    function payWinner() internal {

        uint balance = this.balance;

        owner.transfer(balance / 2);

        msg.sender.transfer(balance / 2);
    }

	function levelSix(uint answer) public payable returns (bool) {

		uint level = currentLevel(msg.sender);
	
		require(msg.value == payToPlayFee);

		if (level == 6 && answer == 6) {

			payWinner();
			
		}
		else {

            return false;
        }
    }

}
