// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Bank {
	mapping(address => uint) public balances;
	constructor() {
	}

	function deposit() external payable returns (uint) {
		require(msg.value >= 0, "Can't deposit a negative balance");
		balances[msg.sender] += msg.value;
		return balances[msg.sender];
	}

	function withdraw(uint _amount) external payable {
		require(_amount >= 0, "Can't withdraw a negative balance");
		require(balances[msg.sender] >= _amount, "Insufficient balance");
		payable(msg.sender).transfer(_amount);
		balances[msg.sender] -= _amount;
	}

	function getBalance() external view returns (uint) {
		return balances[msg.sender];	
	}
}

