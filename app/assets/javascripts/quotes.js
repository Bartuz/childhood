var quotes = [
	{
		author: "\tJoan, Parent",
		msg: "I’m at work all day and I finally get to know what’s going on with my kid. I’d love for my husband and nanny to use it..."
	},
	{
		author: "Sean, Parent",
		msg: "This would be awesome to have my babysitter use."
	},
	{
		author: "Chris, Junior Kindergarten Teacher",
		msg: "I was using Learning Loop, making snacks, while working with an 8-month year old. Great for multi-tasking."
	},
	{
		author: "Erin, RECE",
		msg: "Why doesn’t this already exist? This should have been built a long time ago."
	},
	{
		author: "Jessica, RECE",
		msg: "I recorded 10 observations in an hour. I’ve NEVER been able to do that before with any of my kids."
	},
	{
		author: "Matt Gardner of <a target='_blank' href='https://groupnotes.ca/'>GroupNotes</a> (winners of Startup Weekend TO and Global Startup Battle 2012)",
		msg: "Great to see another kick ass viable company coming out of Startup Weekend!"
	},
	{
		author: "Jamie, RECE",
		msg: "This is a big step, not only for families and educators, but for the whole field of early childhood education."
	}
];
Array.prototype.randomElement = function () {
  return this[Math.floor(Math.random() * this.length)];
};
var pool = [];
var quote;
$(document).ready(function(){
	var randomQuote = function(){
		quote = quotes.randomElement()
		while (pool.indexOf(quote) != -1) {
			console.log(quote)
			console.log(quotes.indexOf(quote))
			quote = quotes.randomElement();
		};
		pool.push(quote);
		if (quotes.length === pool.length){
			pool = []
		}
		$("#whole-quote").fadeOut(1000, function(){
			$("#txt").text(quote.msg);
			$("#author").html(quote.author);
		})
		$("#whole-quote").fadeIn(1000)
		}	
	$("#whole-quote").hide();
	randomQuote();
	var quotesLoop = setInterval(function(){randomQuote()},8500)
})
