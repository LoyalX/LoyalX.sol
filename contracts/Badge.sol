pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

contract Badge is Ownable {

    string public name;
    string public rank;
    string public reason;
    string public details;
    string public image;
    string public styleData;
    string public version = "0.1";               // human 0.1 standard. Just an arbitrary versioning scheme.

    function Badge(string _name, string _rank, string _reason, string _details, string _image, string _styleData) public {
        name = _name;
        rank = _rank;
        reason = _reason;
        details = _details;
        image = _image;
        styleData = _styleData;
        owner = msg.sender;
    }

}
