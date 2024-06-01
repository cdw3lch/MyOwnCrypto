// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract MyCryptoToken is ERC20, AccessControl {
    uint totalSupplyOfTokensAvailable = 1000 * 10 ** decimals();
    address owner;

    constructor() ERC20("My Crypto Token", "MCT"){
        owner = msg.sender;
        _mint(msg.sender, 100 * 10 ** decimals());
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function mint (address to, uint256 amount) public onlyRole(DEFAULT_ADMIN_ROLE) {
        require(totalSupply()+ amount <= totalSupplyOfTokensAvailable, "We have no more token to mint");
        _mint(to, amount);
    }
}
