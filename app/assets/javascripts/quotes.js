
Array.prototype.randomElement = function (rand) {
  console.log("prototype")
  return this[Math.floor(rand * this.length)];
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
	console.log("randomizer");
	poolReseter();
	if (array == "a"){
		var rand = Math.random();
		while (authorspool.indexOf(rand) != -1){
			rand = Math.random()		
		}
		authorspool << rand;
		return authorspool.randomElement(rand)
	} else {
		var rand = Math.random();
		while (messagespool.indexOf(rand) != -1){
			rand = Math.random()		
		}
		messagespool = []
		return messagespool.randomElement(rand)
	}
}
var poolReseter = function(){
	console.log("poolReseter");
	if (authorspool.length == authors.length){
		authorspool = [];
	}
	if (messagespool.length == messages.length){
		messagespool = [];
	}
	return true;
}

$(document).ready(function(){
	console.log("doc redy");
	var randomQuote = function(){
	console.log("randomQuote");
	var quote = randomizer("m");
	var author = randomizer("a");
	$("#txt").fadeOut('slow');
	$("#author").fadeOut('slow');
	$("#txt").text(quote);
	$("#author").text(author);
	$("#txt").fadeIn('fast');
		$("#author").fadeIn('fast');
	;
	}	
	var quotesLoop = setInterval(function(){randomQuote()},4000)
})
