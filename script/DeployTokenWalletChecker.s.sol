// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {TokenWalletChecker} from "../src/TokenWalletChecker.sol";

contract DeployTokenWalletChecker is Script {
    function run()external returns (TokenWalletChecker){
        vm.broadcast();
        TokenWalletChecker tokenWalletChecker = new TokenWalletChecker();
        vm.stopBroadcast();
        return tokenWalletChecker;
    }
}