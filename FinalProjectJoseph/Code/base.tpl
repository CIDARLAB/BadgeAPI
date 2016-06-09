<!doctype HTML>
<head>
<title>{{title}}</title>
<link type="text/css" href="/static/main.css" rel="stylesheet">
</head>
<body>
<header>
<div id = "maintext">PCR Hero</div>
<div id = "userinfo">user: {{email}}</div>
<nav>
<ul>
<a href="/"><li>Home</li></a>
% if(email == None):
	<a href="/login"><li>Login</li></a>
% else:
	<a href="/logout"><li>Logout</li></a>
% end
<a href="/myprofile"><li>My Profile</li></a>
<a href="/register"><li>Register</li></a>
<a href="http://cidarlab.org/"><li>About CIDAR</li></a>
% if(email == 'beepboop@gmail.com'):
	<a href="/admin-badge"><li>Admin-Badges</li></a>
	<a href="/admin-issuer"><li>Admin-Issuers</li></a>
	<a href="/admin-awards"><li>Admin-Awards</li></a>
	<a href="/admin-images"><li>Admin-Images</li></a>
	<a href="/admin-tasks"><li>Admin-Tasks</li></a>
% end
% if(email == 'alex@hoopla.com'):
<a href="/admin-badge"><li>Admin-Badges</li></a>
	<a href="/admin-issuer"><li>Admin-Issuers</li></a>
	<a href="/admin-awards"><li>Admin-Awards</li></a>
	<a href="/admin-images"><li>Admin-Images</li></a>
	<a href="/admin-tasks"><li>Admin-Tasks</li></a>
% end
</ul>
</nav>
</header>
<div id = "spacer"></div>
