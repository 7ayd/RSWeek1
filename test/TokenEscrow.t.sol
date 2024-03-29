// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.20;

import {Test} from "forge-std/test.sol";
import {console} from "forge-std/console.sol";
import {TokenEscrow} from "../src/TokenEscrow.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BaseSetup is Test {
    TokenEscrow internal escrow;

    address withdrawer;
    address depositor;
    IERC20 token;
    uint256 ammount;
    uint256 createdAt;
    bool withdrawn;

    function setUp() public virtual {
        escrow = new TokenEscrow();
    }
}

contract TokenEscrowTest is BaseSetup {
    function setUp() public override {
        super.setUp();
    }

    function testStartEscrow() public {
        withdrawer = vm.addr(1);
        depositor = vm.addr(2);
        token = IERC20(vm.addr(3));
        ammount = 100;
        createdAt = block.timestamp;
        withdrawn = false;

        escrow.startEscrow(depositor, withdrawer, token, ammount);
        console.log("Escrow created");
    }
}
