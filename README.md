mytoken Solidity Contract
Overview

This Solidity smart contract, deployed on the Avalanche Fuji C-Chain testnet using Hardhat, introduces a custom token (mytoken) adhering to the ERC20 standard. It also includes functionality for managing items and their associated prices within the contract.
Features

    Token Details: mytoken (symbol: MT) with an initial supply of 1,000,000,000 tokens.
    Ownership: Ownable functionality from OpenZeppelin contracts enables control over critical functions.
    Item Management: Allows the creation of new items with specified prices and facilitates user acquisition of these items.

Functions

    mint: Owner-exclusive function to mint new tokens and assign them to specified addresses.
    createItem: Owner-exclusive function to create a new item with a specified price.
    userBalance: Retrieves the balance of the caller's account.
    getStuff: Allows users to acquire items by item number, given they have sufficient balance.
    transferTok: Enables the caller to transfer tokens to a specified address.
    burn: Allows the caller to burn a specific amount of their tokens.

Usage

    Deployment: Deploy this contract on the Avalanche Fuji C-Chain testnet using Hardhat.
    Interacting with Contract: Use functions like mint, createItem, getStuff, transferTok, and burn as per their intended functionalities. Ensure correct balances before executing transactions.

Deployment Details

    Network: Avalanche Fuji C-Chain testnet
    Tool: Hardhat
