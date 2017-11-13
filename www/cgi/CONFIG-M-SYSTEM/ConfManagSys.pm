print <<'HTML';

<!----------  CONF-MANAG-SYS  ------------------>

<form id="form">
            <table>
            <tr><td>
                    <label> Categorie: </label></td><td><input type="text" name="user" id="newcat" placeholder="Categorie" required="required" class="input-txt"></td>
                    
            </tr>
            <tr><td>
                    <label> Element: </label></td><td><input type="text" name="user" id="elem" placeholder="Product" required="required" class="input-txt"></td>
            </tr>
            <tr><td>
                    <label> Price: </label></td><td><input type="text" name="user" id="singleproductPrice" placeholder="Product-Price" required="required" class="input-txt"></td>
            </tr>
            <tr><td>
                    <label> Add to categorie: </label></td><td> 
						
						<select class="btn" style="margin: 30px 0;">
						
							<option name="tocateg" ng-repeat="v in selCategs">{{v[0]}}</option>
						
						
						</select>

                </td>
            </tr>
		<tr><td>
		<label>	Product-number-limit: </label></td><td><input type="text" id="numOrPrice" placeholder="Limit or price" required="required" class="input-txt">

<button class="mybttn" class="btn" id="productlimit2" value="prodnumber">Set product number</button>
<button class="mybttn" class="btn" id="newprice" value="price">Set special price</button>
</td></tr>
		<tr><td>
		    <br>	
                    <button class="mybttn" id="mytruncate"  style="position:relative;right:0px; margin-left: 20px;" value="truncate">truncate</button>
		</td><td><br>
                    <button class="mybttn" style="position:relative;right:0px;"  id="mysave" value="mysave">save</button>
                    <button class="mybttn" style="position:relative;right:0px;"  id="myupdate" value="myupdate">update</button>
                    <button class="mybttn" style="position:relative;right:0px;"  id="mydelete" value="mydelete">delete</button>
                    <button class="mybttn" style="position:relative;right:0px;"  id="logout" value="logout">logout</button>
		</td>
</tr>
<tr>

		<td>&#160;</td>
		<td>&#160;</td>
</tr>

            </table>
        </form><br><br>


<u>
HTML



