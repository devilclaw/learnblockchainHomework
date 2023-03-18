// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

//等待被Teacher合约部署 不要自己去部署
contract Score {
    address private owner;
    uint256 private socre;
   address private name;

    mapping(address=> uint256) studentsScores;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyTecher() {
        require(msg.sender == owner, "not call by Teacher Contract");
        _;
    }

    function getStudentsScore(address  _n) public view returns (uint256) {
        return studentsScores[_n];
    }

    //internal:只有本sol文件调用
    function setStudentsScore(address  _uname, uint256 _soc)
        external
        payable
        onlyTecher
    {
        require(_soc <= 100, "socre out of orange");
        require(_soc > 0, "socre out of orange");
        studentsScores[_uname] = _soc;
    }
}

interface IScore {
    //接口必须是 external,   :只能从外部调用即合约外部
    function setStudentScore(
        address,
        uint256
    ) external;

    function getStudentsScore(address ) external returns (uint256);
}

contract Techer {
    function createContract() public returns (address) {
        Score score = new Score();
        return address(score);
    }

    function setScore(
        address _socoreAddr,
        address _uname,
        uint256 _sc
    ) public  {
        IScore(_socoreAddr).setStudentScore(_uname, _sc);
    }

   

}

contract Student {
    function getScore(address _socoreAddr, address  _uname)
        public
        returns (uint256)
    {
        return IScore(_socoreAddr).getStudentsScore(_uname);
    }
}
