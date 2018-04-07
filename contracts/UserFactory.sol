pragma solidity ^0.4.17;

import "./Ownable.sol";
import "./safemath.sol";

contract UserFactory is Ownable {  

    using SafeMath for uint;

    // @dev Definition of User struct and its grouped list of variables
    struct User {
        string name;
        uint level;
    }

    // event IncrementUserLevel(address indexed from);

    // map an address to their User struct
    mapping (address => User) userStructs;

    // a dynamic array of addresses
    address[] public userAddresses;

    // a mapping from level to number of users
    mapping(uint => uint) levelToNumberOfUsers;

    function createUser(string name) public {

        // push address into userAddresses array
        userAddresses.push(msg.sender);

        // set user name
        userStructs[msg.sender].name = name;

        // set user level to 1
        userStructs[msg.sender].level = 1;

        uint level = currentLevel(msg.sender); 

        // increment number of users in level
        levelToNumberOfUsers[level]++;
    }

    function incrementLevel() internal {

        // incremenet users level
        userStructs[msg.sender].level++;

        uint level = currentLevel(msg.sender); 

        // increment number of users in new level
        levelToNumberOfUsers[level]++;

    }

    function removeFromPriorLevel() internal {
        uint level = currentLevel(msg.sender); 

        // decrement number of users in prior level. This is fired before the incrementLevel function
        levelToNumberOfUsers[level]--;
    }

    // @dev This function is used to find the level a user is currently on 
    // @param This function takes in a user's address as the argument
    function currentLevel(address userAddress) public constant returns (uint) {
        return userStructs[userAddress].level;
    }

    function numberOfUsers() public constant returns (uint) {
        return userAddresses.length;
    }

    function numberOfUsersPerLevel(uint level) public constant returns (uint) {
        return levelToNumberOfUsers[level];
    }

    function getAddressByIndex(uint index) public constant returns (address) {
        return userAddresses[index];
    }

    // return an address[] array with all the user addresses a level has
    function usersInLevel(uint _level) external view returns (address[]) {
        address[] memory result = new address[](levelToNumberOfUsers[_level]);
        uint counter = 0;
        for (uint i = 0; i < userAddresses.length; i++) {
            if(userStructs[userAddresses[i]].level == _level) {
                result[counter] = userAddresses[i];
                counter++;
            }
        }
        return result;
    }

}
