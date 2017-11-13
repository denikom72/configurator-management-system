
print <<'HTML';

<!----------- RES-SET-TABLE --------------------->

<div>
<button class="mybttn" id="send_order">
SEND ORDER
</button>
<div id="spec_price" style="
    border: 1px solid;
    color: burlywood;
    padding: 5px;
    margin-left: 25px;
    border-radius: 9px 9px 0px 0px;
    width: 450px;
    margin-top: 20px;
    
    /* background: rgba(25, 233,222,0.5); */
">
</div>
</div> 
<!-- TODO: RESOLVE FILTER BUGS -->
<!--  input value="find " type="text" ng-model="filtStr" / --><br>



<span style="float:left; margin-left: 1%;">

<div ng-repeat="listOfDict in cont">
	<div ng-repeat="( key, val ) in listOfDict" style="display:inline-table;">
		<div>
                <button class="mybttn accordion" onclick="rollOutSibl(this)">{{ key }}</button>

                <div class="panel">
		<ul  class="sortable-list image-list1">
			<li ng-repeat="elem in val track by $index" ng-click="pushId($event)" id="{{ elem }}">{{ elem[0] }}_{{ elem[1] }}</li>
		</ul>
                </div>
                </div>
	</div>
</div>

</span>
    <ul id="image-list2" class="sortable-list">
    	<li ng-repeat="m in cont2 track by ( m.id + $index )" name="{{ m }}">
	{{ 
		$scope.dt = m.split(",");
		$scope.dt0 = $scope.dt[0].replace("[", "").replace('"',"").replace('"', "");
		$scope.dt1 = $scope.dt[1].replace("]", "").replace('"',"").replace('"', "").split(" ").join("").replace("EUR:", "");
		$scope.dt1 == 0 ? $scope.dt0 + '   &#160;&#160;  Menge: ' : $
print <<'HTML';

<!----------- RES-SET-TABLE --------------------->

<div>
<button class="mybttn" id="send_order">
SEND ORDER
</button>
<div id="spec_price" style="
    border: 1px solid;
    color: burlywood;
    padding: 5px;
    margin-left: 25px;
    border-radius: 9px 9px 0px 0px;
    width: 450px;
    margin-top: 20px;
    
    /* background: rgba(25, 233,222,0.5); */
">
</div>
</div> 
<!-- TODO: RESOLVE FILTER BUGS -->
<!--  input value="find " type="text" ng-model="filtStr" / --><br>



<span style="float:left; margin-left: 1%;">

<div ng-repeat="listOfDict in cont">
	<div ng-repeat="( key, val ) in listOfDict" style="display:inline-table;">
		<div>
                <button class="mybttn accordion" onclick="rollOutSibl(this)">{{ key }}</button>

                <div class="panel">
		<ul  class="sortable-list image-list1">
			<li ng-repeat="elem in val track by $index" ng-click="pushId($event)" id="{{ elem }}">{{ elem[0] }}_{{ elem[1] }}</li>
		</ul>
                </div>
                </div>
	</div>
</div>

</span>
    <ul id="image-list2" class="sortable-list">
    	<li ng-repeat="m in cont2 track by ( m.id + $index )" name="{{ m }}">
	{{ 
		$scope.dt = m.split(",");
		$scope.dt0 = $scope.dt[0].replace("[", "").replace('"',"").replace('"', "");
		$scope.dt1 = $scope.dt[1].replace("]", "").replace('"',"").replace('"', "").split(" ").join("").replace("EUR:", "");
		$scope.dt1 == 0 ? $scope.dt0 + '   &#160;&#160;  Menge: ' : $scope.dt0;
	}}
	
	<input  ng-if="$scope.dt1 == 0" type="text" size="3" id="cntProd" ></input>

	<b ng-click="delId($event)" name="{{ m }}" style="position:absolute;left: 60%; padding: 2px; border: solid 2px #74aac9; border-radius: 4px; border-top: 0; border-bottom:0;"> x </b></li>
    </ul>
<!--  TEST PART -->
<br><br>

<pre id="testpart">

</pre>

HTMLscope.dt0;
	}}
	
	<input  ng-if="$scope.dt1 == 0" type="text" size="3" id="cntProd" ></input>

	<b ng-click="delId($event)" name="{{ m }}" style="position:absolute;left: 60%; padding: 2px; border: solid 2px #74aac9; border-radius: 4px; border-top: 0; border-bottom:0;"> x </b></li>
    </ul>
<!--  TEST PART -->
<br><br>

<pre id="testpart">

</pre>

HTML
