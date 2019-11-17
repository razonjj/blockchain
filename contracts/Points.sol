pragma solidity >=0.5.0 <0.7.0;

contract Reward {

    address public admin;
    mapping (address => uint) public balance;


    constructor() public {
        admin = msg.sender;

    }

    // Add points to student
    function Add_Points(address student, uint amount) public {
       balance[student] += amount;
       
    }
    // Deduct points to student
    function Spend_Points(address student, uint amount) public {
        require(balance[student]>0, "Insufficient balance."); 
        balance[student] -= amount;
     
    }    
}