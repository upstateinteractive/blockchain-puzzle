pragma solidity ^0.4.17;

library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}

contract DougToken {
    using SafeMath for uint;

    mapping (address => uint) public balances;
    address public owner;
    uint _totalSupply = 1000;

    event Transfer(address indexed from, address indexed to, uint tokens);

    function DougToken(uint _totalSupply) public {
        owner = msg.sender;
        balances[msg.sender] = _totalSupply;
    }

    function totalSupply() public constant returns (uint theTotalSupply) {
	theTotalSupply = _totalSupply; 
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
}

