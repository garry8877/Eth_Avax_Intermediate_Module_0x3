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
