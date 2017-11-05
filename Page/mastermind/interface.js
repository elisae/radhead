$(document).ready(function() {

	blankRow = $('.round-bar:first').clone(true);
	draggedPeg = null;
	roundCount = 0;

	$('body').on('touchmove', function (e) {
         if (!$('.scrollable').has($(e.target)).length) e.preventDefault();
 });

});

var blankRow;
var roundCount = 0;
var draggedPeg = null;

function drop(event) {
	event.preventDefault();
	if ($(event.target).hasClass("c-peg")) {
		$(event.target).replaceWith(draggedPeg);
	}
    else {
    	$(event.target).append(draggedPeg);
    }

    // enable/disable 
    if ($('.current * .c-peg').length === 4) {
		$('.current * .eval').removeClass('disabled');
	}
	else {
		$('.current * .eval').addClass('disabled');
	}
}

function drag(event) {
	if (event.target.parentNode.id == "c-peg-container") {
		draggedPeg = $(event.target).clone(true);
	}
	else {
		draggedPeg = $(event.target);
	}
}

// Evaluate candidate
function doEvaluation() {
	var res = getResult(getCandidate(), getSolution());
	renderKeyPegs(res);
	if (res.toString() === '1,1,1,1') {
		renderSolution();
		var r = confirm("Congratulations! Start new game?");
		if (r == true) {
			location.reload();
		}
	}
	else {
		if (roundCount <= 8) {
			newRow();
		}
		else {
			var r = confirm("Not this time... Try again?");
			if (r == true) {
				location.reload();
			}
		}
	}
}

function renderKeyPegs(key) {
	$('.current * .eval').addClass('disabled');
	$('.current * .evalbutton').addClass('disabled');
	$('.current  * .k-peg-wrapper').removeClass('disabled');
	var pegs = $('.current *.k-peg')

	for (var i = 0; i < key.length; i++) {
		var c = 'r' + key[i];
		$(pegs[i]).addClass(c);
	}
}

function renderSolution() {
	var sol = getSolution();
	jQuery.each($('.s-pos'), function(i, val) {
		$(val).attr('data-color', sol[i]);
	});
}

function newRow() {
	$('.current * .c-peg').removeAttr('draggable');
	$('.current * .c-pos').removeAttr('ondragover');
	$('.current * .c-pos').removeAttr('ondrop');
	$('.current').removeClass('current');
	$('#round-bars').append(blankRow.clone(true));
	roundCount++;
}

// Derive int array from set pegs
function getCandidate() {
	var can = [];

	jQuery.each($('.current * .c-peg'), function(i, val) {
		can.push(parseInt($(val).data('color')));
	});

	return can;
}


// -- TODO:
/* 
	- Kontrast (drop shadow)
	- immer vier k-pegs adden, ggf. grau 'leer'
	- sticky Solution und Spielfeld so hoch wie der Screen
	- responsive ?!
	- style
	- verschiedene levels


*/











