// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

import "./SimpleStorage.sol";


//This is inheritence when you say the contract X is Y, in this way all the functions will be inherited from SimpleStorage 
//and we can add even more functionalities to it
 
contract ExtraStorage is SimpleStorage {

function store(uint256 _favoriteNumber) public override{
    favoriteNumber = _favoriteNumber + 5;
}

}