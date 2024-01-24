// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract TokenEscrow {}

/* 
Create a contract where a buyer can put an arbitrary ERC20 token into a contract and a seller can withdraw it 3 days later.
Based on your readings above, what issues do you need to defend against? 
Create the safest version of this that you can while guarding against issues that you cannot control. 
Does your contract handle fee-on transfer tokens or non-standard ERC20 tokens.
*/
