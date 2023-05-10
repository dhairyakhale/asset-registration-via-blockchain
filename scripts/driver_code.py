from brownie import accounts, config, LandInit, LandToken, network
from scripts.json_handler import create_txn_json, create_nft_json, display_json
from scripts.deploy import KEY_INSPECTOR

import os, json

KEY_SELLER = accounts[1]
KEY_BUYER = accounts[2]

land_init = LandInit[-1]
land_token = LandToken[-1]


def register_user():
    _uname = input("Enter username: ")

    if land_init.verifyOwner(_uname) == True:
        print("User already exists!")
        return
    else:
        _wallet_addr = KEY_SELLER
        _full_name = input("Enter full name: ")
        _aadhar_no = input("Enter aadhar number: ")
        _pan_no = input("Enter PAN number: ")

        land_init.registerUser(
            _uname,
            _wallet_addr,
            _full_name,
            _aadhar_no,
            _pan_no,
            {"from": KEY_SELLER},
        )


def register_land(uname):
    land_id = input("Enter Land ID: ")
    if land_init.verifyLand(land_id, {"from": KEY_SELLER}) == True:
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
    # with open(filename, "r") as f:
    #     data_json = json.load(f)
    # create_nft_json(filename)

    # if data_json["txn_type"] == "split":
    #     land_init.registerLand(data_json[""],{"from": KEY_INSPECTOR})


def main():
    register_user()
    register_land("dhairya")
