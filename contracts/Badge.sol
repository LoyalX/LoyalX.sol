pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract Badge is Ownable {

    string public badgeName;
    string public badgeClass;
    address public organization;
    string public ownerName;

    function Badge(string _badgeName, string _badgeClass, string _ownerName, address _owner) public {
        badgeName = _badgeName;
        badgeClass = _badgeClass;
        organization = msg.sender;
        ownerName = _ownerName;
        owner = _owner;
    }

}
