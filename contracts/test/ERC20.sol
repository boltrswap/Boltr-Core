pragma solidity =0.5.16;

import '../BoltrERC20.sol';

contract ERC20 is BoltrERC20 {
    constructor(uint _totalSupply) public {
        _mint(msg.sender, _totalSupply);
    }
}
