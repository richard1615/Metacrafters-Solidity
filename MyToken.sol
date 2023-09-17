// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {
    // Public variables to store token details
    string public tokenName;
    string public tokenAbbrv;
    uint256 public totalSupply;

    // Mapping to store balances of addresses
    mapping(address => uint256) public balances;

    // Constructor to initialize token details and total supply
    constructor(string memory _name, string memory _abbrv, uint256 _initialSupply) {
        tokenName = _name;
        tokenAbbrv = _abbrv;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }

    // Mint function to create new tokens
    function mint(address _receiver, uint256 _value) public {
        totalSupply += _value;
        balances[_receiver] += _value;
    }

    // Burn function to destroy tokens
    function burn(address _account, uint256 _value) public {
        require(balances[_account] >= _value, "Insufficient balance");
        require(_value > 0, "Value must be greater than 0");

        totalSupply -= _value;
        balances[_account] -= _value;
    }
}
