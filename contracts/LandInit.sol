//SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;
pragma experimental ABIEncoderV2;

import "./NFTHandling.sol";

contract LandInit {
    struct land_details {
        string land_id;
        string state;
        string district;
        uint256 val_inr; //Round figure always
        uint256 area_ha; //Multiplier is 1000, so 3 decimal places allowed
    }

    struct user_details {
        string username;
        address wallet_addr;
        string[] full_name;
        uint256 dob;
        string aadhar_no;
        string pan_no;
    }

    address curruser;

    constructor() public {
        curruser = msg.sender;
    }

    string[] usernames;
    string[] land_id_list;
    mapping(string => user_details) user_list; //username->userData
    mapping(string => land_details) land_info; //LandID->landData
    mapping(string => string) owner_info; //LandID->username

    mapping(address => string) addr_to_uname;

    function createUserStruct(
        string memory _username,
        address _wallet_addr,
        string[] memory _full_name,
        uint256 _dob,
        string memory _aadhar_no,
        string memory _pan_no
    ) public returns (user_details memory) {
        user_details memory user;

        // check if the _pan_no and _aadhar_no is valid
        // check if user is a valid person (above agelimit)

        user.username = _username;
        user.wallet_addr = _wallet_addr;
        user.full_name = _full_name;
        user.aadhar_no = _aadhar_no;
        user.pan_no = _pan_no;
        user.dob = _dob;

        return user;
    }

    function verifyOwner(string memory _username) public returns (bool) {
        for (uint256 i = 0; i < usernames.length; i++) {
            if (
                keccak256(abi.encode(_username)) ==
                keccak256(abi.encode(usernames[i]))
            ) {
                //found
                return true;
            }
        }

        return false;
    }

    function verifyLand(string memory _land_id) public returns (bool) {
        for (uint256 i = 0; i < land_id_list.length; i++) {
            if (
                keccak256(abi.encode(_land_id)) ==
                keccak256(abi.encode(land_id_list[i]))
            ) {
                //found
                return true;
            }
        }

        return false;
    }

    function registerUser(
        string memory _username,
        string[] memory _full_name,
        uint256 _dob,
        string memory _aadhar_no,
        string memory _pan_no
    ) public {
        // check if user does not exist

        for (uint256 i = 0; i < usernames.length; i++) {
            if (verifyOwner(_username)) {
                //found
                return;
            }
        }

        // if it does not:
        // save user in the database
        user_details memory newuser = createUserStruct(
            _username,
            curruser,
            _full_name,
            _dob,
            _aadhar_no,
            _pan_no
        ); //take inputs

        usernames.push(_username);
        user_list[_username] = newuser;
    }

    // do this properly
    function registerLand(
        string _owner,
        string _land_id,
        string _state,
        string _district,
        uint256 _val_inr,
        uint256 _area_ha
    ) public {
        if (_owner != addr_to_uname[curruser]) {
            // Check and verify if owner exists in system
            if (!verifyOwner(_owner)) return;
        }
        // mint nft by details
    }

    // removed TransactLand()
}
