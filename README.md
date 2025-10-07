# Chainlink Oracle Public Job Specifications
> Welcome to this educational repository. Inside you’ll find example smart contracts and Oracle job specifications that show how to connect on-chain applications to trusted off-chain data sources.

> Our mission at [Rational-Link](https://www.rational-link.com) is to provide **enterprise-grade oracle services** built around reliability, uptime, and security. These examples are intended to give developers the clear, practical guidance needed to integrate their Web3 applications with our Oracle services—use them as a starting point and adapt them for your production environment.

## Project Structure

```
.
├── ETH-Sepolia-Testnet
│   ├── Get String
│   │   ├── Get String.sol
│   │   ├── Get String.toml
│   │   └── README.md
│   └── Get Uint256
│       ├── Get Uint256.sol
│       ├── Get Uint256.toml
│       └── README.md
├── LICENSE
└── README.md
```

---

## Overview
- Example Solidity contracts for requesting and consuming external data.
- Sample TOML job descriptions to illustrate oracle job configuration.
- References to oracle contract addresses and job IDs for supported test networks.

---

## Repository Structure
- `contracts/` → Solidity examples (educational only).
- `jobs/` → TOML job description samples.
- `docs/` → Additional notes and references.

---

## Oracle Details
- **Supported Networks**: Ethereum, Polygon, Arbitrum (with more to come).  
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