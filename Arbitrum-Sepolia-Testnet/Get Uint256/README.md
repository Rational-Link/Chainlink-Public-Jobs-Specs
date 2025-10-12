# Get > Uint256
This smart contract is designed to retrieve a single Uint256 value from an oracle using a public JSON API that is compatible with `curl GET` requests.

## Standard Use Cases:
- Returns a single unsighed value from the oracle (i.e., a number that can only be zero or positive).

## Oracle Contract Address & Job ID:
[View on Arbiscan](https://sepolia.arbiscan.io/address/0xa0d71f8248b622f2ce3f9e88B6F901D6851440b7): 
```
0xa0d71f8248b622f2ce3f9e88B6F901D6851440b7
```

**Oracle Job ID**  
```
b76683db6c0144c5bbaecbeb47a22934
```

**Oracle Fee**   
0 [LINK](https://sepolia.arbiscan.io/token/0xb1D4538B4571d411F07960EF2838Ce337FE1E80E)
```
minContractPaymentLinkJuels = 000000000000000000
```

## Input Parameters

Before compiling and deploying the smart contract in Remix, make sure to update the following parameters:

- **Line 40**  
  ```solidity
  req._add("get", ""https://your_API_endpoint_url");
  ```

- **Line 41**
  ```solidity
  req._add("path", "data,results");
  ```
  Provide the comma-separated JSON path that points to the numeric value you want returned to the smart contract.

  If the JSON response contains arrays, include the index in the path.
  For example:
    ```solidity
    req._add("path", "0,data,results");
    ```

- **Line 42**
  ```solidity
  req._addInt("times", 100); 
  ```
  - multiplication factor must be used to multiply all the decimal places present within the API JSON response:

**Note:** To retain the full precision of a decimal value such as `123.456`, apply a multiplication factor — for example, `1000` — which converts the number to `123456` before storing or transmitting it.

**Note:** After the `fulfillRequest` function executes, divide the returned value by the same multiplication factor to restore the original decimal format for downstream use.

## Curl Command
Curl command : 
```
curl "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD"
```

JSON API Output:
```
{
  "USD": 4467.35
}
```

## Step-by-Step Guide

1. Open [Remix IDE](https://remix.ethereum.org/).  
2. Log in to MetaMask and confirm you are connected to the **Arbitrum Sepolia Test Network**.  
3. Copy and paste the full contents of `Get Uint256.sol` from this repository into Remix.  
4. Update the input parameters on to match your specific use case.  
5. Compile and deploy the smart contract.  
6. Fund your newly deployed contract with the minimum amount of **ERC677 LINK** required for the number of requests you plan to make.  
7. In the contract’s Read/Write panel, click the **`requestAddress`** button.  
8. Approve the gas fee in MetaMask to send the request to the oracle.  
9. Wait for the oracle to return the requested data.  
10. Once complete, click the **`AddressVariable`** button to view the returned value.  

## Contact :email:
If you can't find an answer to your question, welcome to our [Discord!](https://discord.gg/JNzXmMZqks) or to reach out to chris@rational-link.com.




