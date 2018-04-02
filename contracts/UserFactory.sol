pragma solidity ^0.4.17;

import "./Ownable.sol";
import "./safemath.sol";

contract UserFactory is Ownable {  
    using SafeMath for uint;

    struct User {

        string name;
	    
        uint level;

    }

    event IncrementUserLevel(address indexed from);

    // array containing the User struct for all Users
    User[] public users;

    // a mapping from owner address to their userLevel
    mapping(address => uint) public userLevel; 

    // a mapping from levels to the users in them
    mapping(uint => User[]) levelToUsers;

    // Saving this in case we need it later
    // uint id = users.push(User(level)) -1;

    function incrementLevel() internal {
	
	   IncrementUserLevel(msg.sender); 

        uint level = currentLevel(msg.sender);      

        if (level == 0) {

            userLevel[msg.sender] = userLevel[msg.sender].add(2);

        } else {
            
            userLevel[msg.sender] = userLevel[msg.sender].add(1);

        }

    }

    function currentLevel(address userAddress) public constant returns (uint) {

	    return userLevel[userAddress];

    }

}
