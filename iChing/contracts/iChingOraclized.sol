pragma solidity ^0.4.15;

import "https://github.com/oraclize/ethereum-api/blob/master/oraclizeAPI_0.4.sol";

contract IChingOraclized is usingOraclize {
    event CastRequest(bytes32, address);
    event CastResponse(bytes32, uint[]);

    // takes a question of user and returns array of 6 numbers from 0 to 3
    // 0 - Old yin, 1 - Young yin, 2 - Old yang, 3 - Young yang
    function castLogic(string _seed) internal constant returns(uint[]) {
        uint[] memory lines = new uint[](6);
        for (uint i = 0; i < 6; i++) {
            lines[i] = line(_seed, i);
        }
        return lines;
    }

    // takes a question of user and number of the line and returns a number from 0 to 3
    // internal means that this function can't be invoked outside of this contract
    // keccak256 makes a pseudo random number considering:
    // number of current block, address of sender, question of user, line height
    function line(string _seed, uint _lineHeight) internal constant returns (uint) {
        uint randomNumber = uint(keccak256(block.number, msg.sender, _seed, _lineHeight)) % 16;
        if (randomNumber == 0) {
            return 0;
        } else if (randomNumber > 0 && randomNumber <= 7) {
            return 1;
        } else if (randomNumber > 7 && randomNumber <= 10) {
            return 2;
        } else {
            return 3;
        }
    }

    function cast() public payable {
        CastRequest(oraclize_query("WolframAlpha", "random number between 0 and 100"), msg.sender);
    }

    function __callback(bytes32 queryId, string result) public {
        CastResponse(queryId, castLogic(result));
    }

}