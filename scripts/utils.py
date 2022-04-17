import json, os
from brownie import Contract, accounts
from dotenv import load_dotenv
from scripts.registry import contract_name_to_artifact

load_dotenv()  # take environment variables from .env.

DEPLOYER = accounts.add(os.environ["DEPLOYER"])

DAY = 86_400  # in seconds
YEAR = 365 * DAY


def tx_param(addr):
    return {"from": addr}


# Load contract from Cache or Explorer if not found
def load_contract(addr):
    try:
        contract = Contract(addr)
    except ValueError:
        contract = Contract.from_explorer(addr)

    return contract


# 0,1%
def almostEqual(a, b, thresh=0.001):
    return a <= b + thresh * abs(b) and a >= b - thresh * abs(b)


def deploy(type, *args):
    artifact = contract_name_to_artifact(type)
    constructor_args = list(*args)
    contract = artifact.deploy(*constructor_args, tx_param(DEPLOYER))
    return contract


def append_json(path, data):
    try:
        with open(path, "r") as f:
            file_data = json.load(f)

        with open(path, "w") as f:
            file_data.append(data)
            json.dump(file_data, f)

    except json.decoder.JSONDecodeError:
        with open(path, "w") as f:
            json.dump([data], f)
