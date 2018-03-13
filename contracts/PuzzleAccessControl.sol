pragma solidity ^0.4.17;

contract PuzzleAccessControl {
    address public cfoAddress;

    // Access modifier for CFO-only functionality
    modifier onlyCFO() {
        require(msg.sender == cfoAddress);
        _;
    }

    // Assigns a new address to act as the CFO. 
    function setCFO(address _newCFO) external {
        require(_newCFO != address(0));

        cfoAddress = _newCFO;
    }
}