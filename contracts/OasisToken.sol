pragma solidity ^0.4.17;

import "./safemath.sol";

contract OasisToken {
    using SafeMath for uint;

    mapping (address => uint) public balances;
    address public owner;
    uint public theTotalSupply;

    // Owner of account approves the transfer of an amount to another account
    mapping(address => mapping (address => uint256)) allowed;
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    function OasisToken(uint _totalSupply) public {
        owner = msg.sender;
        balances[msg.sender] = _totalSupply;
        theTotalSupply = _totalSupply;
    }

    function totalSupply() public constant returns (uint) {
        return theTotalSupply;
    }

    function balanceOf(address _tokenHolder) public view returns (uint) {
        return balances[_tokenHolder];
    }

    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        Transfer(msg.sender, to, tokens);
        return true;
    }

    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        Transfer(from, to, tokens);
        return true; 
   }

   function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        Approval(msg.sender, spender, tokens);
        return true;
    }

}

