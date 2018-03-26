pragma solidity ^0.4.17;

import "./Ownable.sol";

contract UserFactory is Ownable {  

    struct User {
	    uint level;
    }

    event IncrementUserLevel(address indexed from);

    // array containing the User struct for all Users
    User[] public users;

    // a mapping from owner address to their userLevel
    mapping(address => uint) public userLevel; 

    // a mapping from levels to the users in them
    mapping(uint => User[]) levelToUsers;

    function assignLevel() public {
        uint level = 1;
        userLevel[msg.sender] = level;
            // uint id = users.push(User(level)) -1;
    }

    function incrementLevel() public {
	
	IncrementUserLevel(msg.sender); 
	    
	userLevel[msg.sender]++;
    }

    function findLevel(address userAddress) public constant returns (uint) {
	    return userLevel[userAddress];
    }

}
