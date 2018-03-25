pragma solidity ^0.4.17;

import "./UserFactory.sol";

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

			uint currentLevel = findLevel(msg.sender); 

			require(msg.value == payToPlayFee);

			if (currentLevel == 1 && answer == 1) {
				incrementLevel();
			}
    }

	function levelTwo(uint answer) public payable {
		//	userAnswer[msg.sender] = answer;	
			
			uint currentLevel = findLevel(msg.sender);		

			require(msg.value == payToPlayFee);

			if (currentLevel ==2 && answer == 2) {
				incrementLevel();
			}
		}

	function finalLevel(uint answer) public payable {
	//	userAnswer[msg.sender] = answer;

		uint currentLevel = findLevel(msg.sender);
	
		require(msg.value == payToPlayFee);

		if (currentLevel == 10 && answer == 5) {
			payWinner();
			incrementLevel();
		}
    }
}
