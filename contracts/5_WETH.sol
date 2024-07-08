// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract WETH {
  //代币的名称
  string public name = 'Wrapped Ether';
  //代币的符号
  string public symbol = 'WETH';
  //代币的小数位数，通常为18
  uint8 public decimals = 18;

  //事件，用于记录授权操作
  event Approval(
    address indexed src,
    address indexed delegateAds,
    uint256 amount
  );

  //事件，用于记录转账操作
  event Transfer(address indexed src, address indexed toAds, uint256 amount);

  //事件，用于记录存款操作
  event Depsit(address indexed toAds, uint256 amount);

  //事件，用户记录取款操作
  event Withdraw(address indexed src, uint256 amount);

  //映射，用于存储每个地址的余额
  mapping(address => uint) public balanceOf;
  //映射，用于存储每个地址对其他地址的授权额度
  mapping(address => mapping(address => uint256)) public allowance;

  //存款函数，接受以太币并增加存款人的余额
  function deposit() public payable {
    //增加存款人的余额
    balanceOf[msg.sender] += msg.value;
    //触发存款事件
    emit Depsit(msg.sender, msg.value);
  }

  //返回总供应量，即
}
