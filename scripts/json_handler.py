import os, json


def create_txn_json(
    type_of_txn,
    old_land_id,
    seller,
    buyer,
    land_size,
    cost,
    district,
    state,
):
    # Create a dictionary with the input data
    data = {
        "type_of_txn": type_of_txn,
        "old_land_id": old_land_id,
        "seller": seller,
        "buyer": buyer,
        "land_size": land_size,
        "cost": cost,
        "district": district,
        "state": state,
    }

    # Write the data to a JSON file
    with open(f"txn_{old_land_id}.json", "w") as outfile:
        json.dump(data, outfile)

    print("JSON file created successfully!")


def create_nft_json(json_file):
    with open(json_file, "r") as f:
        data_dict = json.load(f)

    land_id_arr = []

    if data_dict["type_of_txn"] == "split":
        land_id_arr[0] = data_dict["old_land_id"] + "_1"
        land_id_arr[1] = data_dict["old_land_id"] + "_2"
    else:
        land_id_arr[0] = data_dict["old_land_id"]

    if land_id_arr.size == 2:
        new_entry_2 = {
            "land_id": land_id_arr[1],
            "new_owner": data_dict["seller"],
            "old_owner": data_dict["seller"],
            "size": data_dict["land_size"],  # Make this auto calculate
            "cost": data_dict["cost"],
            "district": data_dict["district"],
            "state": data_dict["state"],
        }

        # Write the data to a JSON file
        with open(f"nft_{land_id_arr[1]}.json", "w") as outfile:
            json.dump(new_entry_2, outfile)

    # Create old entry
    new_entry_1 = {
        "land_id": land_id_arr[0],
        "new_owner": data_dict["buyer"],
        "old_owner": data_dict["seller"],
        "land_size": data_dict["land_size"],
        "cost": data_dict["cost"],
        "district": data_dict["district"],
        "state": data_dict["state"],
    }

    # Write the data to a JSON file
    with open(f"nft_{land_id_arr[0]}.json", "w") as outfile:
        json.dump(new_entry_1, outfile)


# Call the function with user input
# create_land_info_json(
#     old_land_id=input("Enter old land ID: "),
#     seller=input("Enter seller username: "),
#     buyer=input("Enter buyer username: "),
#     land_size=float(input("Enter land size: ")),
#     cost=float(input("Enter cost: ")),
#     district=input("Enter district: "),
#     state=input("Enter state: "),
# )
