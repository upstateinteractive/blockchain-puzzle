pragma solidity ^0.4.17;

contract Ownable {
 
  address public owner;
 
  // he Ownable constructor sets the original `owner` of the contract to the sender
  function Ownable() public {
    owner = msg.sender;
  }
 
  // Throws if called by any account other than the owner.
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
 
  // Allows the current owner to transfer control of the contract to a newOwner.
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));      
    owner = newOwner;
  }
 
}