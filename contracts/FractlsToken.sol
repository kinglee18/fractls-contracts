// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract FractlsToken is ERC1155 {


    uint256 public nextTokenId;
    mapping(uint256 => string) public tokenURIs;

    event TokenMinted(uint256 indexed tokenId, address indexed creator);

    constructor() ERC1155("https://ipfs.com/api/token/{id}.json") {
        // Set the base URI for token metadata. We need to update this later
    }

    function mintImageFragments(string[] memory _uris) external {
        require(_uris.length > 0, "No URLs provided");
        for (uint256 i = 0; i < _uris.length; i++) {
            uint256 tokenId = nextTokenId;
            _mint(msg.sender, tokenId, 1, "");
            tokenURIs[tokenId] = _uris[i];
            nextTokenId = nextTokenId + 1;
            emit TokenMinted(tokenId, msg.sender);
        }
    }

    function mineNewToken(uint256 _tokenId) external {
        // Implement  mining logic here
    }
}
