RUNE TOKEN

A basic creation and implementation of an ERC20 token with the name "Rune Token" and symbol "RUNES". It aims to fulfil the standard ERC20 rules, importing the ERC20 token contract from openzeppelin.

The **totalSupply()** function is a public function that returns the total number of tokens that has been minted in supply.

The **balanceOf()** function is a public function that returns the amount of tokens owned by an address. It takes an argument of the interested address and returns the amount of tokens owned.

The **transfer()** function is a public function that sends an amount of tokens from the supply to a specified address. It takes two arguments, _to_ being the address that would recieve the token and _amount_ being the amount of tokens that would be sent to the specified address.

The **__transfer()** function is an internal function used by the public _transfer_ function to securely send tokens to the desired address.
