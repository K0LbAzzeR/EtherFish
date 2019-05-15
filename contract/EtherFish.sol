pragma solidity ^0.5.0;

contract EtherFish {
    
    address public admin;
    
    constructor () public {
        admin = msg.sender;
    }
    
    modifier auth {
        require(msg.sender == admin, "Prohibited");
        _;
    }
    
    event Feeded(address _from, uint _timestamp);
    
    function feedFish() public payable {
        require(msg.value >= 0.0001 ether);
        emit Feeded(msg.sender, now);
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    function withdraw(address payable _to, uint _amount) public auth {
        _to.transfer(_amount);
    }
    
}