// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.4;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract RuneERC20 is ERC20 {

    uint _totalSupply = 10000 * 10 ** decimals();
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

   
}