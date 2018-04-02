pragma solidity ^0.4.17;

import "./Ownable.sol";
import "./safemath.sol";

contract UserFactory is Ownable {  

    // @dev Definition of User struct and its grouped list of variables
    using SafeMath for uint;

    struct User {

        string name;
	    
        uint level;

    }

    event IncrementUserLevel(address indexed from);

    // @dev An array containing the User struct for all Users
    User[] public users;

    // @dev Takes a user's address and maps to their corresponding level in the game
    mapping(address => uint) public userLevel; 

    // @dev Takes a level from the game and maps to an Array of users at that level
    mapping(uint => User[]) levelToUsers;

    // Saving this in case we need it later
    // uint id = users.push(User(level)) -1;

    // @dev This function is called when a users makes a correct guess on puzzles 1-5
    function incrementLevel() internal {
	
	   IncrementUserLevel(msg.sender); 

        uint level = currentLevel(msg.sender);      

        if (level == 0) {

            userLevel[msg.sender] = userLevel[msg.sender].add(2);

        } else {
            
            userLevel[msg.sender] = userLevel[msg.sender].add(1);

        }

    }

    // @dev This function is used to find the level a user is currently on 
    // @param This function takes in a user's address as the argument
    function currentLevel(address userAddress) public constant returns (uint) {

	    return userLevel[userAddress];

    }

}
