
function dologin(){
	
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;

	if(username == "" || password == ""){
		document.getElementById("errDiv").innerHTML = "User Name and Password must not be empty!!!";
		return false;
	}
	
}

function trim(str, chars) {
	return ltrim(rtrim(str, chars), chars);
}
function ltrim(str, chars) {
	chars = chars || "\\s";
	return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
}
 
function rtrim(str, chars) {
	chars = chars || "\\s";
	return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
}

function pnotify_call(title,type,text)
{
	
	var modal_overlay;
	
	new PNotify({
		history: false,
		title: title,
		text: text,
		type: type,
		pnotify_closer: true,
		// After a delay, make the notice disappear.
		pnotify_hide: true,
		// Delay in milliseconds before the notice disappears.
		pnotify_delay: 1000,
		// Remove the notice from the DOM after it disappears.
		pnotify_remove: true,
		sticker: false,
		before_open: function(PNotify) {
		// Position this notice in the center of the screen.
            PNotify.get().css({
                "top": ($(window).height() / 2) - (PNotify.get().height() / 2),
                "left": ($(window).width() / 2) - (PNotify.get().width() / 2)
            });
		// Make a modal screen overlay.
		if (modal_overlay) modal_overlay.fadeIn("fast");
		else modal_overlay = $("<div />", {
			"class": "ui-widget-overlay",
			"css": {
				"display": "none",
				"position": "fixed",
				"top": "0",
				"bottom": "0",
				"right": "0",
				"left": "0",
				"background": "#AAAAAA",
				"opacity": "0.3",
				"z-index": "10"
			}
			}).appendTo("body").fadeIn("fast");
		},
		before_close: function() {
			modal_overlay.fadeOut("fast");
		}
	});
	
}

function pnotify_call2(title,type,text)
{
	
	var modal_overlay;
	
	new PNotify({
		history: false,
		title: title,
		text: text,
		type: type,
		width: '730px',
		min_height: '150px',
		pnotify_closer: true,
		// After a delay, make the notice disappear.
		pnotify_hide: true,
		// Delay in milliseconds before the notice disappears.
		pnotify_delay: 1000,
		// Remove the notice from the DOM after it disappears.
		pnotify_remove: true,
		sticker: false,
		before_open: function(PNotify) {
		// Position this notice in the center of the screen.
            PNotify.get().css({
                "top": ($(window).height() / 2) - (PNotify.get().height() / 2)-150,
                "left": ($(window).width() / 2) - (PNotify.get().width() / 2)
            });
		// Make a modal screen overlay.
		if (modal_overlay) modal_overlay.fadeIn("fast");
		else modal_overlay = $("<div />", {
			"class": "ui-widget-overlay",
			"css": {
				"display": "none",
				"position": "fixed",
				"top": "0",
				"bottom": "0",
				"right": "0",
				"left": "0",
				"background": "#AAAAAA",
				"opacity": "0.3",
				"z-index": "10"
			}
			}).appendTo("body").fadeIn("fast");
		},
		before_close: function() {
			modal_overlay.fadeOut("fast");
		}
	});
	
}

function doSelectAllChkbox(selectAllChkboxId)
{
	var rowcount = document.getElementById("rowcount").value;
	
	if(document.getElementById("selectAll"+selectAllChkboxId).checked == true)
	{
		for(var rc=0;rc<rowcount;rc++)
		{
			var selectEachChkbox = "selectEach"+selectAllChkboxId+rc;

			document.getElementById(selectEachChkbox).checked = true;

		}
	}
	else
	{
		for(var rc=0;rc<rowcount;rc++)
		{
			var selectEachChkbox = "selectEach"+selectAllChkboxId+rc;
			
			document.getElementById(selectEachChkbox).checked = "";
		}
	}
}

function goback() {
    window.history.back();
}