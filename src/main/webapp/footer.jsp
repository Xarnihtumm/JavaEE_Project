<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Design by foolishdeveloper.com -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>footer Design with html css</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style media="screen">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background: #fcfcfc;
	font-family: sans-serif;
}

footer {
	position: bottom;
	bottom: 0;
	left: 0;
	right: 0;
	background: #111;
	height: auto;
	width: auto;
	scroll-behavior: auto;
	padding-top: 40px;
	color: #fff;
}

.footer-map {
	float: right;
	padding-right: 100px;
	height: 200px;
	width: auto;
}

h3 {
 margin-left:60px;
	
}

.mapouter {
	text-align: right;
	height: 200px;
	width: 200px;
}

.gmap_canvas {
	background: none !important;
	height: 200px;
	width: 300px;
}

.footer-content {
	display: flex;
	align-items: left;
	justify-content: left;
	flex-direction: column;
	text-align: left;
}

.footer-content h3 {
	font-size: 2.1rem;
	padding-left: 20px;
	font-weight: 500;
	text-transform: capitalize;
	line-height: 3rem;
}

.footer-content p {
	max-width: 500px;
	padding-left: 20px;
	margin: 10px left;
	line-height: 28px;
	font-size: 14px;
	color: #cacdd2;
}

.contact {
	padding-left: 100px;
	margin: 20px;
}

.socials {
	list-style: none;
	display: flex;
	align-items: left;
	justify-content: left;
	margin: 1rem 0 3rem 0;
}

.socials li {
	margin: 0 20px;
}

.socials a {
	text-decoration: none;
	color: #fff;
	border: 1.1px solid white;
	padding: 5px;
	border-radius: 50%;
}

.socials a i {
	font-size: 1.1rem;
	width: 20px;
	transition: color .4s ease;
}

.socials a:hover i {
	color: aqua;
}

.footer-bottom {
	background: green;
	width: 100vw;
	padding: 20px;
	padding-bottom: 40px;
	text-align: center;
}

.footer-bottom p {
	float: center;
	justify-content: center;
	font-size: 14px;
	word-spacing: 2px;
	text-transform: capitalize;
}

.footer-bottom p a {
	color: #44bae8;
	font-size: 16px;
	text-decoration: none;
}

.footer-bottom span {
	text-transform: uppercase;
	opacity: .4;
	font-weight: 200;
}

.footer-menu {
	float: right;
}

.footer-menu ul {
	display: flex;
}

.footer-menu ul li {
	padding-right: 10px;
	display: block;
}

.footer-menu ul li a {
	color: #cfd2d6;
	text-decoration: none;
}

.footer-menu ul li a:hover {
	color: #27bcda;
}

@media ( max-width :500px) {
	.footer-menu ul {
		display: flex;
		margin-top: 10px;
		margin-bottom: 20px;
	}
}
</style>

<footer>
	<div class="footer-map">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d7403.411339641298!2d96.135803!3d21.907407!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x1e674c8522c93cc!2sHost%20Myanmar%20(Mandalay)!5e0!3m2!1sen!2smm!4v1668965792853!5m2!1sen!2smm"
			width="300" height="200" style="border: 0;" allowfullscreen=""
			loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		<a href="https://www.whatismyip-address.com/divi-discount/"></a><br>
		<style>
.mapouter {
	position: relative;
	text-align: right;
	height: 200px;
	width: 200px;
}
</style>
		<style>
.gmap_canvas {
	overflow: hidden;
	background: none !important;
	height: 200px;
	width: 300px;
}
</style>
	</div>



	<div class="footer-content">

		<h3>CONTACT</h3>
		<ul class="contact">
			<li><i class="fa fa-phone-square"
				style="font-size: 24px; color: red"></i> &nbsp; +959 740873274</li>
			</br>
			<li><i class="fa fa-address-card"
				style="font-size: 24px; color: red"></i> &nbsp; A 20/73, 73 A Street, 119th and 120 th, Pyigitagon, Mandalay</li>
			</br>
			<li><i class="fa fa-envelope"
				style="font-size: 24px; color: red"></i> &nbsp; xarnitechx@gmail.com</li>
			</br>
		</ul>
		<ul class="socials">
			<li><a href="#"><i class="fa fa-facebook" style="color:blue"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"  style="color:blue"></i></a></li>
			<li><a href="#"><i class="fa fa-google-plus"  style="color:blue"></i></a></li>
			<li><a href="#"><i class="fa fa-youtube"  style="color:blue"></i></a></li>
			<li><a href="#"><i class="fa fa-linkedin-square"  style="color:blue"></i></a></li>
		</ul>

	</div>

	<div class="footer-bottom" class="d-flex justify-content-between">
		<p>
			copyright &copy;2022 <a href="#">All right reserved by IT Mall.
				Developed by:Xar Ni Htumm</a>
		</p>

	</div>

</footer>