// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


$(document).ready(function() {
	console.log( "ready!" );

	const pinField = document.getElementById("pin-field");

	const one = document.getElementById("1");
	const two = document.getElementById("2");
	const three = document.getElementById("3");
	const four = document.getElementById("4");
	const five = document.getElementById("5");
	const six = document.getElementById("6");
	const seven = document.getElementById("7");
	const eight = document.getElementById("8");
	const nine = document.getElementById("9");
	const zero = document.getElementById("0");
	let clearAll = document.getElementById("clear");


	if (one == undefined) {
		console.log('no numpad');
	} else {
		
		one.onclick = function(){
			pinField.value+='1';
		};

		two.onclick = function(){
			pinField.value+='2';
		};

		three.onclick = function(){
			pinField.value+='3';
		};

		four.onclick = function(){
			pinField.value+='4';
		};

		five.onclick = function(){
			pinField.value+='5';
		};

		six.onclick = function(){
			pinField.value+='6';
		};

		seven.onclick = function(){
			pinField.value+='7';
		};

		eight.onclick = function(){
			pinField.value+='8';
		};

		nine.onclick = function(){
			pinField.value+='9';
		};

		zero.onclick = function(){
			pinField.value+='0';
		};

		clearAll.onclick = function(){
			pinField.value='';
		};

	}



	const checkbox = document.getElementById("feedcheckbox");

	const span = document.getElementById("span");

	const statusValue = document.getElementById("statusValue");

	const hiddenBtn = document.getElementById("hiddenbtn");

	function clickHidden() {
		hiddenBtn.click();
	};

	checkbox.onclick = function(){
		if (checkbox.checked == true) {
			checkbox.checked = true;
			statusValue.value = "on";
			clickHidden()
		} else {
			checkbox.checked = false;
			statusValue.value = "off";
			clickHidden()
		}

	};
	console.log('hi')

});
