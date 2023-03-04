require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("@openzeppelin/hardhat-upgrades");
require("dotenv").config();
// import env variables

// const { API_URL, PRIVATE_KEY } = process.env;

module.exports = {
  solidity: "0.8.17",

  defaultNetwork: "hardhat",
  networks: {
    hardhat: {},
    maticmumbai: {
      url: "https://polygon-mumbai.g.alchemy.com/v2/ZwsoQw-VMxyKqzMsRZgrnUMmxvrfOgT0",
      accounts: [
        "3aa8c280f6a6e07b0eb5d046eaa92330a51f226d6f4a47945145bb613f4dbc31",
      ],
    },
  },
  // etherscan: {

  //   apiKey: "HBMB8ER9AI26GMHR2IAGYK6KS3AX3FA6J1"
  // }
  etherscan: {
    apiKey: process.env.POLYGONSCAN_API,
  },
};
