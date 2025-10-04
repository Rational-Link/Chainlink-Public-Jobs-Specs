# Get > String
This smart contract demonstrates how to retrieve a single string value from our oracle.  
It uses a public JSON API that is compatible with standard `curl GET` requests.

## Standard Use Cases:
- Returns a single `string` value from the oracle.

## Oracle Contract Address & Job ID:
[View on Etherscan](https://sepolia.etherscan.io/address/0x58ed771243D9E5EE9A765f00F0bA0B8044d682f1): 
```
0x58ed771243D9E5EE9A765f00F0bA0B8044d682f1
```

**Oracle Job ID**  
```
3474e8f52eee4c9282363d6d5b8c589c
```

**Oracle Fee**   
0 [LINK](https://sepolia.etherscan.io/token/0x779877A7B0D9E8603169DdbD7836e478b4624789)
```
minContractPaymentLinkJuels = 000000000000000000
```


## Input Parameters:
Before compiling and deploying the smart contract in Remix, you must update the following parameters:

- **Line 42**  
  ```solidity
  "https://your_API_endpoint_url"


* Line 42: `"https://your_API_endpoint_url"` - Update to your API Endpoint

* Line 43: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: If you want to access arrays within JSON responses, you have to use the proper syntax, such as "0,data,results".



## Curl Command
Curl command : 
```
curl https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/example-string.json
```

JSON API Output:
```
{
  "data_string": "chainlink"
}
```

## Step by step process:
[1] Visit [Remix.org](https://remix.ethereum.org/)

[2] Log in to Metamask and confirm that you're currently on the ETH Sepolia Test network

[3] Copy & Paste the entire contents of `Get > String.sol` from this directory

[4] Ensure that the input parameters on lines 36-37 are updated for your specific use case

[5] Compile and deploy the smart contract

[6] Send the minimum amount of ERC677 LINK required for the number of requests to your newly deployed smart contract.

[6] Click the orange `requestAddress` button in the smart contract Read/Write functionality

[7] Pay the gas fee to send the request to our oracle

[8] Wait approximately 1-2 minutes (1-2 blocks) for the requested data to be delivered to your requesting smart contract

[9] Click the blue `AddressVariable` button to display the returned value from the oracle

## Contact :email:
If you can't find an answer to your question, welcome to reach out to [email](chris@rational-link.com) or to check out our [website](https://www.rational-link.com).



