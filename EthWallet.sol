// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2;

contract EthWallet{
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    }
    
    receive() external payable { }
    
    function withdraw(uint _amount) external payable {
        require(msg.sender == owner, "not the owner");
        require(msg.value > 0, "withdraw amount must be greater than 0");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}