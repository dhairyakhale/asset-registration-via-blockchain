//SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

import "./LandToken.sol";

contract LandInit {
    struct land_details {
        string land_id;
        string state;
        string district;
        uint256 val_inr;
        uint256 area_ha;
    }

    struct user_details {
        string username;
        address wallet_addr;
        string full_name;
        string aadhar_no;
        string pan_no;
    }

    string[] usernames;
    string[] land_id_list;
    mapping(string => user_details) user_list; //username->userData
    mapping(string => land_details) land_info; //LandID->landData
    mapping(string => string) owner_info; //LandID->username

    mapping(address => string) addr_to_uname;

    function verifyOwner(string memory _username) public view returns (bool) {
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

    function verifyLand(string memory _land_id) public view returns (bool) {
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

    function createUserStruct(
        string memory _username,
        address _wallet_addr,
        string memory _full_name,
        string memory _aadhar_no,
        string memory _pan_no
    ) public pure returns (user_details memory) {
        user_details memory user;

        // check if the _pan_no and _aadhar_no is valid
        // check if user is a valid person (above agelimit)

        user.username = _username;
        user.wallet_addr = _wallet_addr;
        user.full_name = _full_name;
        user.aadhar_no = _aadhar_no;
        user.pan_no = _pan_no;

        return user;
    }

    function registerUser(
        string memory _username,
        address _wallet_addr,
        string memory _full_name,
        string memory _aadhar_no,
        string memory _pan_no
    ) public {
        // save user in the database
        user_details memory newuser = createUserStruct(
            _username,
            _wallet_addr,
            _full_name,
            _aadhar_no,
            _pan_no
        ); //take inputs

        usernames.push(_username);
        user_list[_username] = newuser;
    }

    function createLandStruct(
        string memory _land_id,
        string memory _state,
        string memory _district,
        uint256 _val_inr,
        uint256 _area_ha
    ) public pure returns (land_details memory) {
        land_details memory land;

        land.land_id = _land_id;
        land.state = _state;
        land.district = _district;
        land.val_inr = _val_inr;
        land.area_ha = _area_ha;

        return land;
    }

    // do this properly
    function registerLand(
        string memory _buyer,
        string memory _seller,
        string memory _land_id,
        string memory _state,
        string memory _district,
        uint256 _val_inr,
        uint256 _area_ha,
        string memory uri
    ) public {}
}
