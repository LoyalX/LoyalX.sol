import "./HumanStandardToken.sol";

pragma solidity ^0.4.8;

contract HumanStandardTokenFactory {

    function createHumanStandardToken(uint256 _initialAmount, string _name, uint8 _decimals, string _symbol) returns (address) {

        HumanStandardToken newToken = (new HumanStandardToken(_initialAmount, _name, _decimals, _symbol));
        newToken.transfer(msg.sender, _initialAmount); //the factory will own the created tokens. You must transfer them.
        return address(newToken);
    }
}
