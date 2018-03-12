pragma solidity ^0.4.17;

import "./UserFactory.sol";

contract Puzzles { 

//    mapping(address => uint) public userAnswer;   

//    UserFactory user = UserFactory(UserFactoryAddress);

    function levelOne(uint answer) public returns (bool success) {
//	userAnswer[msg.sender] = answer;	

	if(answer == 1)
	    incrementLevel();
	    return true;	
    }

}
