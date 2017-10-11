var Sleepy = artifacts.require("Sleepy.sol");

contract("Sleepy", function(accounts) {
	it("should calculate wakeTimes correctly", async function() {
		var sleepyInstance = await Sleepy.deployed();
		var time = Date.now();
		var output = await sleepyInstance.calculateWakeTimes.call(time);
		assert.equal(output.length, 5, "incorrect length");
		for (var i = 0; i < output.length; i++) {
			assert.equal(parseInt(output[i].valueOf()), time + (4+i) * 60 * 90 + 14 * 60, "incorrect array");
		}
	})

	it("should calculate bedTimes correctly", async function() {
		var sleepyInstance = await Sleepy.deployed();
		var time = Date.now();
		var output = await sleepyInstance.calculateBedTimes.call(time);
		assert.equal(output.length, 5, "incorrect length");
		for (var i = 0; i < output.length; i++) {
			assert.equal(parseInt(output[i].valueOf()), time - (4+i) * 60 * 90 - 14 * 60, "incorrect array");
		}
	})
})
