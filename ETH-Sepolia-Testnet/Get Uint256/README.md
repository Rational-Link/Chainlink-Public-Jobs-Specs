# Get > Uint256
This smart contract is designed to retrieve a single Uint256 value from our oracle using a public JSON API that is compatible with `curl GET` requests.

## Standard Use Cases:
[1] Returns am unsigned Number

## Oracle Address & JobID:
[Oracle Address](https://sepolia.etherscan.io/address/0x58ed771243D9E5EE9A765f00F0bA0B8044d682f1): 
```
0x58ed771243D9E5EE9A765f00F0bA0B8044d682f1
```
Oracle JobID: 
```
3474e8f52eee4c9282363d6d5b8c589c
```
Oracle Fee: 0 [LINK](https://sepolia.etherscan.io/token/0x779877A7B0D9E8603169DdbD7836e478b4624789)
```
minContractPaymentLinkJuels = 000000000000000000
```

## Input Parameters:
BEFORE compiling and deploying the smart contract on Remix, you MUST specify the following parameters:

* Line 39: `"https://your_API_endpoint_url"` - Update to your API Endpoint

* Line 40: `"data,results"` - comma-separated JSON path used to the positive number wanted to be delivered to the requesting smart contract

Note: Arrays within JSON responses can be accessed with proper syntax such as: `"0,data,results"`

* Line 41: `100` - multiplication factor must be used to multiply all the decimal places present within the API JSON response:

Note: If you want your smart contract to receive all 6 significant digits of the number 123.456, you should use a multiplication factor of 1000 (123456).



Note: After the fulfillRequest function is executed, you should divide the result by the previously used multiplication factor to obtain the appropriate number of decimal places for downstream usage.

## Curl Command
Curl command : 
```
curl https://raw.githubusercontent.com/Block-Farms/Chainlink-Public-Jobs/master/example-json/example-uint256.json
```

JSON API Output:
```
{
  "data_uint256": 13.37
}
```

## Step by step process:
[1] Visit [Remix.org](https://remix.ethereum.org/)

[2] Log in to Metamask and confirm that you're currently on the ETH Sepolia Test network

[3] Copy & Paste the entire contents of `Get > Uint256.sol` from this directory

[4] Ensure that the input parameters on lines 39-42 are updated for your specific use case

[5] Compile and deploy the smart contract

[6] Send the minimum amount of ERC677 LINK required for the number of requests to your newly deployed smart contract.

[6] Click the orange `requestAddress` button in the smart contract Read/Write functionality

[7] Pay the gas fee to send the request to our oracle

[8] Wait approximately 1-2 minutes (1-2 blocks) for the requested data to be delivered to your requesting smart contract

[9] Click the blue `AddressVariable` button to display the returned value from the oracle

## Contact :email:
If you can't find an answer to your question, welcome to reach out to [email](chris@rational-link.com) or to check out our [website](https://www.rational-link.com).




