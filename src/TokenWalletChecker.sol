// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {IERC20} from "../lib/forge-std/src/interfaces/IERC20.sol";

contract TokenWalletChecker {
    error InvalidAddress(address account);

    function getBalanceOfToken(address _owner, address _tokenContractAddress)external view returns(uint){
        checkAddress(_owner);
        checkAddress(_tokenContractAddress);
        IERC20 tokenContract = IERC20(_tokenContractAddress);
        return tokenContract.balanceOf(_owner);
    }

    function checkAddress(address account)internal pure {
        if (account == address(0)){
            revert InvalidAddress(account);
        }
    }
}