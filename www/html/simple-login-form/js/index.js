
function sendData( id, uri, params ){
	var ajaxUrl = "";
	ajaxUrl += uri + "?";

	params.forEach(function(v,i){
		ajaxUrl += v[0] + "=" + v[1] + "&";
			
	});

	console.log("---------------------------------------_> : " + ajaxUrl);

	$.ajax({
                asynch: true,
                type: "GET",
                url: ajaxUrl,
                cache:"false",
		dataType: "json",
                success: function(msg){
                        console.log("  Data Saved: " + JSON.stringify(msg));
						console.log(msg[1]);
						localStorage.setItem("id", 1);
						localStorage.setItem("rand_date", msg[1]);
						document.location.replace("http://localhost/configur-cms/index.cgi?rand_date="+localStorage.getItem("rand_date"));
                                
                },
                error: function(error){
                        alert( 'msg ' + "error: " + error);
                }
        }); 


	console.log( "\n" + ajaxUrl );
	
}

$("#send").click(function(e){
	e.preventDefault;
	var user = document.getElementById("user").value;
	var pw = document.getElementById("pw").value;
	var id = localStorage.getItem("id");
	var rand_date = localStorage.getItem("rand_date");
	alert("click succesfull");
	//CALL CGI-LOGIN-SERVICE
	sendData( "#send", "http://localhost/configur-cms/login.cgi", [["user", user],["pw", pw]] );
	return false;
});

