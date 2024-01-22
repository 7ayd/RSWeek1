// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract TokenSale is ERC20 {
    uint256 public currentPrice;
    uint256 public startPrice = 1 ether;
    uint256 public priceIncriment = 0.01 ether;

    event Mint(address _address, uint256 _amount);
    event Burn(address _address, uint256 _amount);

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}

    function getPrice() public view returns (uint256) {
        return currentPrice;
    }

    function buyAndMint(address _to, uint256 _amount) public payable {
        require(msg.value == currentPrice, "Must send exact price");
        _mint(_to, _amount);
        emit Mint(_to, _amount);
    }

    function sellAndBurn(address _from, uint256 _amount) public {
        require(balanceOf(_from) >= _amount, "Must have enough tokens to sell");
        _burn(_from, _amount);
        emit Burn(_from, _amount);
        SafeERC20.safeTransfer(IERC20(address(this)), _from, currentPrice);
    }

    function calulatePrice() public view returns (uint256) {
        return currentPrice;
    }
}

//What functions do we need for a token sale with a linear bond sale?
// ability to set the current price with a bond curve
// ability to buy tokens
// ability to sell tokens
//ab

// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions
