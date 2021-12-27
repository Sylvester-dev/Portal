const hre = require("hardhat");

async function main() {

  const [deployer] = await hre.ethers.getSigners();
  const accountBalance = await deployer.getBalance();

  console.log("Deploying contracts with account: ", deployer.address);
  console.log("Account balance: ", accountBalance.toString());

  const Portal = await hre.ethers.getContractFactory("Portal");
  const portal = await Portal.deploy();

  await portal.deployed();

  console.log("Portal deployed to address:", portal.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
