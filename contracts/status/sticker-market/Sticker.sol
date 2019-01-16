pragma solidity >=0.5.0 <0.6.0;

import "../../common/Controlled.sol";
import "../../token/UnfungibleToken.sol";


contract Sticker is Controlled, UnfungibleToken {

    uint256 public nextId;
    mapping (uint256 => bytes32) public dataHash; 
    
    function generateToken(address _owner, bytes32 _dataHash) external onlyController returns (uint256 tokenId){
        tokenId = nextId++;
        dataHash[tokenId] = _dataHash;
        mint(_owner, tokenId);
    }

    function destroyToken(address _owner, uint256 _tokenId) external onlyController {
        delete dataHash[_tokenId];
        burn(_owner, _tokenId);
    }

}
