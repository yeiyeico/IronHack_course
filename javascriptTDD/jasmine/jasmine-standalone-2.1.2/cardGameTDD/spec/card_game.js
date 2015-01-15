/*
	TODO LIST:

	Input -> Output
	// one card
	f(['1'], ['2']) -> "Player2 wins 1 to 0"
	f(['2'], ['1']) -> "Player1 wins 1 to 0"
	f(['1'], ['1']) -> "Tie"

	// error cases
	f([''], ['']) -> "Throw Error('Invalid input')"
	f(['1'], ['1', '2']) -> "Throw Error('Invalid input')"

	// more than one card
	f(['9', '6'], ['J', 'Q']) -> "Player2 wins 2 to 0"
	f(['9', '6'], ['5', 'Q']) -> "Tie"
	f(['9', '6'], ['9', 'Q']) -> "Player2 wins 2 to 0"

	//multiple cards	
	f(['J','J','J','J','J'], ['J','J','J','J','J']) -> "Tie"
*/

function whoWins(hand1, hand2){
		if(hand1[0] < hand2[0]){
			return "Player2 wins 1 to 0";
		}else{
			return "Player1 wins 1 to 0"
		}
}

// var hand = ['1','2', '3', '4', '5', '6', '7', '8', '9', {J: 10}, {Q: 11}, {K: 12}];


describe("The highest card game - ", function(){
    it("May have a winner with a single round", function(){
			expect(whoWins(['1'], ['2'])).toBe("Player2 wins 1 to 0");
			expect(whoWins(['2'], ['1'])).toBe("Player1 wins 1 to 0");
    });

});




