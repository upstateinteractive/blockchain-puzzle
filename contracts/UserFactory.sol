pragma solidity ^0.4.17;

contract UserFactory {  

    struct User{
	uint level;
    }

    User[] public users;

    mapping(address => uint) public userLevel; 

    function assignLevel(uint _level) public {
	userLevel[msg.sender] = _level;
        uint id = users.push(User(_level)) -1;
    }

    function incrementLevel {
	userLevel[msg.sender]++;
    }

    function findLevel(address userAddress) public constant returns (uint) {
	return userLevel[userAddress];
    }

}
