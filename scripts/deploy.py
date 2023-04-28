from brownie import network
import os, json


def create_land_info_json(
    land_id,
    seller,
    buyer,
    land_size,
    cost,
    district,
    state,
):
    # Create a dictionary with the input data
    data = {
        "land_id": land_id,
        "seller": seller,
        "buyer": buyer,
        "land_size": land_size,
        "cost": cost,
        "district": district,
        "state": state,
    }

    # Write the data to a JSON file
    with open(f"{land_id}.json", "w") as outfile:
        json.dump(data, outfile)

    print("JSON file created successfully!")


# Call the function with user input
create_land_info_json(
    land_id=input("Enter land ID: "),
    seller=input("Enter seller name: "),
    buyer=input("Enter buyer name: "),
    land_size=float(input("Enter land size: ")),
    cost=float(input("Enter cost: ")),
    district=input("Enter district: "),
    state=input("Enter state: "),
)


def deploy_land_init():
    pass
