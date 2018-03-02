pragma solidity ^0.4.17;

contract OasisToken {
    mapping (address => uint) public balances;
    address public owner;

    function OasisToken(uint _totalSupply) public {
        owner = msg.sender;
        balances[msg.sender] = _totalSupply;
    }

    function balanceOf(address _tokenHolder) public view returns (uint) {
        return balances[_tokenHolder];
    }

    
}
