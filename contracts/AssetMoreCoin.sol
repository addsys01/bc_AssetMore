// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "./LandToken.sol";

contract AssetMoreCoin is ERC20, ERC20Burnable, Pausable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    
    address private landAddress;

    constructor() ERC20("AssetMoreCoin", "AMC") {
        _mint(msg.sender, 20000000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
//       LandToken lt = LandToken(landAddress);
        _pause();
    }
    function setAddress(address land_addr) public {
	landAddress = land_addr;
    }
    function getAddress() public returns (address) {
	return landAddress;
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
// ------------------- Land Module ------------------------------
    function addLand(address to, string memory lduri, uint256 area) public {
    }
    function removeLand(address from, uint256 ldid) public {
    }
    function listLand(address from) public {
    }
    function splitLand(address from, uint256 ldid, uint256 newarea) public {
    }
// -------------------- Sell&Buy Module -----------------------------
    function transferLand(address seller, address buyer,uint256 amount, uint256 ldid,uint256 ld_amount) public {
	LandToken lt = LandToken(landAddress);
	lt.transferLand(seller, buyer, ldid, ld_amount,"ref");
	_transfer(buyer, seller, amount);
    }
// -------------------- Bridge Module -----------------------------
    function bridgeIn1(address to, uint256 amount) payable public {
	//tr
	//uint balance = token.balanceOf(address(this));
	//require((amount*10000) <= balance, "Insufficient balance!");
	//_transfer(to, (amount*10000));
	//_mint( msg.sender, msg.value * 10000);
	//token.transfer(to
    }
    function bridgeIn() payable public {
	_mint(msg.sender, msg.value * 10000);
    }
    function bridgeOut(IERC20 token,address from, uint256 amount) public {
	//uint balance = token.balanceOf(address(this));
    	//require(amount <= balance, "Insufficient balance!");
    	//token.transfer(to, amount/10000);
    }
    function mintCoin(uint256 amount) public {
    }
// -------------------- Swap Module -----------------------------
    function swapIn(address to, uint256 amount, uint256 toCoin) public {
    }
    function swapOut(address from, uint256 Coin, uint256 toAmount) public {
    }
    function deposit(address to, uint256 amount) public {
    }
    function withdraw(address from, uint256 amount) public {
    }
// -------------------------------------------------
}
