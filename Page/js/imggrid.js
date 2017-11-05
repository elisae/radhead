$(document).ready(function() {
	$.when(fillSidebarNav()).done(function(r) {
		renderPage('photos');
	});


    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
});

function renderPage(cat) {
	$('.sidebar-nav li.selected').removeClass("selected");
	$('li[data-cat="'+cat+'"]').addClass("selected");

	$("#wrapper").removeClass("toggled");

	fillTopNav(cat).done(function(r) {
		var firstalb = $('ul.top-nav li').data('alb');
		fillGrid('main_grid', cat, firstalb);
	});
}

function fillGrid(gridid, cat, alb) {
	$('.top-nav li.selected').removeClass("selected");
	$('.top-nav li[data-alb="'+alb+'"]').addClass("selected");

	$('#' + gridid).empty();

	if (cat == "instagram") {
		getData("https://api.instagram.com/v1/users/**user**/media/recent/?access_token=**token**", "jsonp", function(data) {
			renderInstaboxes(data, gridid);
		});
	}
	else {
		getData("/portfolio/api/images.php/?cat="+cat+"&alb="+alb, "json", function(data) {
			renderBoxes(data, cat, gridid);
		});
	}
}

function renderBoxes(data, cat, gridid) {
	var len = data.length;
	var i = 0;

	var timer = setInterval(function() {
		renderImgbox("/portfolio/img/"+cat+"/" + data[i].filename_resized, "/portfolio/img/"+cat+"/" + data[i].filename_thumb, cat, data[i].title, data[i].date, gridid);
		i++;
		if (i >= len) {
			clearInterval(timer);
		}
	}, 10);
}

function renderImgbox(url_reg, url_thumb, cat, title, date, gridid) {
	$("<div style='display: none' class='imgbox'>")
	.append($("<a href='"+url_reg+"'></a>")
		.attr('data-lightbox', 'cat-' + cat)
		.attr('data-title', title)
		.attr('data-date', date)
		.append("<img alt='Image' src='"+url_thumb+"'></img>"))
	.appendTo('#'+gridid)
	.fadeIn(300);
}

function getData(url, datatype, next) {
	$.ajax({
		method: "GET",
		url: url,
		success: function(data) {
			next(data); },
		dataType: datatype
	});
}

function renderInstaboxes(data, gridid) {
	var len = data.data.length;
	var i = 0;

	var timer = setInterval(function() {
		renderImgbox(data.data[i].images.standard_resolution.url, data.data[i].images.thumbnail.url, "instagram", '', data.data[i].created_time, gridid);
		i++;
		if (i >= len) {
			clearInterval(timer);
		}
	}, 10);
	if (data.pagination.next_url != null) {
		getData(data.pagination.next_url, "jsonp", function(data) {
			renderInstaboxes(data, gridid);
		});
	}
}

function fillSidebarNav() {
	var r = $.Deferred();
	$.get("/portfolio/api/categories.php", function(data) {
		for (var i = 0; i < data.length; i++) {
			$("<li></li>")
			.attr('data-cat', data[i])
			.attr('onclick', "renderPage('" + data[i] + "');")
			.text(data[i].capitalize())
			.appendTo('.sidebar-nav');
		}
		$("<li></li>")
		.attr('data-cat', 'instagram')
		.attr('onclick', "renderPage('instagram');")
		.text('Instagram')
		.appendTo('.sidebar-nav');
		r.resolve();
	});
	return r.promise();
}

function fillTopNav(cat) {
	var r = $.Deferred();
	$('.top-nav').empty();
	$.get("/portfolio/api/albums.php?cat=" + cat, function(data) {
		for (var i = 0; i < data.length; i++) {
			$("<li></li>")
			.attr('data-alb', data[i])
			.attr('onclick', "fillGrid('main_grid','" + cat + "', '" + data[i] + "');")
			.text(data[i].capitalize())
			.appendTo('.top-nav');
		}
		r.resolve();
	});
	return r.promise(cat);
}

String.prototype.capitalize = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
}
