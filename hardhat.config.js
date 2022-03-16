require("@nomiclabs/hardhat-waffle");

// DO NOT USE ON MAINNET (pubkey: 0x56815921836185780e598c857e6A37013E1A561e)
const GOERLI_PRIVATE_KEY = "3ba0ece7b93b81f491d65a39964941081b9f00b7c64d93f4c2720d1230945579"

const INFURA_API_KEY = "a3752ec06a7a4c64bfbe4de03e5a39fd"

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  networks: {
    hardhat: {
      forking: {
        // url: `https://mainnet.infura.io/v3/${INFURA_API_KEY}`
        url: `https://goerli.infura.io/v3/${INFURA_API_KEY}`
      }
    },
    goerli: {
      url: `https://goerli.infura.io/v3/${INFURA_API_KEY}`,
      accounts: [`${GOERLI_PRIVATE_KEY}`],
    },
},
  solidity: "0.8.4",
};
