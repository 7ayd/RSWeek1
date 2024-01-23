// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.20;

import {Test} from "forge-std/test.sol";
import {console} from "forge-std/console.sol";
import {GodModeToken} from "../src/GodModeToken.sol";

contract BaseSetup is Test {
    GodModeToken internal myContract;

    address internal owner;
    address internal user1;
    address internal user2;
    address internal bannedUser;

    function setUp() public virtual {
        owner = vm.addr(99);
        vm.label(owner, "owner");

        user1 = vm.addr(1);
        vm.label(user1, "user1");

        user2 = vm.addr(2);
        vm.label(user2, "user2");

        bannedUser = vm.addr(3);

        vm.prank(owner);
        myContract = new GodModeToken("Sanctioned", "SAN");
    }
}
