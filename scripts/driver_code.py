from brownie import accounts, config, LandInit, LandToken, network
from scripts.json_handler import create_txn_json, create_nft_json, display_json

import os

pvt_key_seller = accounts[1]
pvt_key_buyer = accounts[2]
pvt_key_land_inspector = accounts[3]

land_init = LandInit[-1]
land_token = LandToken[-1]


def register_user():
    _uname = input("Enter username: ")

    if land_init.verifyOwner(_uname) == True:
        print("User already exists!")
        return
    else:
        _wallet_addr = pvt_key_seller
        _full_name = input("Enter full name: ")
        _aadhar_no = input("Enter aadhar number: ")
        _pan_no = input("Enter PAN number: ")

        land_init.registerUser(
            _uname,
            _wallet_addr,
            _full_name,
            _aadhar_no,
            _pan_no,
            {"from": pvt_key_seller},
        )


def register_land(uname):
    land_id = input("Enter Land ID: ")
    if land_init.verifyLand(land_id, {"from": pvt_key_seller}) == True:
        print("ERROR: Land exists.")
        return
    # Add check for land exists but with different owner

    create_txn_json(
        txn_type="init",
        old_land_id=land_id,
        seller=input("Enter previous owner username: "),
        buyer=uname,
        land_size=input("Enter land size: "),
        cost=input("Enter cost: "),
        district=input("Enter district: "),
        state=input("Enter state: "),
    )

    land_inspector(f"files/txn_{land_id}.json")


def land_inspector(filename):
    print("--------------LAND INSPECTOR--------------")
    display_json(filename)
    choice = int(input("1=approve or 2=reject?: "))
    if choice == 2:
        os.remove(filename)
        print("Rejected.")
        return
    create_nft_json(filename)


def main():
    register_user()
    register_land("dhairya")
