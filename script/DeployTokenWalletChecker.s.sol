// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {TokenWalletBalanceChecker} from "../src/TokenWalletBalanceChecker.sol";

contract DeployTokenWalletChecker is Script {
    function run()external returns (TokenWalletBalanceChecker){
        vm.startBroadcast();
        TokenWalletBalanceChecker tokenWalletChecker = new TokenWalletBalanceChecker();
        vm.stopBroadcast();
        return tokenWalletChecker;
    }
}