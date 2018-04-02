pragma solidity ^0.4.17;

import "./LevelFive.sol";
import "./safemath.sol";

contract LevelSix is LevelFive { 

	using SafeMath for uint;

	// 	amount a user has to pay to make a guess
    uint payToPlayFee = .01 ether;

    function payWinner() internal {

        uint balance = this.balance.div(2);

    //   	balanceToSend = balance.div(2);

        owner.transfer(balance);

        msg.sender.transfer(balance);
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
