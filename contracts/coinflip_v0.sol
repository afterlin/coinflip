import "./Ownable.sol";

pragma solidity 0.6.10;

// SPDX-License-Identifier: UNLICENSED

contract Coinflip00 is Ownable {

  uint public choice;
  uint private res;
  uint public bet;
  uint public balance;

  modifier costs(uint cost){
    require(msg.value>=cost);
    _;
  }

  function getChoice() public view returns (uint){
    return choice;
  }

  function random() public  view returns (uint){
    //res = now % 2;
  //  return now;
    return now % 2;
  }

  function flipping() public payable costs(1 ether) {
    require(msg.value >= 1 ether);
    choice = getChoice();
    res = random();
    bet = msg.value;
    if (res == choice) { bet *= 2;}
    else bet == 0;
    balance += bet;
    //return res;
  }

  function updateBet(uint headTail) private  returns (uint){
    if (res == headTail) {balance *= 2;}
    else balance == 0;
    return balance;
  }

  function withdrawAll() public  onlyOwner returns(uint){
    //checkBet(headTail);
    uint toTransfer = balance;
    balance = 0;
    msg.sender.transfer(toTransfer);
    return toTransfer;
  }
}
