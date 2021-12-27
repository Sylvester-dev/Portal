const hre = require("hardhat");

async function main() {
  const [owner, randomPerson] = await hre.ethers.getSigners(); //getting owner and random address
  const Portal = await hre.ethers.getContractFactory("Portal");
  const portal = await Portal.deploy();
  await portal.deployed();

  console.log("Poratl deployed to:", portal.address);
  console.log("Poratl deployed by:", owner.address);

  let waveCount;
  waveCount = await portal.getTotalWaves(); //first we get total waves
  let waveTxt = await portal.wave();   //then we wave
  await waveTxt.wait();
  waveCount = await portal.getTotalWaves(); //and again get total waves

  //to let others greet
  waveTxt = await portal.connect(randomPerson).wave();  
  await waveTxt.wait();
  waveCount = await portal.getTotalWaves();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
