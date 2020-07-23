import "./Ownable.sol";

pragma solidity 0.6.10;

// SPDX-License-Identifier: UNLICENSED

contract Coinflipl01  {

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
    return now % 2;
  }

  function flipping() public payable costs(1 ether){
    uint time = block.timestamp;
    uint bet = msg.value;
    uint bet2 = 3*bet;
    if (time % 2 ==0){
      msg.sender.transfer(bet2);
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
