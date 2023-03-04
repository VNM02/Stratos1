// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol";

contract DShutterStock is OwnableUpgradeable {
    using AddressUpgradeable for address payable;

    enum Ltype {
        media,
        collection
    }

    /// @notice Structure for listed items
    struct User {
        address userAddress;
        collection[] collections;
        media[] medias;
        license[] licenses;
        owned[] owning;
    }
    struct owned {
        Ltype ltype;
        uint256 id;
        license lic;
    }

    struct license {
        address licensor;
        uint256 price;
        uint256 start;
        uint256 end;
        string terms;
        string name;
        string attestation;
    }

    struct collection {
        uint256 id;
        string name;
        string description;
        address licensor;
        media[] medias;
    }

    struct media {
        uint256 id;
        string name;
        string description;
        address licensor;
        media[] medias;
    }
    mapping(address => User) public users;
    mapping(uint256 => collection) public collections;
    mapping(uint256 => media) public medias;
    mapping(uint256 => license) public licenses;
    // create array of all users
    address[] public userAccts;

    // function to create a new user
    function createUser() public returns (uint256) {
        userAccts.push(msg.sender);
        return userAccts.length - 1;
    }
}
