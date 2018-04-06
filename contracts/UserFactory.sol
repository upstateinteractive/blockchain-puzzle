pragma solidity ^0.4.17;

import "./Ownable.sol";
import "./safemath.sol";

contract UserFactory is Ownable {  

    // @dev Definition of User struct and its grouped list of variables
    using SafeMath for uint;

    struct UserStruct {
        string name;
        uint level;
    }

    // event IncrementUserLevel(address indexed from);

    // @dev An array containing the User struct for all Users
    UserStruct public users;

    // map an address to their UserStruct
    mapping (address => UserStruct) userStructs;

    // a mapping from userId to the owner address
    mapping(uint => address) public userToOwner; 

    // a dynamic array of addresses
    address[] userAddresses;

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

        // // push user into User array
        // uint id = users.push(UserStruct(name, level)) - 1;

        // // set id to user address
        // userToOwner[id] = msg.sender;

        levelToNumberOfUsers[level]++;
    }

    function incrementLevel() internal {

        // incremenet users level
        userStructs[msg.sender].level++;

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
