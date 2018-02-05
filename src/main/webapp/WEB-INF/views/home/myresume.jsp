<%-- 
    Document   : myresume
    Created on : Jan 14, 2017, 11:53:02 PM
    Author     : Asu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    <html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>My Resume</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="shortcut icon" type="image/ico" href="/images/favicon.ico"/>
    <link rel="stylesheet" media="screen" type="text/css" href="/css/bootstrap/font-awesome/css/font-awesome.css"/>
    <link rel="stylesheet" media="screen" type="text/css" href="/css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" media="screen" href="/css/layout/layout.css" type="text/css" />
    <link rel="stylesheet" media="screen" href="/css/layout/styles-6.css"/>
</head>
<body id="top">
    <div>
        <div id="intro">
            <div class="fl_right">
                <div class="wrapper">
                    <div class="sidebar-wrapper">
                        <div class="profile-container">
                            <img class="profile" src="/images/asu.png" alt="" />
                            <h1 class="name">Asu</h1>
                            <h3 class="tagline">Software Developer</h3>
                        </div>
                        <!--profile-container-->
                        <div class="contact-container container-block">
                            <ul class="list-unstyled contact-list">
                                <li class="email"><i class="fa fa-envelope"></i><a href="mailto: iamasu@live.com">iamasu@live.com</a></li>
                                <li class="phone"><i class="fa fa-mobile-phone"></i><a href="tel:+918870976332">+918870976332</a></li>
                            </ul>
                        </div>
                        <!--contact-container-->
                        <div class="education-container container-block">
                            <h2 class="container-block-title">Education</h2>
                            <div class="item">
                                <h4 class="degree">B.Tech in Information Technology</h4>
                                <h5 class="meta">WBUT</h5>
                                <div class="time">2008 - 2012</div>
                            </div>
                        </div>
                        <!--education-container-->
                        <div class="languages-container container-block">
                            <h2 class="container-block-title">Languages</h2>
                            <ul class="list-unstyled interests-list">
                                <li>English <span class="lang-desc">(Professional)</span></li>
                                <li>Hindi <span class="lang-desc">(Professional)</span></li>
                                <li>Bengali <span class="lang-desc">(Native)</span></li>
                            </ul>
                        </div>
                        <!--interests-->
                        <div class="interests-container container-block">
                            <h2 class="container-block-title">Interests</h2>
                            <ul class="list-unstyled interests-list">
                                <li>Net surfing</li>
                                <li>Playing Football and Cricket</li>
                                <li>Cooking</li>
                            </ul>
                        </div>
                        <!--interests-->
                    </div>
                    <!--sidebar-wrapper-->
                    <div class="main-wrapper">
                        <section class="section summary-section">
                            <h2 class="section-title"><i class="fa fa-user"></i>Career Profile</h2>
                            <div class="summary">
                                <p>Seeking a position to utilize my skills and abilities in the IT Industry that offers Professional, growth while being resourceful, Innovative and flexible.</p>
                            </div>
                            <!--summary-->
                        </section>
                        <!--section-->
                        <section class="section experiences-section">
                            <h2 class="section-title"><i class="fa fa-briefcase"></i>Experiences</h2>

                            <div class="item">
                                <div class="meta">
                                    <div class="upper-row">
                                        <h3 class="job-title">Java Software Developer</h3>
                                        <div class="time">2013 - Present</div>
                                    </div>
                                    <div class="company">Sitec Solutions</div>
                                </div>
                                <div class="details">
                                    <p>...</p>  
                                </div><!--//details-->
                            </div><!--//item-->
                        </section><!--//section-->
                        <section class="section projects-section">
                            <h2 class="section-title"><i class="fa fa-archive"></i>Projects</h2>
                            <div class="intro">
                                <p>...</p>
                            </div>
                            <!--intro-->
                            <div class="item">
                                <span class="project-title"><a href="#hook">HBS</a></span> - <span class="project-tagline">Hospital Billing System</span>
                            </div>
                            <div class="item">
                                <span class="project-title"><a href="#hook">CCMS</a></span> - <span class="project-tagline">Computerized Contract Management System</span>
                            </div>
                            <!--item-->
                        </section>
                        <!--section-->
                        <section class="skills-section section">
                            <h2 class="section-title"><i class="fa fa-rocket"></i>Skills</h2>
                            <div class="skillset">
                                <div class="item">
                                    <h3 class="level-title">Programming Languages</h3>
                                    <div class="level-bar">
                                        Core Java
                                        <div class="level-bar-inner" data-level="60%"></div>                                      
                                    </div>
                                </div>
                                <div class="item">
                                    <h3 class="level-title">Technology</h3>
                                    <div class="level-bar">
                                        HTML,JavaScript,Ajax,Jquery,JSP,Servlet,J2EE,Java Swing
                                        <div class="level-bar-inner" data-level="50%"></div>                                      
                                    </div>
                                </div>
                                <div class="item">
                                    <h3 class="level-title">Framework</h3>
                                    <div class="level-bar">
                                        Spring 3.x & Hibernate 4.x
                                        <div class="level-bar-inner" data-level="50%"></div>                                      
                                    </div>
                                </div>
                            </div>  
                        </section>
                        <!--skills-section-->
                    </div>
                    <!--main-body-->
                </div>
            </div>
        </div>
    </div>
    <div class="wrapper col4">
        <div id="services">
        </div>
    </div>
</body>
</html>