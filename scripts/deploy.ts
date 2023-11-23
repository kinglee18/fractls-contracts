import { ethers } from "hardhat";

async function main() {
  const FractlsToken = await ethers.deployContract("FractlsToken", []);
  await FractlsToken.waitForDeployment();
  console.log(
    `Contract FractlsToken deployed to ${FractlsToken.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
