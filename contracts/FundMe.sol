//Get funds from users 
//Withdraw funds
// Set a minumum funding value in USD


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256; 
    
    uint256 public minimumUsd = 50 * 1e18; //1 * 10**18

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {

      

     //payable is the function which allows us to make our contract payable   
     //Want to be able to set a minimum fund amount in USD
     //1. how do we send ETH to this contract
     //msg.value represents how much wei the sender sent

     require(msg.value.getConversionRate() > minimumUsd, "Didnt send enough amt"); //1e18 == 1 * 10 ** 18 

     //require is a checker just like ternory operator in js

    //if the condition didnt get fulfilled then revert will be trigerred that is undo any action 
    //before and send the remaining gas back

    funders.push(msg.sender); //msg.sender global keyword for getting the address of funder
    addressToAmountFunded[msg.sender] = msg.value;
    //                   address      =>  uint256 value

    }

    

    //function Withdraw() {}

}