// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {IERC20} from "../lib/forge-std/src/interfaces/IERC20.sol";

contract TokenWalletChecker {
    error InvalidAddress(address account);
    struct TokenBalance {
        uint balance;
        address tokenAddress;
    }


    /**
    getBalanceOfToken: return the balance of a an account for a particular token
    [address _owner]: the account to check balance for
    [address _tokenContractAddress] :  the address of the token
     */
    function getBalanceOfToken(address _owner, address _tokenContractAddress)public view returns(TokenBalance memory){
        checkAddress(_owner);
        checkAddress(_tokenContractAddress);
        IERC20 tokenContract = IERC20(_tokenContractAddress);
        TokenBalance memory tokenBalance = TokenBalance({
            balance : tokenContract.balanceOf(_owner),
            tokenAddress: _tokenContractAddress
        }); 
        return tokenBalance;
    }

    /**
    check balances for multiple ERC20 tokens
    within a single function call
    [address[] _multipleTokenContractAddresses]: A list of mutiple token contract address
    [address : _owner]: the account to check balance for
     */
    function getBalancesOfMultipleToken(address[] calldata _multipleTokenContractAddresses, address _owner)external view returns (TokenBalance[] memory){
        checkAddress(_owner);
        TokenBalance[] memory multipleTokenBalances = new TokenBalance[](_multipleTokenContractAddresses.length);
        for (uint i = 0; i < _multipleTokenContractAddresses.length ; i++){
            multipleTokenBalances[i] =  getBalanceOfToken(_owner, _multipleTokenContractAddresses[i]);
        }
        return multipleTokenBalances;
    }

    /*
    This function checks if the address provided is a valid address
    i.e it is a non-zero address
     */
    function checkAddress(address account)internal pure {
        if (account == address(0)){
            revert InvalidAddress(account);
        }
    }
}