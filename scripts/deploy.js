
const { ethers } = require("hardhat");

const LINK_TO_FILE = 'linkToFile';
const NUMBER_OF_OPTIONS = 5;

const deploy = async () => {

  let Raffle = await ethers.getContractFactory("Raffle");
  let raffle = await Raffle.deploy(LINK_TO_FILE, NUMBER_OF_OPTIONS);

  console.log(`Raffle deployed to ${raffle.address}`);

};

deploy().catch(err => console.error(err)).then();