const Coinflip = artifacts.require("Coinflip");

module.exports = function(deployer) {
  deployer.deploy(Coinflip).then((instance)=>{
    console.log("instance address: " + instance.address);
  });
};
