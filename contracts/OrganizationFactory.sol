pragma solidity ^0.4.18;

import './Organization.sol';
import './RewardProgram.sol';
import './BadgeProgram.sol';

contract OrganizationFactory {

    Organization[] public organizations;                    // an array of all Organizations addresses
    mapping(address => Organization) public ownerMap;       // a map of owener => orgnization

    event OrganizationCreated(address organization);

    function createOrganization(
        string _name,
        string _website,
        string _email,
        string _country,
        string _image,
        string _about,
        uint256 _tokenInitialAmount,
        string _tokenName,
        uint8 _tokenDecimal,
        string _tokenSymbol
    ) external returns (Organization) {
        require(ownerMap[msg.sender] == address(0x0));  // the owner must have no orginizations

        // creates the reward program
        RewardProgram rp = new RewardProgram(_tokenInitialAmount, _tokenName, _tokenDecimal, _tokenSymbol);
        rp.transfer(msg.sender, _tokenInitialAmount);   // sends the tokens to the owner
        rp.transferOwnership(msg.sender);

        BadgeProgram bp = new BadgeProgram();
        bp.transferOwnership(msg.sender);

        Organization org = new Organization(_name, _website, _email, _country, _image, _about, rp, bp);
        org.transferOwnership(msg.sender);

        ownerMap[msg.sender] = org;                     // to keep track of who created what
        organizations.push(org);                        // adds the token address to the list

        OrganizationCreated(org);
        return org;
    }

   /**
    * @return A Organizations array of all registered organizations.
    */
    function getOrganizations() external view returns (Organization[]) { return organizations; }

}

