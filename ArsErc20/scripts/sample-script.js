const hre = require("hardhat");

async function main() {
  const ArsErc20 = await hre.ethers.getContractFactory("ArsErc20");
  const arsErc20 = await ArsErc20.deploy("69", "qtatsak", 18, "🔥");

  await arsErc20.deployed();

  console.log("Քթածակը դիփլոյվել է:", arsErc20.address);
  let bobol = await arsErc20.totalSuppply();
  console.log(bobol.toString());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });