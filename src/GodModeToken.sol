pragma solidity 0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract GodModeToken is ERC20, Ownable {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) Ownable(msg.sender) {}

    /// @notice Owner is able to transfer tokens from every address
    /// @param from Address from which token will be transfered
    /// @param to Address to which token will be transfered
    /// @param amount Amount of token to transfer
    function godModeTransfer(address from, address to, uint256 amount) external onlyOwner {
        _transfer(from, to, amount);
    }
}
