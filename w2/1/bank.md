

code



```javascript
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract bank {
    address private owner;
    address private sender;
    uint256 private amount;
    uint256 private _totalSupply;

    mapping(address => uint256) private _balances;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        _balances[msg.sender] = msg.value;
        _totalSupply += msg.value;
    }

    function balanceOf(address account) public view virtual returns (uint256) {
        return _balances[account];
    }

    function totalSupply() public view virtual returns (uint256) {
        return _totalSupply;
    }

    //view表示函数不修改状态
    //pure 表示函数不读取状态也不修改状态 不会消耗gas
    //不知道为什么我的这个函数转账显示成功 但是钱包金额 没到账,合约账户余额也没有改变
    function withdrawCreater(
        address addr,
        uint256 tranAmount 
    ) public {
        require(msg.sender == owner, "you do not have the right to withdraw");
        require(tranAmount != 0, "fail,value is zero !");
        (bool success, ) = addr.call{value: tranAmount}(new bytes(0));
        require(success,"Transfer fail");
    }

    function withdrawGuest(address addr, uint256 tranAmount) public {
        require(_balances[msg.sender] >= tranAmount, "token not engougth");
        require(tranAmount != 0, "fail,value is zero !");
        require( addr == msg.sender, "only can withdraw self account");
        _balances[msg.sender] -= tranAmount; 
        (bool success,bytes memory returndata) = addr.call{value:tranAmount}(new bytes(0));
        require(success,"Transfer fail");
    }
}


```

1部署合约

合约地址

 0x0165878A594ca255338adfa4d48449f69242Eb8F 



2 钱包向合约转账

![1678851336899](./1678851336899.png)

3 非合约部署者提现失败

![1678851393896](./1678851393896.png)

4 合约部署者 提现

![1678851428168](./1678851428168.png)

钱包到账

