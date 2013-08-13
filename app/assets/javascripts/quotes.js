
Array.prototype.randomElement = function (rand) {
  // console.log("prototype");
  // console.log(rand);
  // console.log("losujemy COS!!!!!!")
  // var cos = this[Math.floor(rand * this.length)];
  // console.log(cos);
  // return cos;
  return this[rand];
};
var authors = ["jake","kellysy","bronzedane","bronze93","ghost9","jol4nta","alicepractise","biGBro","adamson32","marpec","eddies","zywiecdobry","kurkaa","torontaah", "cbuccell","jakea"];
var messages = [
	"Parental involvement enhances performance",
	"Parents support schools by knowing",
	"Gathering evidence is important",
	"This software is efficient and easy",
	"This software could help 70% of kids",
	"Parent teacher communication is important",
	"Let's engage teachers,educators and parents",
	"LearningLoop is a great classroom tool",
	"I would use it again and again",
	"This tool could help over 250,000 children!",
	"Sign me up today! I want to be in the loop",
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
		$("#whole-quote").fadeOut(1000, function(){
			$("#txt").text(quote);
			$("#author").text(author);
		})
		$("#whole-quote").fadeIn(1000)//.css("display","inline-block");
		// $("#author").fadeIn(1500).css("display","inline-block");
		// $("#author").css("display","inline-block")
		}	
	$("#whole-quote").hide();
	randomQuote();
	var quotesLoop = setInterval(function(){randomQuote()},7500)
})
