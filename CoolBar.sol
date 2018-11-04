pragma solidity ^0.4.18;

contract CoolBar {
    
   string public barName;
   uint public numberOccupants = 0;
   address public barOwner;
   address private lastNumberOccupantsSubmitter;
   
    function CoolBar (string newBarName) public {
       barName = newBarName;
       barOwner = msg.sender;
    }
    
    function getBarName() view returns (string) {
        return (barName);
    }
    
    modifier requireBarOwner {
        require(msg.sender == barOwner);
        _;
    }
        
    function setBarName(string newBarName) requireBarOwner public {
        barName = newBarName;
    }
    
    function getNumberOccupants() view returns(uint) {
        return(numberOccupants);
    }
    
    function submitNumberOccupants(uint currNumberOccupants) payable {
        
        require(msg.value > .01 ether);
        
        numberOccupants = currNumberOccupants;
        lastNumberOccupantsSubmitter = msg.sender;
    }
    
}