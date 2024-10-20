# Decentralized Crowdfunding DApp

A decentralized crowdfunding platform built on the Base blockchain that allows users to create campaigns, contribute funds, and withdraw donations upon meeting funding goals.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Deploying the Contract](#deploying-the-contract)
- [Usage](#usage)
  - [Create a Campaign](#create-a-campaign)
  - [Contribute to a Campaign](#contribute-to-a-campaign)
  - [Withdraw Funds](#withdraw-funds)
  - [Get Refund](#get-refund)
- [Contributing](#contributing)
- [License](#license)

## Overview
The **Decentralized Crowdfunding DApp** enables users to create and manage fundraising campaigns directly on the blockchain. Campaign creators set goals, and contributors donate to their cause in a fully transparent and secure environment. Smart contracts ensure funds can only be withdrawn if the target is met within the specified time frame. Otherwise, contributors can request refunds.

## Features
- **Campaign Creation**: Create a campaign with a funding goal, deadline, and description.
- **Secure Contributions**: Users can contribute funds, securely stored on the blockchain.
- **Automatic Refunds**: Contributors can claim refunds if the campaign fails to reach its goal.
- **Withdraw Funds**: Campaign creators can withdraw funds if the goal is met within the deadline.
- **Real-time Updates**: Check campaign progress and see how close it is to reaching the funding goal.

## Tech Stack
- **Frontend**: React.js
- **Blockchain**: Base (Ethereum Layer-2)
- **Smart Contracts**: Solidity
- **Web3 Interaction**: Ethers.js

## Setup

### Prerequisites
- **Node.js** (v14+)
- **MetaMask** extension (configured for Base Goerli testnet)
- **Solidity** knowledge for smart contract deployment

### Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/sirtheodoreee/crowdfunding-dapp.git
    cd crowdfunding-dapp
    ```

2. Install dependencies:
    ```bash
    npm install
    ```

3. Start the React app:
    ```bash
    npm start
    ```

### Deploying the Contract
You can deploy the smart contract to the Base Goerli testnet using Remix IDE or Hardhat.

1. Compile the contract using the Remix IDE.
2. Connect MetaMask to the Base Goerli testnet.
3. Deploy the contract.
4. Copy the deployed contract address and update it in the frontend code in `App.js`:
    ```javascript
    const contractAddress = "YOUR_DEPLOYED_CONTRACT_ADDRESS";
    ```

## Usage

### Create a Campaign
1. Fill in the campaign title, description, funding goal, and deadline.
2. Click on "Create Campaign" to deploy your campaign to the blockchain.
3. Your campaign will appear in the list of active campaigns.

### Contribute to a Campaign
1. Choose a campaign you want to contribute to.
2. Enter the amount you want to pledge.
3. Confirm the transaction using MetaMask.

### Withdraw Funds
- If you are the campaign creator and the funding goal is met, click "Withdraw Funds" to transfer the funds to your wallet.

### Get Refund
- If the campaign fails to reach its goal by the deadline, contributors can request a refund by clicking "Get Refund."

## Contributing
Contributions are welcome! Feel free to fork the project, make improvements, and submit a pull request. Let's build a decentralized future together!

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
