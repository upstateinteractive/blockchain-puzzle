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

    // event IncrementUserLevel(address indexed from);

    // @dev An array containing the User struct for all Users
    User[] public users;

    // a mapping from userId to the owner address
    mapping(uint => address) public userToOwner; 

    // a mapping from owner address to their userLevel
    mapping(address => uint) public userLevel; 

    // a mapping from level to number of users
    mapping(uint => uint) levelToNumberOfUsers;

    function createUser(string name) public {
        // set user level to 1
        userLevel[msg.sender] = 1;
        uint level = currentLevel(msg.sender); 

        // push user into User array
        uint id = users.push(User(name, level)) - 1;

        // set id to user address
        userToOwner[id] = msg.sender;

        levelToNumberOfUsers[level]++;
    }

    function incrementLevel() internal {
        // IncrementUserLevel(msg.sender); 
        userLevel[msg.sender]++;
        
        uint level = currentLevel(msg.sender); 
        levelToNumberOfUsers[level]++;

    }

    function removeFromPriorLevel() internal {
        uint level = currentLevel(msg.sender); 
        levelToNumberOfUsers[level]--;
    }

    // @dev This function is used to find the level a user is currently on 
    // @param This function takes in a user's address as the argument
    function currentLevel(address userAddress) public constant returns (uint) {
        return userLevel[userAddress];
    }

    function numberOfUsersPerLevel(uint level) public constant returns (uint) {
        return levelToNumberOfUsers[level];
    }

    // return an address[] array with all the user addresses a level has
    function usersInLevel(uint _level) external view returns (address[]) {
        address[] memory result = new address[](levelToNumberOfUsers[_level]);
        uint counter = 0;
        for (uint i = 0; i < users.length; i++) {
            if(users[i].level == _level) {
                result[counter] = userToOwner[i];
                counter++;
            }
        }
        return result;
    }

}
