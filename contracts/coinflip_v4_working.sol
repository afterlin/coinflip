import "./Ownable.sol";

pragma solidity 0.6.10;

// SPDX-License-Identifier: UNLICENSED

contract Coinflip_v4  {

  address owner;
  uint public balance;


  constructor() public{
    owner = msg.sender;
  }

  modifier costs(uint cost){
    require(msg.value>=cost);
    _;
  }

  function getBalance()  public  view returns (uint){
    return balance;
  }

  function random() public view returns (uint){
    return now ;
  }

  function flipHead() public payable costs(1 ether){
    uint time = now % 2;
    uint bet = msg.value;
    uint bet3 = 3*bet;
    if (time  == 0){
      msg.sender.transfer(bet3);
    }
  }

  function flipTail() public payable costs(1 ether){
    uint time = now % 2;
    uint bet = msg.value;
    uint bet3 = 3*bet;
    if (time  == 1){
      msg.sender.transfer(bet3);
    }
  }
  function withdrawAll() public   returns(uint){
    //checkBet(headTail);
    uint toTransfer = balance;
    balance = 0;
    msg.sender.transfer(toTransfer);
    return toTransfer;
  }
}
