pragma solidity ^0.4.17;

import "./userfactory.sol";

contract Puzzles is UserFactory { 

//    mapping(address => uint) public userAnswer;   

//    UserFactory user = UserFactory(UserFactoryAddress);

    function levelOne(uint answer) public {
//	userAnswer[msg.sender] = answer;	
		if (answer == 1) {
			incrementLevel();
			
			// return true;	
		}
    }

	    function levelTwo(uint answer) public {
//	userAnswer[msg.sender] = answer;	

		if (answer == 2) {
			incrementLevel();
			// return true;	
		}
    }
}
