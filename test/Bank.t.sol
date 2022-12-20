// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Bank.sol";

contract BankTest is Test {
    Bank public bank;

    function setUp() public {
        bank = new Bank();
    }

    function testDeposit() public {
	console.log("Depositing 5 eth to %s", msg.sender);
	bank.deposit();
        assertEq(bank.getBalance(), 5);
	console.log("New balance: %s", bank.getBalance());
    }
}
