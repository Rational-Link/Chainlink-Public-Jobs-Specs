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

pragma solidity ^0.8.7;

import {Chainlink, ChainlinkClient} from "@chainlink/contracts@1.4.0/src/v0.8/operatorforwarder/ChainlinkClient.sol";
import {ConfirmedOwner} from "@chainlink/contracts@1.4.0/src/v0.8/shared/access/ConfirmedOwner.sol";
import {LinkTokenInterface} from "@chainlink/contracts@1.4.0/src/v0.8/shared/interfaces/LinkTokenInterface.sol";

contract getStringTemplate is ChainlinkClient {
  using Chainlink for Chainlink.Request;

  string public stringVariable;

  bytes32 private externalJobId;
  uint256 private oraclePayment;

  constructor(
  ) {
    setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);
    setChainlinkOracle(0x52Ee9d274b3059575672389C372C03D97Ab71D2a);
    externalJobId = "1dfc4535183f468cb84cab5b4f0004d0";
    oraclePayment = ((0 * LINK_DIVISIBILITY) / 10); // n * 10**18
  }

  function requestString(
  )
    public
  {
    Chainlink.Request memory req = buildChainlinkRequest(externalJobId, address(this), this.fulfillString.selector);
    req.add("get", "https://your_API_endpoint_url");
    req.add("path", "data,results");
    sendOperatorRequest(req, oraclePayment);
  }

  event RequestFulfilled(bytes32 indexed requestId, string indexed stringVariable);

  function fulfillString(bytes32 requestId, string calldata _stringVariable)
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilled(requestId, _stringVariable);
    stringVariable = _stringVariable;
  }

}
