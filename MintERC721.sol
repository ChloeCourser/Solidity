// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MintERC721 is ERC721 {

    uint256 totalMints = 0;
    uint256 mintPrice;
    uint256 maxSupply;
    uint256 maxPerWallet;
    string URI;

    address public owner;

    mapping(address => uint256) public walletMints;

    constructor() ERC721("MyNFT", "NFT") {}

    //Set URI to ipfs link, otherwise URI is set to default link
    //This can't check if the link works or not
    function setLink(string memory link) public {
        URI = link;
    }

    //Set mintPrice, default is 1 ether
    function setMintPrice(uint price) public {
        
        mintPrice = price;
    }

    //Set maxSupply, default is 50
    function setMaxSupply(uint supply) public {
        maxSupply = supply;
    }

    //Set maxPerWallet, default is 5
    function setMaxPerWallet(uint perWallet) public {
        maxPerWallet = perWallet;
    }

    //Sets URI, mintPrice, maxSupply, maxPerWallet to default values
    function setDefault() public {
        mintPrice = 1 ether;
        maxSupply = 100;
        maxPerWallet = 10;
        URI = "https://bafybeifqmgyfy4by3gpms5sdv3ft3knccmjsqxfqquuxemohtwfm7y7nwa.ipfs.dweb.link/metadata.json";
    }

    function getValues() public view returns (uint256 TotalMints, uint256 MintPrice, uint256 MaxSupply, uint256 MaxPerWallet, string memory link) {
        return (totalMints, mintPrice/1000000000000000000, maxSupply, maxPerWallet, URI);
    }

    function safeMint(address to) internal {
        uint256 tokenId = totalMints;
        totalMints++;

        _safeMint(to, tokenId);
    }

    function mintNFT(uint256 quantity_) public payable {
        require(quantity_ * mintPrice == msg.value, "wrong amount sent");
        require(walletMints[msg.sender] + quantity_ <= maxPerWallet, "mints per wallet exceeded");

        walletMints[msg.sender] += quantity_;
        safeMint(msg.sender);
    }

    function getMyWalletMints() public view returns (uint256) {
        return walletMints[msg.sender];
    }

    //TODO
    //Need to be able to withdraw funds
    //Need to be able to set price below 1 ether
}


