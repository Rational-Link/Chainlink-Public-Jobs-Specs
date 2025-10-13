# Get > String
This smart contract demonstrates how to retrieve a single string value from our oracle. It uses a public JSON API that is compatible with standard `curl GET` requests.

## Standard Use Cases:
- Returns a single `string` value from the oracle.

## Oracle Contract Address & Job ID:
[View on Arbiscan](https://sepolia.arbiscan.io/address/0xa0d71f8248b622f2ce3f9e88B6F901D6851440b7): 
```
0xa0d71f8248b622f2ce3f9e88B6F901D6851440b7
```

**Oracle Job ID**  
```
0372e30c5159437b9add555678f68630
```

**Oracle Fee**   
0 [LINK](https://sepolia.arbiscan.io/token/0xb1D4538B4571d411F07960EF2838Ce337FE1E80E)
```
minContractPaymentLinkJuels = 000000000000000000
```


## Input Parameters

Before compiling and deploying the smart contract in Remix, update the following parameters:

- **Line 39**  
  ```solidity
  req._add("get", "https://your_API_endpoint_url");
  ```
Replace this with the API endpoint you want the contract to query.

- **Line 40**  
  ```solidity
  req._add("path", "data,results");
  ``` 
  Provide the comma‑separated JSON path that points to the value you want returned to the smart contract.
  Example: "data,results" retrieves the results field inside the data object

  Note
  If the JSON response contains arrays, include the index in the path.
  For example:
    ```solidity
    req._add("path", "0,data,results");
    ```



## Step-by-Step Guide

1. Open [Remix IDE](https://remix.ethereum.org/).  
2. Log in to MetaMask and confirm you are connected to the **Arbitrum Sepolia Test Network**.  
3. Copy and paste the full contents of `Get String.sol` from this repository into Remix.  
4. Update the input parameters to match your specific use case.  
5. Compile and deploy the smart contract.  
6. Fund your newly deployed contract with the minimum amount of **ERC677 LINK** required for the number of requests you plan to make.  
7. In the contract’s Read/Write panel, click the **`requestAddress`** button.  
8. Approve the gas fee in MetaMask to send the request to the oracle.  
9. Wait for the oracle to return the requested data.  
10. Once complete, click the **`AddressVariable`** button to view the returned value.  

## Contact 
If you can't find an answer to your question, welcome to our [Discord!](https://discord.gg/JNzXmMZqks) or to reach out to chris@rational-link.com.

