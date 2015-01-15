describe("some function", function(){
	it("calculate the average of an array", function(){
		expect(average([4,6])).toEqual(5);
	});

	it("calculates the maximum number", function(){
		expect(maximum([3,6,1,20])).toEqual(20);
	});

	it("calculates the minimum number", function(){
		expect(minimum([3,6,1,20])).toEqual(1);
	});
});