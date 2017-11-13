print <<'HTML';

<!----------------- FOOTER-JS ---------------------------->


<script type="text/javascript">
//_______ANGULAR PART____________
var jsonSer;
//var cont = ["test1", "test2", "test3", "test4444"];


function rollOutSibl(thi){
	//alert(thi.classList);
	thi.classList.toggle("active");
	var panel = thi.nextElementSibling;
    if (panel.style.maxHeight){
		panel.style.maxHeight = null;
		//alert ( panel.scrollHeight );
	} else {
		panel.style.maxHeight = panel.scrollHeight + "px";
		//alert ( panel.scrollHeight );
	}
}



function mvByClick(el, target){
    $(el).click(function(i){
       alert ( "bar" ); 
        
    });
    
}

var listSize = 4;

//_________END_ANGUALR__________



//___________FORMULAR_DATA_SAVE_____

function cl(val){
	console.log(val);
}

$(document).ready(function(){

	function sendData( controller, ext, action ){
		var inputs = document.getElementsByTagName("input");
		var options = document.getElementsByTagName("option");

		var urlRequest = "";

		[].forEach.call(inputs, function(v,i){
			var attrId = v.getAttribute("id");
			//alert(attrId);
			var id = document.getElementById(attrId);
			var valOfId = id.value;
			// attrId is id of tag-node and should have the name of params which are used in the back end pm-modules	
			urlRequest = urlRequest + attrId + "=" + valOfId + "&";
		});

		[].forEach.call( options, function(v,i){ 
			if(v.selected){
				urlRequest = urlRequest + v.getAttribute("name") + "=" + v.value + "&"; 
			}
		});

		urlRequest = controller + "." + ext + "?" + "action=" + action + "&" + urlRequest;
		$.ajax({
			type: "GET",
			url: urlRequest,
			success: function(msg){
				alert( "Data Saved: " + msg );
				document.location.reload();
							
			},
				error: function(error){
				alert("error: " + error);
			}
		});
	}

	//sendData( "div" );

	
	function sendTrigger(clickNode, controler, extension){
		$(clickNode).click(function(e){
			e.preventDefault();
			var pmName = $(this).attr('id');
			
			//alert("click success " + pmName);
			sendData( controler , extension, pmName );

		});
	}
	
	sendTrigger(".mybttn", "http://localhost/configur-cms/controler", "cgi");
	//sendTrigger("#login", "http://localhost/configur-cms/index", "cgi");
	
	function sendOrder( id, dataId, service ){
		$("#" + id).click(function(e){
			var listFragm = document.getElementById(dataId).textContent.trim().split(" ").join("_").replace(/_x(_)?/g, "|");
			console.log(listFragm);
			alert( " Order sended: " + listFragm);	
			e.preventDefault();
			return false;
		});
	}
});

//___________END_FORMULAR___________



//_____START MY ACCORDEON________


var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].onclick = function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  }
}

//______END MY ACCORDEON__________

// CONFIG VALUES
var listSize = 4;

//functions
function srtbl_right( listClass, listId1, listId2, listSize, scope ){
	var dict = {};
	var cnt = 0;
	var outp;
	$(listClass).sortable({
		  connectWith: listClass,
		  update: function(event, ui) {
		    
			var changedList = this.id;
		    	var order = $(this).sortable('toArray');
			cnt++;
			

		  },

		 stop: function() {
		cnt = 0;
			  
	    	if ( $( listId2 + ' li').length > listSize ) {
		        //alert('max reached');
		        //$('p#notice').show().html( 'Max reached, drag right only');
		        //$('p.l').hide();
		        //$('#list2 li').addClass('dis');
		        $(listId1).sortable({
		            cancel: 'li'
	        	});   
	   		} else {
		        //$('p#notice').hide().html('');
		        /* $('p.l').show();
		        $('#list2 li').removeClass('dis'); */
				//cont.splice(cont.indexOf(this.id),1);
		        $(listId1).sortable({
		            cancel: ''
		        });   
	    	} 
		}
	});
}


//______MAIN___________

var app = angular.module('myApp', []);

app.controller('myCtrl', function($scope, $http){

	var contrUrl = "http://localhost/configur-cms/controler.cgi";
	    	
	$http({
        method : "GET",
        url : contrUrl + "?action=service&"
    	}).then(function mySuccess(response) {
	        $scope.cont = response.data;
		console.log(JSON.stringify(response.data));
		$scope.categs = [];
		for( i = 0; i < $scope.cont.length; i++ ){
			var strObj = JSON.stringify($scope.cont[i]);
			$scope.categs[i] = strObj.split(":")[0].replace("{","").replace("\"","").replace("\"", ""); 

		}
		//alert(JSON.stringify($scope.cont));	
    	}, function myError(response) {
        	$scope.cont = response.statusText;
		console.log(JSON.stringify(response.statusText));
    	});

	
	//_____CATEGS FOR SELECT-TAG___________

	
	$http({
        	method : "GET",
	        url : contrUrl + "?action=categs&"
    	}).then(function mySuccess(response) {
		$scope.selCategs = response.data;
                console.log(JSON.stringify(response.data));
	}, function myError(response) {
        	$scope.cont = response.statusText;
                console.log(JSON.stringify(response.statusText));
	});


	$http({
        	method : "GET",
	        url : contrUrl + "?action=read_numb&"
    	}).then(function mySuccess(response) {
        	//$scope.selCategs = [];
		var conflimit = response.data;
		var conflimit0 = " ? ";
		
		if( conflimit[0] != undefined ){
			var conflimit0 = conflimit[0];		
		}
 
		$scope.limit = conflimit[0];

		//alert(conflimit[0]); 
		
		$("#spec_price").text(" YOU CAN COMBINE " + conflimit0 + " PRODUCTS FOR JUST "); 
	}, function myError(response) {
        	$scope.cont = response.statusText;
                console.log(JSON.stringify(response.statusText));
	});


	$http({
        	method : "GET",
	        url : contrUrl + "?action=price&"
    	}).then(function mySuccess(response) {
        	//$scope.selCategs = [];
		var conflimit = response.data;
		
		var conflimit00 = " ? "

		if( conflimit[0][0] != undefined ){
			conflimit00 = conflimit[0][0];
		}
 
		var txt = $("#spec_price").text();
		$("#spec_price").text( txt + " " + conflimit00 + " EURO");
	}, function myError(response) {
        	$scope.cont = response.statusText;
                console.log(JSON.stringify(response.statusText));
	});
	


	var limit = 4;

	$scope.cont2 = [];
	$scope.pushId = function(object){
		if( $scope.cont2.length < $scope.limit ){
			$scope.cont2.push(object.target.getAttribute("id"));
		}
	};
      
	$scope.delId = function(object){
            $scope.cont2.splice($scope.cont2.indexOf(object.target.getAttribute("name")),1);
	};
  
	$scope.rollOut = function(obj)
	{
		var clss = obj.target;
	};
	 srtbl_right(".sortable-list", ".image-list1", "#image-list2", 2, $scope);
});

</script>
HTML
