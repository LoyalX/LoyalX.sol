pragma solidity ^0.4.18;


/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library StrHelper {

    // stolen from: http://ethereum.stackexchange.com/questions/9142/how-to-convert-a-string-to-bytes32
    function toBytes32(string memory source) internal pure returns (bytes32 result) {
        assembly { result := mload(add(source, 32)) }
    }

}
