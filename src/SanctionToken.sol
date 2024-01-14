// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract SanctionToken is ERC20, Ownable {
    mapping(address => bool) private _bannedAddresses;

    event AddressBanned(address indexed _address);
    event AddressUnbanned(address indexed _address);

    constructor(string memory name, string memory symbol) ERC20(name, symbol) Ownable(msg.sender) {}

    /// @notice Holder is able burn tokens
    /// @param _from Address from which token will be burned
    /// @param _amount Amount of token to burn
    function burn(address _from, uint256 _amount) external {
        require(_from == msg.sender, "from address must be sender");
        _burn(_from, _amount);
    }

    /// @notice Owner is able to mint tokens
    /// @param _to Address to which token will be minter
    /// @param _amount Amount of token to mint
    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }

    /// @notice Owner is able to ban addresses from transfering tokens
    /// @param _address Address of which address will be banned
    function banAddress(address _address) public onlyOwner {
        _bannedAddresses[_address] = true;
        emit AddressBanned(_address);
    }

    /// @notice Owner is able to to unban addresses from transfering tokens
    /// @param _address Address of which address will be banned
    function unbanAddress(address _address) public onlyOwner {
        _bannedAddresses[_address] = false;
        emit AddressUnbanned(_address);
    }

    /// @notice Check if address is banned
    /// @param _address Address of which address will be checked if they are banned
    function isBanned(address _address) public view returns (bool) {
        return _bannedAddresses[_address];
    }

    /// @notice Use of _beforeTokenTransfer hook for ban mechanism
    /// @param _from Address from which token will be transfered
    /// @param _to Address to which token will be transfered
    /// @param _amount Amount of token to transfer
    function transferFrom(address _from, address _to, uint256 _amount) public override returns (bool) {
        require(!_bannedAddresses[_from], "Sender address is banned");
        require(!_bannedAddresses[_to], "Recipient address is banned");
        return super.transferFrom(_from, _to, _amount);
    }
}

// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions
