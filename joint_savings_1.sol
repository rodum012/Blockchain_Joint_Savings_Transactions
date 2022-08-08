/*
Joint Savings Account
---------------------
*/

pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {
    // Sets variables for contract
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;
    // Defines a withdrawal function from the account
    function withdraw(uint amount,address payable recipient) public {
        // returns if someone other than the two account owners to withdrawal funds
        require(recipient == accountOne || recipient == accountTwo,"You don't own this account!");
        // returns if try to withdrawal more than the current account balance
        require(amount <= contractBalance, "Insufficient funds!");
        // updates lastToWithdraw variable
        if (lastToWithdraw != recipient) {
            lastToWithdraw == recipient;
        }
        // transfers the funds withdrawn to the recipient
        recipient.transfer(amount);
        // updates lastWithdrawAmount variable 
        lastWithdrawAmount = amount;
        // updates the current contract balance after the withdraw
        contractBalance = address(this).balance;

    }
    // Creates a deposit function to put funds into the account
    function deposit() public payable {
        contractBalance = address(this).balance;  
    }
    // Creates a function to define which accounts are owners of the joint account
    function setAccounts(address payable account1, address payable account2) public {
        accountOne = account1;
        accountTwo = account2;
    }
    // Sets falback function
    function() external payable {}
}

   