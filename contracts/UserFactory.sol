pragma solidity ^0.4.17;

contract UserFactory {  

    struct User{
	uint level;
    }

    User[] public users;

    mapping(address => uint) public userLevel; 

    function assignLevel() public {
	uint level = 1;
	userLevel[msg.sender] = level;
        uint id = users.push(User(level)) -1;
    }

    function incrementLevel() public {
	userLevel[msg.sender]++;
    }

    function findLevel(address userAddress) public constant returns (uint) {
	return userLevel[userAddress];
    }

}
