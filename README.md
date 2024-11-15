# ERC20 Demostration 

## Overview
This project is an Ethereum-based ERC-20 token contract called **MetaToken (MTN)**. The contract implements basic functionalities such as minting, burning, and transferring tokens. It is built using Solidity and leverages OpenZeppelin's robust libraries for secure and modular smart contract development.

---

## Features
1. **ERC-20 Compliance**:
   - Implements the standard ERC-20 interface to ensure compatibility with wallets, exchanges, and dApps.

2. **Minting**:
   - Allows the creation of new tokens by authorized users.

3. **Burning**:
   - Enables token destruction to reduce the total supply.

4. **Custom Token Details**:
   - Token Name: **MetaToken**
   - Token Symbol: **MTN**

5. **Ownership**:
   - Uses the `Ownable` pattern to secure administrative functions.

---

## Prerequisites
Before deploying or interacting with the contract, ensure you have the following:
1. **Solidity Compiler**: Version `^0.8.0` or later.
2. **Node.js**: Installed for dependency management.
3. **OpenZeppelin Contracts**: Imported for secure token standard implementation.

---

## Deployment Instructions
1. Clone this repository or copy the contract code.
2. Compile the contract using a Solidity IDE (e.g., Remix, Hardhat).
3. Deploy the contract to your desired Ethereum-compatible network.

---

## Contract Explanation 

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CustomERC20Token is ERC20, Ownable(msg.sender) {

    string public TokenName = "MetaToken";
    string public TokenSymbol = "MTN";

    constructor() ERC20(TokenName,TokenSymbol) {
    }

    function mint(address to, uint256 amount) public {
        _mint(to,amount);
    }

    function burn(address to, uint256 amount) public {
        _burn(to,amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
}
```

## Functions

### Constructor
```solidity
constructor() ERC20(TokenName, TokenSymbol) {}
```
- Initializes the token with the specified name and symbol.

### Mint
```solidity
function mint(address to, uint256 amount) public
```
- **Purpose**: Mints new tokens to the specified address.
- **Parameters**:
  - `to`: Address to receive the minted tokens.
  - `amount`: Number of tokens to mint.

### Burn
```solidity
function burn(address to, uint256 amount) public
```
- **Purpose**: Burns tokens from the specified address.
- **Parameters**:
  - `to`: Address whose tokens will be burned.
  - `amount`: Number of tokens to burn.

### Transfer
```solidity
function transfer(address recipient, uint256 amount) public override returns (bool)
```
- **Purpose**: Transfers tokens from the caller to the recipient.
- **Parameters**:
  - `recipient`: Address to receive the tokens.
  - `amount`: Number of tokens to transfer.

---

## Security Considerations
1. **Access Control**: 
   - Ensure only trusted parties have access to mint and burn functions.
2. **Token Supply Management**:
   - Monitor the mint and burn activity to prevent misuse.

---

## License
This project is licensed under the MIT License. See the [LICENSE](https://opensource.org/license/mit) file for details.

---

### Disclaimer
Use this contract at your own risk. Ensure you understand the implementation and conduct thorough testing before deploying it to a production network.
