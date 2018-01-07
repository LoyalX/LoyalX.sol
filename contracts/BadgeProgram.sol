pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './Badge.sol';

contract BadgeProgram is Ownable {

    string public version = "0.1";                     // human 0.1 standard. Just an arbitrary versioning scheme.
    Badge[] public badges;                             // a list of created badges
    mapping(address => Badge[]) public issuedBadges;   // a list of issued badges (owner => badges index array)

    function BadgeProgram() public {
        owner = msg.sender;
    }

    event Issued(address indexed owner, address indexed badge);
    event Created(address indexed badgeAddress);

    function add(string _name, string _rank, string _reason, string _details, string _image, string _styleData) onlyOwner public returns (Badge) {
        Badge nbadge = new Badge(_name, _rank, _reason, _details, _image, _styleData);
        badges.push(nbadge);
        Created(nbadge);
        return nbadge;
    }

    function issue(uint _badgeIndex, address _to) onlyOwner public returns (Badge) {
        issuedBadges[_to].push(badges[_badgeIndex]);
        Issued(_to, badges[_badgeIndex]);
        return badges[_badgeIndex];
    }

    function getBadges() public view returns (Badge[]) {
        return badges;
    }

}
