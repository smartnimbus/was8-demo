<html>
<head>
<title>Hello World!</title>
</head>
<body>
	<h1>Hello World! WAS Demo Docker </h1>
	<p>
		It is now
		<%= new java.util.Date() %></p>
	<p>
		Server IP
		<%= request.getLocalAddr() %></p>
	<p>
		You are coming from 
		<%= request.getRemoteAddr()  %></p>
</body>