from brownie import accounts, config, LandInit, LandToken, network
from scripts.json_handler import create_txn_json, create_nft_json

KEY_INSPECTOR = accounts[0]


def deploy_all():
    # account = get_account()
    land_init = LandInit.deploy({"from": KEY_INSPECTOR})
    land_token = LandToken.deploy({"from": KEY_INSPECTOR})


# def get_account():
#     if network.show_active() == "development":
#         return accounts[0]
#     else:
#         return accounts.add(config["wallets"]["from_key"])


def main():
    deploy_all()
