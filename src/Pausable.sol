//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "./Ownable.sol";

contract Pausable is Ownable {

    bool private _paused;

    event Paused(address account);
    event Unpaused(address account);
    constructor(){
        _paused = false;
    }
    modifier whenNotPaused() {
        require(!_paused, "Pausable: paused");
        _;
    }

    modifier whenPaused() {
        require(_paused, "Pausable: not paused");
        _;
    }

    function paused() public view virtual returns (bool) {
        return _paused;
    }

    function pause() public onlyOwner whenNotPaused {
        _paused = true;
        emit Paused(msg.sender);
    }

    function unpause() internal onlyOwner whenPaused {
        _paused = false;
        emit Unpaused(msg.sender);
    }
}