
Array.prototype.randomElement = function (rand) {
  // console.log("prototype");
  // console.log(rand);
  // console.log("losujemy COS!!!!!!")
  // var cos = this[Math.floor(rand * this.length)];
  // console.log(cos);
  // return cos;
  return this[rand];
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
		var rand = Math.floor(Math.random()*authors.length);
		while (authorspool.indexOf(rand) != -1){
			rand = Math.floor(Math.random()*authors.length);	
			// console.log("reroll rand and " + rand )
		}
		// console.log(rand);
		authorspool.push(rand);
		return authors.randomElement(rand)
	} else {
		var rand = Math.floor(Math.random()*messages.length);
		while (messagespool.indexOf(rand) > -1){
			rand = Math.floor(Math.random()*messages.length);
			// console.log("reroll rand and " + rand )		
		}
		messagespool.push(rand)
		return messages.randomElement(rand)
	}
}
var poolReseter = function(){
	// console.log("poolReseter");
	if (authorspool.length == authors.length){
		console.log("reset authorpool");
		authorspool = [];
	}
	if (messagespool.length == messages.length){
		console.log("reset messagepool");
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
		// $("#txt").fadeOut(2000);
		$("#whole-quote").fadeOut(2000, function(){
			$("#txt").text(quote);
			$("#author").text(author);
		})
		$("#whole-quote").fadeIn(1000)//.css("display","inline-block");
		// $("#author").fadeIn(1500).css("display","inline-block");
		// $("#author").css("display","inline-block")
		}	
	$("#whole-quote").hide();
	randomQuote();
	var quotesLoop = setInterval(function(){randomQuote()},5000)
})
