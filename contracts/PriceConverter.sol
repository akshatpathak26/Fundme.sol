// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

//All functions in library must be internal

library PriceConverter {

    //we need a function to convert msg.value/ether into dollar 
    function getPrice() internal view returns(uint256) {
        //ABI
        // Address of the other contract that we want to interact(ETH/USD)-  0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        
        //Ab aggregator V3 interface contract mein jitne bhi variable honge i can access them 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,) = priceFeed.latestRoundData();
        //ETH in terms of USD
        // 3000.00000000]
        return uint256(price * 1e10); // 1**10 == 100000000000

    }



    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice(); //ETH price in terms of dollar
        //3000.000000000000000000 ETH / USD price
        // 1.000000000000000000 ETH
        
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1**18; //how much eth we are sending in total converted into usd
        return ethAmountInUsd;
    }
    

}