//SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <=0.9.0;

contract LandInit {
    struct landDetails {
        uint256[] landID; //Slashes mean moving ahead in index
        string state;
        string district;
        string subdivision;
        uint256 val_INR; //Round figure always
        uint256 area_HA; //Multiplier is 1000, so 3 decimal places allowed
    }

    struct user_details {
        string[] full_name;
    }
}
