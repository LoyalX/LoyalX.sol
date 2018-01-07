pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './Badge.sol';

contract BadgeProgram is Ownable {
    
    string public version = "0.1";                     // human 0.1 standard. Just an arbitrary versioning scheme.

    Badge[] public badges;                             // a list of created badges
    mapping(address => Badge[]) public issuedBadges;   // a list of issued badges (owner => badges index array)

    function BadgeProgram() public Ownable() {}

    event Issued(address indexed owner, Badge indexed badge);
    event Created(Badge indexed badge);

   /**
    * @dev Function to add a new badge to the reward program
    * @param _name       badge name
    * @param _rank       can be novice, advanced or may be lvl 1, lvl 2
    * @param _reason     rules to recive the badge, can contain html / md
    * @param _about      details about the badge, can contain html / md
    * @param _image      image url or an ipfs hash
    * @param _styleData  such as color or background color ... etc
    * @return A Badge the badge that has been created.
    */
    function add(string _name, string _rank, string _reason, string _about, string _image, string _styleData) public onlyOwner returns (Badge) {
        Badge nbadge = new Badge(_name, _rank, _reason, _about, _image, _styleData);
        badges.push(nbadge);
        Created(nbadge);
        return nbadge;
    }

   /**
    * @dev Function to issue to user badges
    * @param _badgeIndex The badge index from the Badgeprogram.badges array.
    * @param _to The address that will receive the badge.
    * @return A Badge the badge that has been issued.
    */
    function issue(uint _badgeIndex, address _to) onlyOwner public returns (Badge) {
        issuedBadges[_to].push(badges[_badgeIndex]);
        Issued(_to, badges[_badgeIndex]);
        return badges[_badgeIndex];
    }

   /**
    * @return A Badges array of all the badges in that reward program.
    */
    function getBadges() public view returns (Badge[]) { return badges; }

}
