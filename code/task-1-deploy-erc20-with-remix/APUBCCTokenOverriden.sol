// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract APUBCCTokenOverriden is ERC20 {
    constructor(uint256 initialSupply) ERC20("APUBCC Token", "ABT") {
        _mint(msg.sender, initialSupply);
    }

    // Just to demonstrate that this token contract with an overriden transfer
    // function that only allow transfers to zero address is still a legit ERC20
    // token, as it has the same interface
    function transfer(
        address to,
        uint256 value
    ) public override returns (bool) {
        require(
            to == address(0),
            "This token can only be transferred to zero address"
        );
        _transfer(msg.sender, to, value);
        return true;
    }
}
