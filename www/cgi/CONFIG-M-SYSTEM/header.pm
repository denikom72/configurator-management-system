print "Content-type: text/html\n\n";


#start heredoc

print <<'HTML';

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="http://localhost/CONFIGURATORCMS/" target="_blank">
 
<script type="text/javascript" src="angular.min.js"></script>
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="jquery-ui.min.js"></script>
<script type="text/javascript" src="jquery.cookie.min.js"></script>


<link rel="stylesheet" href="../simple-login-form/reset.min.css">
<link rel="stylesheet" href="../simple-login-form/css/style.css">

<!-- -------------- MY ACCORDEON PART START ------------------------ -->

<!-- MY ACCORDEON PART START _______________ -->
<style type="text/css">
html {
	background-color: #000;
}

button.accordion {
    background-color: transparent;
    color: #74aac9;
    cursor: pointer;
    padding: 18px;
    width: 200px;
    border: none;
    text-align: left;
    outline: none;
    font-size: 25px;
    transition: 0.4s;
}

button.accordion.active, button.accordion:hover {
    background-color: #74aac9;
}

button.accordion:after {
    content: '\002B';
    color: #74aac9;
    font-weight: bold;
    float: right;
    margin-left: 5px;
}

button.accordion.active:after {
	content: '\2212';
	//position: absolute;
	//left: 200px;
}

div.panel {
    padding: 0 18px;
    background-color: transparent;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.2s ease-out;
}
</style>

<!-- link href="jquery-ui.css" rel="stylesheet" -->
<link rel="stylesheet" type="text/css" href="style.css">

</head>


<body>

HTML
