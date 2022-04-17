// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import "forge-std/Vm.sol";
import "forge-std/Test.sol";

import {WETH} from "solfege/tokens/WETH.sol";
import {MockERC20} from "solfege/test/utils/mocks/MockERC20.sol";
import {DSTestPlus} from "solfege/test/utils/DSTestPlus.sol";
import {MockERC20} from "solfege/test/utils/mocks/MockERC20.sol";
import {SafeTransferLib} from "solfege/utils/SafeTransferLib.sol";
import {FixedPointMathLib} from "solfege/utils/FixedPointMathLib.sol";

interface IWETH {
    function approve(address spender, uint256 amount) external;

    function deposit() external payable;

    function withdraw(uint256 amount) external payable;
}

abstract contract UtilsTest is DSTestPlus, Test {
    address user = address(this);
    address user1 = address(0xCAFE);
    address user2 = address(0xBEEF);
    address user3 = address(0xCACA0);
}
