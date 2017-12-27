pragma solidity ^0.4.18;

import "./Organization.sol";

contract OrganizationFactory {

    address[] public organizations;                    // an array of all Organizations addresses
    mapping(address => address) public ownerMap;       // a map of owener = > orgnization

    event OrganizationCreated(
        string _name,
        string _website,
        string _email,
        string _logoURL,
        string _tokenIconURL,
        string _about,
        uint256 _tokenInitialAmount,
        string _tokenName,
        uint8 _tokenDecimal,
        string _tokenSymbol
    );

    function createOrganization(
        string _name,
        string _website,
        string _email,
        string _logoURL,
        string _tokenIconURL,
        string _about,
        uint256 _tokenInitialAmount,
        string _tokenName,
        uint8 _tokenDecimal,
        string _tokenSymbol
    ) public returns (address) {
        require(ownerMap[msg.sender] == address(0x0));  // the owner must have no orginizations

        RewardProgram rp = new RewardProgram(_tokenInitialAmount, _tokenName, _tokenDecimal, _tokenSymbol);
        rp.transfer(msg.sender, _tokenInitialAmount);
        rp.transferOwnership(msg.sender);

        Organization org = new Organization(_name, _website, _email, _logoURL, _tokenIconURL, _about, address(rp));
        org.transferOwnership(msg.sender);

        ownerMap[msg.sender] = address(org);            // to keep track of who created what
        organizations.push(address(org));               // adds the token address to the list

        return address(org);
    }

    function getOrganizationsAddresses() public view returns (address[]) {
        return organizations;
    }

    function findOrganizationsAddressByOwner(address owner) public view returns (address) {
        return ownerMap[owner];
    }

}

