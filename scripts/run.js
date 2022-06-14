const main = async () => {
    const [ owner, randomUser, anotherUser, newUser ] = await hre.ethers.getSigners()
    const runeContractFactory = await hre.ethers.getContractFactory("RuneERC20")
    const runeContract = await runeContractFactory.deploy()
    await runeContract.deployed()

    console.log("This is the contract address:", runeContract.address);

    // let contractBalance = await hre.ethers.provider.getBalance(runeContract.address)
    // console.log("Contract Balance is", hre.ethers.utils.formatEther(contractBalance));

    let txn = await runeContract.totalSupply()

    txn = await runeContract.balanceOf(owner.address)

    txn = await runeContract.balanceOf(randomUser.address)

    txn = await runeContract.balanceOf(anotherUser.address)

    txn = await runeContract.transfer(randomUser.address, 1000);
    await txn.wait()

    txn = await runeContract.connect(randomUser).transferFrom(randomUser.address, anotherUser.address, 100)
    await txn.wait()

    txn = await runeContract.balanceOf(randomUser.address)

    txn = await runeContract.balanceOf(anotherUser.address)

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