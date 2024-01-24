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
    address internal godModeuser;

    function setUp() public virtual {
        owner = vm.addr(99);
        vm.label(owner, "owner");

        user1 = vm.addr(1);
        vm.label(user1, "user1");

        user2 = vm.addr(2);
        vm.label(user2, "user2");

        godModeuser = vm.addr(3);

        vm.prank(owner);
        myContract = new GodModeToken("Sanctioned", "SAN");
    }
}

contract GodModeTokenTest is BaseSetup {
    function setUp() public override {
        super.setUp();
    }

    function testOwner() public {
        address _owner = myContract.owner();
        assertEq(_owner, owner);
    }

    function testGodModeTransfer() public {
        vm.prank(owner);
        uint256 toMintValue = 50_000_000 * 10 ** 18;
        myContract.mint(user1, toMintValue);
        uint256 valueUser = myContract.balanceOf(user1);
        assertEq(valueUser, toMintValue);
        console.log("User value = %s", valueUser);

        myContract.godTransfer(user1, user2, toMintValue);
        uint256 valueUser2 = myContract.balanceOf(user2);
        assertEq(valueUser2, toMintValue);
        console.log("User2 value = %s", valueUser2);
    }
}
