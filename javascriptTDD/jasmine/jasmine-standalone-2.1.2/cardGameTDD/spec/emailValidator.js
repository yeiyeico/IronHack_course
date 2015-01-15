/*
	TODO LIST:
	
	Input -> Output
	f([]) -> []
	f([""]) -> ['']
	f(["uno@gmail.com"]) -> ['uno@gmail.com']
	f(["uno"]) -> []
	f(["uno@gmail.com", "dos@gmail.com"]) -> ["uno@gmail.com", "dos@gmail.com" ]
	f(["uno@gmail.com", "dos"]) -> ["uno@gmail.com", '' ]
	*/

	function readerofemail(emailinfo){
		if (emailinfo.length === 0){
			return [];	
		}
		
		var recogedor = [];

		if(emailinfo[0].indexOf("@") >= 0){
			recogedor.push(emailinfo[0]);	
		};

		if(emailinfo.length > 1){
			if(emailinfo[1].indexOf("@") >= 0){
				recogedor.push(emailinfo[1]);
			};
		};
		return recogedor;
	};


	describe("Email finder - ", function(){
		it("array with no email", function(){
			expect(readerofemail([])).toEqual([]);
			expect(readerofemail([""])).toEqual([]);
		});

		it("array with one email", function(){
			expect(readerofemail(["uno@gmail.com"])).toEqual(["uno@gmail.com"]);
		});

		it("array with a string that is not a email", function(){
			expect(readerofemail(['uno'])).toEqual([]);
		});

		it("find the emails in my string with multiple positions", function(){
			expect(readerofemail(["uno", "dos@gmail.com"])).toEqual(["dos@gmail.com"]);
		});

	});