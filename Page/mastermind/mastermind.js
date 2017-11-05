$(document).ready(function() {

	var solution;

	setSolution();

});


//	Returns array of key pegs 
function getResult(can, sol) {
	var res = [];
	console.log(sol);
	jQuery.each(can, function(i, val) {		// Check for absolute matches
		if (val === sol[i]) {
			res.push(1);					// 1 ^= "red"
			sol[i] = -2;
			can[i] = -1;
		}
	});
	jQuery.each(can, function(i, val) {		// Check for relative matches
		var pos = jQuery.inArray(val, sol);
		if (pos >= 0) {
			res.push(0);					// 2 ^= "white"
			sol[pos] = -2;
			can[i] = -1;
		}
	});
	res.sort();	
	return res;
}

// --  TODO: random at restart --
function setSolution() {
	var sol = [];
	var i = 0;

	while (i < 4) {
		var n = Math.floor((Math.random() * 8) + 1);
		if (jQuery.inArray(n, sol) < 0 ) {
			sol.push(n);
			i++;
		}	
	}
	console.log("Yeah, if you wanna cheat, here's the solution:")
	console.log(sol);
	solution = sol;
}

function getSolution() {
	return JSON.parse(JSON.stringify(solution));;
}

function finishGame(text) {
	var r = confirm(text);
	if (r == true) {
		location.reload();
	}
}







