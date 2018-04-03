pragma solidity ^0.4.17;

import "./LevelFive.sol";
import "./safemath.sol";

contract LevelSix is LevelFive { 

	using SafeMath for uint;

	// @dev This is the amount of ETH a user has to spend to make a guess
    uint payToPlayFee = .01 ether;

	// @dev This function is called when a user completes all of the levels
	// @dev Half of the ETH in the contract is transfed to the winner (i.e., msg.sender), the other half is shared with the owner of this contract (i.e., our dev team)  
    function payWinner() internal {

        uint balance = this.balance.div(2);

        owner.transfer(balance);

        msg.sender.transfer(balance);
    }


    // @dev The final level in the game -- if a user guesses correctly, they are paid for completing all of the puzzles
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
