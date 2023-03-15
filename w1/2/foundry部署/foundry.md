# 下载widnows编译好的版本

加入环境变量

记得 cmd环境全局代理翻墙

#  forge 

## 一 插件安装

```shell
forge install openzeppelin/openzeppelin-contracts
```

```shell
forge install foundry-rs/forge-std
```

https://github.com/foundry-rs/forge-std

删除依赖

```javascript
forge remove foundry-rs/forge-std
```



重新映射依赖项

``` forge remappings```

## 二 编译与测试

```forge build```

```forge test

```

## 三 部署

```shell
// 部署到链上
--broadcast
// 开源合约代码
--verify
```



发布合约 在以太坊上验证的 开源合约代码的

```shell
forge create --rpc-url <your_rpc_url> \

 --private-key <your_private_key> src/Counter.sol:Counter \   

 --etherscan-api-key <your_etherscan_api_key> \    

--verify 
```

实际上就是这样的()

```shell
forge create --rpc-url https://goerli.infura.io/v3/b8ead90xxxxxxc0df41ca874d8b \
 --private-key fb38f18a3f0223a7677ec6dxxxxxx519c962151a31c758ae8b \ src/Counter.sol:Counter \   
 --etherscan-api-key AHGQI8NxxxxxxNN9KBFG6Q \    --verify 
```

会有一个等待的过程,不会很久的



  https://goerli.etherscan.io/address/0x03636ad8f7dbe432d3cb26c84a2a601885a122bf



引申 验证已部署的合约

```shell
 forge verify-contract 
```













https://learnblockchain.cn/docs/foundry/i18n/zh/index.html

