
Array.prototype.randomElement = function (rand) {
  // console.log("prototype");
  // console.log(rand);
  // console.log("losujemy COS!!!!!!")
  var cos = this[Math.floor(rand * this.length)];
  // console.log(cos);
  return cos;
  // return this[Math.floor(rand * this.length)];
};
var authors = ["melinium","kellysy","bronzedane","mumm","tlorke","jol4nta","alicepractise","biGBro","adamson32","marpec","eddies","zywiecdobry","kurkaa","torontaah"];
var messages = [
	"This will change everything",
	"My kid is a big boy",
	"I'll go back Poland in 1 week",
	"Breakfast was pretty good",
	"I live near quens parks",
	"Give me tennis ball"
];
var authorspool = []
var messagespool = []
var randomizer = function(array){
	// console.log("Now I randomize with " + array);
	poolReseter();
	if (array == "a"){
		var rand = Math.random();
		while (authorspool.indexOf(rand) != -1){
			rand = Math.random()		
			// console.log("reroll rand and " + rand )
		}
		// console.log(rand);
		authorspool.push(rand);
		return authors.randomElement(rand)
	} else {
		var rand = Math.random();
		while (messagespool.indexOf(rand) > -1){
			rand = Math.random()
			// console.log("reroll rand and " + rand )		
		}
		messagespool.push(rand)
		return messages.randomElement(rand)
	}
}
var poolReseter = function(){
	// console.log("poolReseter");
	if (authorspool.length == authors.length){
		authorspool = [];
	}
	if (messagespool.length == messages.length){
		messagespool = [];
	}
	return true;
}

$(document).ready(function(){
	// console.log("doc redy");
	var randomQuote = function(){
		// console.log("I just entered randomQuote...");
		var quote = randomizer("m");
		// console.log(quote);
		var author = randomizer("a");
		// console.log(author);
		$("#txt").hide();
		$("#author").hide();
		$("#txt").text(quote);
		$("#author").text(author);
		$("#txt").fadeIn('slow').css("display","inline-block");
		$("#author").fadeIn('slow').css("display","inline-block");
		}	
	var quotesLoop = setInterval(function(){randomQuote()},5000)
})
