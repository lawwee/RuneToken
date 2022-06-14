// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.4;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RuneERC20 is ERC20 {

    uint _totalSupply = 1000000000;
    address private admin;

    mapping (address => uint) _balances;

    constructor () ERC20("Rune Token", "RUNES") {
        admin = msg.sender;
        _mint(admin, _totalSupply);
        _balances[admin] = _totalSupply;
        console.log("Creation successful");
    }

    function totalSupply() public view override returns (uint) {
        console.log("Total supply of coin is", _totalSupply);
        return _totalSupply;
    }

    function balanceOf(address account) public view override returns(uint) {
        console.log("Current balance of account is:", _balances[account]);
        return _balances[account];
    }

    function transfer(address _to, uint amount) public override returns (bool) {
        require(msg.sender == admin, "You do not own this contract");
        address owner = admin;
        _transfer(owner, _to, amount);
        console.log("Transfer successful");
        return true;
    }

    function _transfer(address from, address to, uint256 amount) internal override {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(from, to, amount);

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[from] = fromBalance - amount;
        }
        _balances[to] += amount;

        emit Transfer(from, to, amount);

        _afterTokenTransfer(from, to, amount);
        console.log("Successful");
    }

    function transferFrom(address from, address to, uint amount) public override returns(bool) {
        require(msg.sender == from, "You do not own this address");
        _transfer(from, to, amount);
        return true;
    }

    function mint(address to, uint amount) external {
        require(msg.sender == admin, "You are not an admin");
        require(to == admin, "You cannot mint new tokens to this address");

        _totalSupply += amount;
        _balances[to] += amount; 
        _mint(to, amount);
    }

    function burn(address account, uint amount) external {
        require(msg.sender == account, "You do not own this account");
        uint currentBalance = _balances[account];
        require(currentBalance >= amount, "You cannot burn more than your balance");
        unchecked {
            _balances[account] = currentBalance - amount;
        }
        _totalSupply -= amount;
    }

}