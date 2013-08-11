
Array.prototype.randomElement = function (rand) {
	var rand = Math.random();
	while (pool.indexOf(rand) != -1){
		rand = Math.random();
	}
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
	poolReseter();
	if (array == "a"){
		var rand = Math.random();
		while (authorspool.indexOf(rand) != -1){
			rand = Math.random()		
		}
		authorspool << rand;
		return authorsPool.randomElement(rand)
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
	if (authorspool.length == authors.length){
		authorspool = [];
	}
	if (messagespool.length == messages.length){
		messagespool = [];
	}
	return true;
}

$(document).ready(function(){
	var randomQuote = function(){
	var quote = randomizer("m");
	var author = randomizer("a");
	$("#txt").fadeout('slow');
	$("#author").fadeout('slow');
	$("#txt").text(quote);
	$("#author").text(author);
	$("#txt").fadein('fast').then(function(){
		$("#author").fadein('fast');
	});
	}	
	var quotesLoop = setInterval(function(){randomQuote(),4000})
})
