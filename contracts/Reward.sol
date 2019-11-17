pragma solidity >=0.5.0 <0.7.0;

contract Reward {

    address public admin;
    mapping (address => uint) public balance;

    event Sent(address from, address to, uint amount);

    constructor() public {
        admin = msg.sender;
    }

    //create reward points
    function create(address sender, uint amount) public {
        require(msg.sender == admin);
        require(amount < 1e60);
        balance[sender] += amount;
    }

    // Add points to student
    function Add_Points(address student, uint amount) public {
        require(amount <= balance[msg.sender], "Insufficient balance.");
        balance[msg.sender] -= amount;
        balance[student] += amount;
        emit Sent(msg.sender, student, amount);
    }
    // Deduct points to student
    function Spend_Points(address student, uint amount) public {
        require(balance[student]<=0, "Insufficient balance.");
        balance[msg.sender] += amount;
        balance[student] -= amount;
        emit Sent(msg.sender, student, amount);
    }    
}