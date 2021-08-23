// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArsErc20{
    mapping(address => uint256) balances;
    uint256 private totalSupply;
    mapping(address => mapping(address => uint256)) approves;

    string public name;                   //fancy name: eg Simon Bucks
    uint256 public decimals;                //How many decimals to show.
    string public symbol; 

    constructor(uint256 _initialAmount, string memory _tokenName, uint256 _decimalUnits, string  memory _tokenSymbol) {
        balances[msg.sender] = _initialAmount;               // Give the creator all initial tokens
        totalSupply = _initialAmount;                        // Update total supply
        name = _tokenName;                                   // Set the name for display purposes
        decimals = _decimalUnits;                            // Amount of decimals for display purposes
        symbol = _tokenSymbol;                               // Set the symbol for display purposes
    }

    function balanceOf(address account) external view returns(uint256){
        return balances[account];
    }

    function totalSuppply() external view returns(uint256){
        return totalSupply;
    }

    function transfer(address recipient, uint256 amount) external{
        require(amount <= balances[msg.sender], "Amount is greather than total Supply baby :-(");
        require(recipient != address(0), "DO you wanna send your money to noone? R u stupid baby?");

        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
    
    function approve(address spender, uint256 amount) external{
        require(amount <= balances[msg.sender], "Amount is greather than total Supply baby :-(");
        require(spender != address(0), "Do you wanna send your money to noone? R u stupid baby?");

        approves[msg.sender][spender] = amount;
    }

    function allowance(address owner, address spender) external view returns(uint256){
        return approves[owner][spender];
    }

    function transferFrom(address from, address to, uint256 amount) external{
        require(from != address(0), "DO you wanna send your money to noone? R u stupid baby?");
        require(amount <= balances[from], "Amount is greather than total Supply baby :-(");
        require(to != address(0), "DO you wanna send your money to noone? R u stupid baby?");
        require(approves[from][to] >= amount, "error");

        approves[from][to] -= amount;

        balances[from] -= amount;
        balances[to] += amount;
    }

    function mint(address recipient, uint256 amount) external{
        require(recipient != address(0), "Do you wanna send your money to noone? R u stupid baby?");

        balances[recipient] += amount;
        totalSupply += amount;
    }

    function burn(address target, uint256 amount) external{
        require(amount <= balances[target], "Amount is greather than total Supply baby :-(");
        require(target != address(0), "Do you wanna send your money to noone? R u stupid baby?");

        balances[target] -= amount;
        totalSupply -= amount;
    }
}