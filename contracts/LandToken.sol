// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract LandToken is ERC1155, Ownable, ERC1155Burnable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    
    constructor() ERC1155("") {
	uint256 tokenId = _tokenIdCounter.current();
	_tokenIdCounter.increment();
	_mint(msg.sender,tokenId,100,"A1");
        tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _mint(msg.sender,tokenId,100,"A2");
        tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _mint(msg.sender,tokenId,100,"A3");
        tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _mint(msg.sender,tokenId,100,"A4");
        tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _mint(msg.sender,tokenId,100,"A5");
        tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _mint(msg.sender,tokenId,100,"A6");
        tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _mint(msg.sender,tokenId,100,"A7");
        tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _mint(msg.sender,tokenId,100,"A8");
        tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _mint(msg.sender,tokenId,100,"A9");
        tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _mint(msg.sender,tokenId,100,"A10");
    }

    function transferLand(address from, address to,uint256 ldid,uint256 ld_amount,bytes memory val) public {
	_safeTransferFrom(from,to,ldid,ld_amount,val);
    }
    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
