// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract TokenEscrow {
    using SafeERC20 for IERC20;

    address withdrawer;
    address depositor;
    IERC20 token;
    uint256 ammount;
    uint256 createdAt;
    bool withdrawn;

    event EscrowCreated(address withdrawer, address depositor, IERC20 indexed token, uint256 ammount);
    event EscrowWithdrawn(address withdrawer, address depositor, IERC20 indexed token, uint256 ammount);

    function startEscrow(address _depositor, address _withdrawer, IERC20 _token, uint256 _ammount) public {
        //Checks
        require(_depositor != address(0), "depositer cannot be zero address");
        require(_withdrawer != address(0), "withdrawer cannot be zero address");
        require(_token != IERC20(address(0)), "token cannot be zero address");
        require(_ammount > 0, "ammount must be greater than 0");

        //Effects
        withdrawer = _withdrawer;
        depositor = _depositor;
        token = _token;
        ammount = _ammount;
        createdAt = block.timestamp;
        withdrawn = false;

        //Interactions
        emit EscrowCreated(_withdrawer, _depositor, _token, _ammount);
    }

    function withdrawEscrow() public {
        require(msg.sender == withdrawer, "Not withdrawer");
    }
}

/* 
Create a contract where a buyer can put an arbitrary ERC20 token into a contract and a seller can withdraw it 3 days later.
Based on your readings above, what issues do you need to defend against? 
Create the safest version of this that you can while guarding against issues that you cannot control. 
Does your contract handle fee-on transfer tokens or non-standard ERC20 tokens.
*/

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
