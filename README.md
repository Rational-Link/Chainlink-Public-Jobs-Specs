# Chainlink Oracle Public Job Specifications
> Welcome to this educational repository. Inside you’ll find example smart contracts and Oracle job specifications that show how to connect on-chain applications to our trusted off-chain oracle data sources.

> Our mission at [Rational-Link](https://www.rational-link.com) is to provide **enterprise-grade oracle services** built around reliability, uptime, and security. These examples are intended to give developers the clear, practical guidance needed to integrate their Web3 applications with our Oracle services—use these scripts as a starting point and adapt them as needed for your production environment.

## Project Structure

```
.
├── Ethereum-Sepolia-Testnet (i.e., Blockchain Network)
│   ├── Get String
│   │   ├── Get String.sol
│   │   ├── Get String.toml
│   │   └── README.md
│   └── Get Uint256
│       ├── Get Uint256.sol
│       ├── Get Uint256.toml
│       └── README.md
...
│
├── LICENSE
└── README.md
```
---

## Overview
- Example Solidity contracts for requesting and consuming external data.
- Sample TOML job descriptions to illustrate oracle job configuration.
- References to oracle contract addresses and job IDs for supported test networks.

---

## Pricing Structure

  All job executions on testnet environments (Ethereum Sepolia, Arbitrum Sepolia, Polygon Amoy) are provided free of charge to support development, integration testing, and pre-deployment validation.

---

## Repository Structure
- `contracts/` → Solidity examples (educational only).
- `jobs/` → TOML job description samples.
- `docs/` → Additional notes and references.

---

## Oracle Details
- **Supported Networks**: Ethereum, Polygon, Arbitrum.  
- **Oracle Contract IDs & Job IDs**: Provided in examples for testnet usage.  
- **Fees**: Demonstrated with placeholder values for clarity.  

*(Always confirm the latest oracle addresses and job IDs with Rational-Link before deploying.)*

---

## Disclaimer
- This code and configuration are educational examples. Please review and modify before using in production.

---

## Getting Started
1. Clone this repository.  
2. Open the Solidity contracts in [Remix](https://remix.ethereum.org/) or your preferred IDE.  
3. Log in to MetaMask and confirm you are connected to the blockchain network.
4. Update the input parameters on to match your specific use case, before compiling and deploying the smart contract.  
5. Deploy to the blockchain network and connect with the provided oracle/job IDs. 

---

## Learn More
- [Rational-Link Website](https://www.rational-link.com)  
- [Chainlink Documentation](https://docs.chain.link/)  
- [Ethereum Remix IDE](https://remix.ethereum.org/)  

---

## Estimating Gas Usage for Transactions
Certain types of jobs may be subject to gas limits. To estimate the gas fee required to execute a transaction, you can use the following syntax (via the Alchemy API as an example).
This example simulates a transaction from a sender address (FROM) to a smart contract (CONTRACT) with a specific function call (DATA) and returns an estimated gas cost.

### Setup
Replace the placeholders with your actual values:
```Bash
RPC_URL="https://arb-sepolia.g.alchemy.com/v2/YOUR_ACTUAL_API_KEY"

CONTRACT="0x_Your_Contract_Address"
FROM="0x_Your_Sender_Address"
DATA="0x_Your_Encoded_Function_Call"
```
### Estimate Gas via eth_estimateGas
```Bash
curl -s \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc":"2.0",
    "method":"eth_estimateGas",
    "params":[
      {
        "from": "'"$FROM"'",
        "to": "'"$CONTRACT"'",
        "data": "'"$DATA"'"
      }
    ],
    "id":1
  }' \
  $RPC_URL
```