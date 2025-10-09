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

pragma solidity 0.8.19;

import {Chainlink, ChainlinkClient} from "@chainlink/contracts/src/v0.8/operatorforwarder/ChainlinkClient.sol";
import {ConfirmedOwner} from "@chainlink/contracts/src/v0.8/shared/access/ConfirmedOwner.sol";
import {LinkTokenInterface} from "@chainlink/contracts/src/v0.8/shared/interfaces/LinkTokenInterface.sol";

contract getStringTemplate is ChainlinkClient {
  using Chainlink for Chainlink.Request;

  string public stringVariable;
  uint256 private constant oraclePayment = (1 * LINK_DIVISIBILITY) / 10; // 0.1 * 10**18
  bytes32 private externalJobId;

  constructor(
  ) {
    _setChainlinkToken(0x779877A7B0D9E8603169DdbD7836e478b4624789);
    _setChainlinkOracle(0xa0d71f8248b622f2ce3f9e88B6F901D6851440b7);
    externalJobId = "0372e30c5159437b9add555678f68630";  }

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

  function fulfillString(bytes32 requestId, string calldata _stringVariable)
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilled(requestId, _stringVariable);
    stringVariable = _stringVariable;
  }



}




