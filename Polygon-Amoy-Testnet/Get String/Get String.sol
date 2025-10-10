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

contract getStringTemplate is ChainlinkClient {
  using Chainlink for Chainlink.Request;

  string public stringVariable;
  uint256 private constant oraclePayment = (0 * LINK_DIVISIBILITY) / 10; // 0.1 * 10**18
  bytes32 private externalJobId;

  constructor(
  ) {
    _setChainlinkToken(0x0Fd9e8d3aF1aaee056EB9e802c3A762a667b1904);
    _setChainlinkOracle(0x37301470dADE4792Fbbdf91B1a08c6b0a8C0dA06);
    externalJobId = "dbfc1c83e26b472c8badb4a4df342319";  }

  function requestString(
  )
    public
  {
    Chainlink.Request memory req = _buildChainlinkRequest(externalJobId, address(this), this.fulfillString.selector);
    req._add("get", "https://your_API_endpoint_url");
    req._add("path", "data,results");
    _sendOperatorRequest(req, oraclePayment);
  }

  event RequestFulfilled(bytes32 indexed requestId, string indexed stringVariable);

  function fulfillString(bytes32 _requestId, string calldata _stringVariable)
    public
    recordChainlinkFulfillment(_requestId)
  {
    emit RequestFulfilled(_requestId, _stringVariable);
    stringVariable = _stringVariable;
  }



}




