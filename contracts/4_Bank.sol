// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Bank {
  //状态变量，用于存储合约所有者的地址
  //imutable变量在部署时赋值后不可能更改
  address public immutable owner;
  //用于记录存款操作，包含存款地址和金额
  event Deposit(address indexed, uint256 amount);
  //用于记录取款操作，包含取款金额
  event Withdraw(uint256 amount);

  //receive函数，用于接受以太币转账是自动调用
  receive() external payable {
    //触发Deposit事件，记录存款地址和金额
    emit Deposit(msg.sender, msg.value);
  }

  //构造函数，在合约部署时执行，设置合约所有者并接收初始资金
  constructor() payable {
    owner = msg.sender;
  }

  //提现函数
  function WithdrawFunds() external {
    //检查调用者是否为合约者
    require(msg.sender == owner, 'not owner');
    //触发withdraw事件，记录取款金额,获得当前以太币余额
    emit Withdraw(address(this).balance);

    //销毁合约并将剩余的资金转移给所有者
    //selfdestruct方法已经被弃用
    //selfdestruct(payable(msg.sender));
  }
}
