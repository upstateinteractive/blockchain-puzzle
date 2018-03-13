pragma solidity ^0.4.17;

import "./puzzleaccesscontrol.sol";

contract UserFactory is PuzzleAccessControl {  

    struct User {
	    uint level;
    }

    // array containing the User struct for all Users
    User[] public users;

    // a mapping from owner address to their userLevel
    mapping(address => uint) public userLevel; 

    mapping (address => bool) canPlay;

    function assignLevel() public {
        uint level = 1;
        userLevel[msg.sender] = level;
            // uint id = users.push(User(level)) -1;
    }

    function incrementLevel() public {
	    userLevel[msg.sender]++;
        canPlay[msg.sender] = false;
    }

    function findLevel(address userAddress) public constant returns (uint) {
	    return userLevel[userAddress];
    }

}
