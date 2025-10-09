// SPDX-License-Identifier: MIT

/**
 * Example Contract
 *
 * This contract is provided for demonstration purposes only.
 * - It uses hardcoded values for simplicity and clarity.
 * - The code has not been audited or security‑reviewed.
 *
 * Important:
 * Do NOT deploy this contract to production or use it with real funds.
 * It is intended solely as an educational reference.
 */

pragma solidity ^0.8.19;

import {Chainlink, ChainlinkClient} from "@chainlink/contracts/src/v0.8/operatorforwarder/ChainlinkClient.sol";
import {ConfirmedOwner} from "@chainlink/contracts/src/v0.8/shared/access/ConfirmedOwner.sol";
import {LinkTokenInterface} from "@chainlink/contracts/src/v0.8/shared/interfaces/LinkTokenInterface.sol";

contract getUintTemplate is ChainlinkClient, ConfirmedOwner {
  using Chainlink for Chainlink.Request;

  uint256 public UintVariable;
  bytes32 private externalJobId;
  uint256 private constant oraclePayment = (0 * LINK_DIVISIBILITY) / 10; // 0.1 * 10**18
  
  constructor() ConfirmedOwner(msg.sender){
    _setChainlinkToken(0xb1D4538B4571d411F07960EF2838Ce337FE1E80E);
    _setChainlinkOracle(0xa0d71f8248b622f2ce3f9e88B6F901D6851440b7);
    externalJobId = "b76683db6c0144c5bbaecbeb47a22934";

  }

  function requestUint()
    public
    onlyOwner
  {
    Chainlink.Request memory req = _buildChainlinkRequest(externalJobId, address(this), this.fulfillUint.selector);
    req._add("get", "https://your_API_endpoint_url");
    req._add("path", "data,results");
    req._addInt("times", 100);
    _sendOperatorRequest(req, oraclePayment);
  }

  event RequestUintFulfilled(bytes32 indexed requestId, uint256 indexed UintVariable);
  
  function fulfillUint(bytes32 _requestId, uint256 _UintVariable)
    public
    recordChainlinkFulfillment(_requestId)
  {
    emit RequestUintFulfilled(_requestId, _UintVariable);
    UintVariable = _UintVariable;
  }

}
