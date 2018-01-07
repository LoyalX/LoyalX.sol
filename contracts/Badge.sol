pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract Badge is Ownable {

    string public name;                     // badge name.
    string public rank;                     // can be novice, advanced or may be lvl 1, lvl 2.
    string public reason;                   // short reason why the user recived the badge.
    string public about;                    // about about the badge, can contain html / md.
    string public image;                    // image url or an ipfs hash.
    string public styleData;                // such as color or background color ... etc.
    string public version = "0.1";          // human 0.1 standard. Just an arbitrary versioning scheme.

    function Badge(
        string _name, 
        string _rank, 
        string _reason, 
        string _about, 
        string _image, 
        string _styleData
    ) public Ownable() {
        name = _name;
        rank = _rank;
        reason = _reason;
        about = _about;
        image = _image;
        styleData = _styleData;
        owner = msg.sender;
    }

}
