<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IT Mall Sale and Service</title>
<meta name="description" content="Clean Blog Template is provided by templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

<link href="s3slider.css" rel="stylesheet" type="text/css" />
<!-- JavaScripts-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/s3Slider.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#slider').s3Slider({
            timeOut: 1600
        });
    });
</script>

</head>
<body>

<div id="templatemo_wrapper">

	<div id="templatemo_menu">
                
        <ul>
            <li><a href="home.jsp" class="current">Home</a></li>
            
            <c:choose>
         
         <c:when test = "${fn:contains(user.role,'admin') }">
          <li><a href="customer">Service</a></li>
            
         </c:when>
        
         
         <c:otherwise>
           <li><a href="userinfo.jsp">Service</a></li>
         </c:otherwise>
      </c:choose>
            <li><a href="product">ShowRoom</a></li>
            
        </ul>	
    
    </div> <!-- end of templatemo_menu -->

    <div id="templatemo_left_column">
    
        <div id="templatemo_header">
        
            <div id="site_title">
                <h1><a href="http://www.templatemo.com" target="_parent">IT  <strong>Mall</strong><span>Sale and Service</span></a></h1>
            </div><!-- end of site_title -->
            
        </div> <!-- end of header -->  
        
        <div id="templatemo_sidebar">
    	
            <div id="templatemo_rss">
            
                <a href="login">JOIN NOW <br /><span>to Our Company</span></a>
                
            </div>
            
            <h4>Available Product</h4>
            <ul class="templatemo_list">
                <li><a href="#" target="_parent">Laptop</a></li>
                <li><a href="#" target="_parent">System PC</a></li>
                <li><a href="#" target="_parent">IT Gadget & Accessoy</a></li>
                <li><a href="#" target="_parent">Apple Products</a></li>
                <li><a href="#">Printer</a></li>
                <li><a href="#">CCTV</a></li>
            </ul>
            
            <div class="cleaner_h40"></div>
            
            <h4>Prataner Brands</h4>
            <ul class="templatemo_list">
                <li><a href="http://www.templatemo.com" target="_parent">Apple</a></li>
                <li><a href="http://www.flashmo.com" target="_parent">Dell</a></li>
                <li><a href="http://www.flashmo.com/store" target="_parent">ViewSonic</a></li>
                <li><a href="http://www.webdesignmo.com/blog" target="_parent">Golden Power</a></li>
                <li><a href="http://www.koflash.com" target="_parent">Royal Smart</a></li>
                <li><a href="#">Shinn Ye</a></li>
                <li><a href="#">Shwe La Min Nga Gar</a></li>
            </ul>
            
        </div> <!-- end of templatemo_sidebar --> 
    
    </div> <!-- end of templatemo_left_column -->
    
    <div id="templatemo_right_column">
    
    	<div id="featured_project">
            <div id="slider">
                <ul id="sliderContent">
                    <li class="sliderImage">
                        <a href=""><img src="images/slider/1a.jpg" alt="1" /></a>
                        <span class="top"><strong>Welcome To My Service Department</strong><br /></span>
                    </li>
                    <li class="sliderImage">
                        <a href=""><img src="images/slider/2a.jpg" alt="2" /></a>
                        <span class="bottom"><strong>Welcome To My Showroom</strong><br /></span>
                    </li>
                    <li class="sliderImage">
                        <img src="images/slider/3a.jpg" alt="3" />
                        <span class="left"><strong>Available New Update Products</strong><br/></span>
                    </li>
                    <li class="sliderImage">
                        <img src="images/slider/4a.jpg" alt="4" />
                        <span class="right"><strong>Welcome To My Online ShowRoom</strong><br /></span>
                    </li>
                    <li class="clear sliderImage"></li>
                </ul>
            </div>
        </div>
        
        <div id="templatemo_main">
        
            <div class="post_section">
            
                <span class="comment"><a href="#">128</a></span>
            
               <c:choose>
         
         <c:when test = "${fn:contains(user.role,'admin') }">
          <li><a href="customer"><h2> Our Service </h2></a></li>
            
         </c:when>
        
         
         <c:otherwise>
           <li><a href="userinfo.jsp"><h2> Our Service </h2></a></li>
         </c:otherwise>
      </c:choose>
                
    
            	October 28, 2048 | <strong>CEO:</strong> Xar Ni Htumm| <strong>:</strong> <a href="#">Freebies</a>
                
                <img src="images/templatemo_image_01.jpg" alt="image 1" />
                
                <p>IT Mall Sale and Service Trading Co.,Ltd. actually takes pride of maintaining a personalized sales and technical services. The company is very committed to a very high level of customer satisfaction and services, even through after sales.

                    To cater steadfast and consistent support of services, the company has maintained teams of skilled-trained technicians and expert engineers in order to have unwavering, prompt and timely technical support even through after sales. Our fleet of delivery vehicles also renders a key factor.
                    
                    Our services are as follow.</p>
              
                
            </div>
                
            <div class="post_section">
                    
                <span class="comment"><a href="#">256</a></span>
            
                <h2><a href="product">Our ShowRoom</a></h2>
                
                December 24, 2048 | <strong>Author:</strong> Steve | <strong>Category:</strong> <a href="#">Web Design</a>
                
                <img src="images/templatemo_image_02.jpg" alt="image 2" />
                
                <p>Since 1825, when the first department store opened in the U.S., thousands of other retailers have latched on to the idea that an all-under-one-roof shopping experience was the pinnacle of retail success. Having said that, even modern warehouse and department stores-the Wal-Marts, Targets and Costcos of the world-sometimes offer more than their customers are looking for. Sure, they might be convenient when you're picking up tonight's dinner, gym shoes and a Sabrina, the Teenage Witch box set in a single shopping trip. But if you're there to purchase just enough ramen noodles to get you through the week, it can be a fairly daunting experience.</p>
              
            
            </div>
		</div>
    
  <div class="cleaner"></div>
  </div> 
    <!-- end of templatemo_main -->
  <div class="cleaner_h20"></div>
  
  	
  
    <div class="cleaner"></div>
</div> <!-- end of warpper -->
<c:import url="footer.jsp"></c:import>
</body>
</html>
