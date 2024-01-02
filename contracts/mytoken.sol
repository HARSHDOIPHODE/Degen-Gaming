// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Importing ERC20 token and Ownable functionality from OpenZeppelin contracts
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract mytoken is ERC20, Ownable {
    // Constructor function to initialize the token with name and symbol, minting initial supply to the deployer
    constructor() ERC20("mytoken", "MT") {
        _mint(msg.sender, 1000000000);
    }

    // Mapping to store an array of item numbers owned by each user
    mapping (address => uint[]) public userAssets;

    // Mapping to store information about each item using its item number
    mapping (uint => Item) public items;

    // Variable to keep track of the total number of items
    uint public totalItemNum = 0;

    // Struct to define the structure of an Item
    struct Item{
        uint itemNum;
        uint256 price; 
    }

    // Function allowing the owner to mint new tokens and assign them to an address
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function for the owner to create a new item with a specified price
    function createItem(uint256 price) public onlyOwner {
        totalItemNum = totalItemNum + 1;
        uint itemNum = totalItemNum;
        items[itemNum] = Item(itemNum ,price);
    }

    // Function to retrieve the balance of the caller's account
    function userBalance() external view returns(uint256) {
        return balanceOf(msg.sender);
    }

    // Function allowing users to acquire an item by item number
    function getStuff(uint itemNum) external {
        require(balanceOf(msg.sender) >= items[itemNum].price, "You don't have the required amount");
        approve(msg.sender, items[itemNum].price);
        transferFrom(msg.sender, address(this), items[itemNum].price);
        userAssets[msg.sender].push(items[itemNum].itemNum);
    }

    // Function allowing the caller to transfer tokens to a specified address
    function transferTok(address to, uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Please enter a valid amount");
        approve(msg.sender, amount);
        transferFrom(msg.sender, to, amount);
    }

    // Function allowing the caller to burn a specific amount of their tokens
    function burn(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Please enter a valid amount");
        approve(msg.sender, amount);
        _burn(msg.sender, amount);
    }
}