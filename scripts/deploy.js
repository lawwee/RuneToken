const main = async () => {
    const [deployer] = await hre.ethers.getSigners()
    const runeContractFactory = await hre.ethers.getContractFactory("RuneERC20")
    const runeContract = await runeContractFactory.deploy()
    await runeContract.deployed()

    console.log("Current contract address is", runeContract.address);
}

const runMain = async () => {
    try {
        await main()
        process.exit(0)
    } catch (error) {
        console.log(error);
        process.exit(1)
    }
}

runMain()