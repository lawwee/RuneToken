RUNE TOKEN

A basic creation and implementation of an ERC20 token with the name "Rune Token" and symbol "RUNES". It aims to fulfil the standard ERC20 rules, importing the ERC20 token contract from openzeppelin.

The **totalSupply()** function is a public function that returns the total number of tokens that has been minted in supply.

The **balanceOf()** function is a public function that returns the amount of tokens owned by an address. It takes an argument of the interested address and returns the amount of tokens owned.

The **transfer()** function is a public function that sends an amount of tokens from the supply to a specified address. It takes two arguments, _to_ being the address that would recieve the token and _amount_ being the amount of tokens that would be sent to the specified address.

The **__transfer()** function is an internal function used by the public _transfer_ and _transferFrom_ functions to securely send tokens to the desired address.

The **transferFrom()** function is a public function that enables sending of tokens between users. It takes in three arguments; _from_ being the address that wanst to send the tokens, _to_ being the address that would recieve the tokens, and _amount_ being the quantity of tokens that is to be sent.

The **mint()** function is an external function that allows the creation of more tokens in order to increase total supply. It takes in two arguments; _to_ being the address were the tokens would be minted to and _amount_ being the number of tokens that wants to be minted.

The **burn()** function is an external function that allows the burning or destroying of already minted tokens, hence reducing the total supply. It takes in two arguments; _account_ being the address that wishes to burn tokens, and _amount_ being the number of tokens that wishes to be burnt or destroyed.
