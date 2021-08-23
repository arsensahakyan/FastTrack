const { expect } = require("chai");
var ArsErc20, arsErc20, accounts;

beforeEach(async () => {    
  ArsErc20 = await ethers.getContractFactory("ArsErc20");
  arsErc20 = await ArsErc20.deploy("69", "qtatsak", "18", "🔥");
  accounts = await ethers.getSigners();
  await arsErc20.deployed();
})

describe("ArsErc20", function () {
  it("Should intialize contract correctly, ապե", async function () {
    var jebiPox = await arsErc20.totalSuppply();
    var nazvanyaEtyvyDambula = await arsErc20.name();
    var ankapBan = await  arsErc20.decimals();
    var anterSymbol = await arsErc20.symbol();

    expect(jebiPox.toString()).to.equal("69");
    expect(nazvanyaEtyvyDambula.toString()).to.equal("qtatsak");
    expect(ankapBan.toString()).to.equal("18");
    expect(anterSymbol.toString()).to.equal("🔥");
  });

  it("Should test mint function, hommy", async function() {
    await arsErc20.mint(accounts[2].address, 12345)
    var balanceOf = await arsErc20.balanceOf(accounts[2].address);

    expect(balanceOf.toString()).to.equal("12345");
  });

  it("Burn", async function() {
    await arsErc20.burn(accounts[0].address, "12");
    var balanceOf = await arsErc20.balanceOf(accounts[0].address);
    expect(balanceOf.toString()).to.not.equal("69");
  })

  it("transfer", async function() {
    await arsErc20.transfer(accounts[1].address, 14);
    var balanceOf = await arsErc20.balanceOf(accounts[1].address);
    expect(balanceOf.toString()).to.equal("14");
  })

  it("transferFrom", async  function() {
    await arsErc20.approve(accounts[1].address, 5)
    await arsErc20.transferFrom(accounts[0].address, accounts[1].address, 4);
    var balanceOf = await arsErc20.balanceOf(accounts[1].address);
    expect(balanceOf.toString()).to.equal("4")
  })
});