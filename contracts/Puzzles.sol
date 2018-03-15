pragma solidity ^0.4.17;

import "./userfactory.sol";

contract Puzzles is UserFactory { 

	// amount a user has to pay to make a guess
  	uint payToPlayFee = .01 ether;

//    mapping(address => uint) public userAnswer;   

//    UserFactory user = UserFactory(UserFactoryAddress);

    function payWinner() internal {
        uint balance = this.balance;
        owner.transfer(balance / 2);
        msg.sender.transfer(balance / 2);
    }

    function levelOne(uint answer) public payable {
		//	userAnswer[msg.sender] = answer;	
			require(msg.value == payToPlayFee);
			if (answer == 1) {
				incrementLevel();
			}
    }

	function levelTwo(uint answer) public payable {
		//	userAnswer[msg.sender] = answer;	
			require(msg.value == payToPlayFee);
			if (answer == 2) {
				incrementLevel();
			}
		}

	function finalLevel(uint answer) public payable {
	//	userAnswer[msg.sender] = answer;	
		require(msg.value == payToPlayFee);
		if (answer == 5) {
			payWinner();
			incrementLevel();
		}
    }
}
