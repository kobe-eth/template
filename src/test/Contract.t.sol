// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import {UtilsTest} from "src/test/Utils.sol";

contract ContractTest is UtilsTest {
    function setUp() public {}

    function testHealthCheck() public {
        assertTrue(true);
    }

    function testFailHealCheck() public {
        assertFalse(true);
    }
}
