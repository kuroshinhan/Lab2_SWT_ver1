<%-- 
    Document   : ExamScheduleRegister
    Created on : Nov 2, 2023, 9:59:30 AM
    Author     : 84354
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Registration"  %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registed Exam</title>
        <link rel="stylesheet" href="./style_1.css">
    </head>
    <body>
        <!-- partial:index.partial.html -->
        <svg style="display:none;">
    <symbol id="logo" viewBox="0 0 140 59">
        <g>
        <path d="M6.8 57c0 .4-.1.7-.2.9-.1.2-.3.4-.4.5-.1.1-.4.199-.5.3-.2 0-.3.1-.5.1-.1 0-.3 0-.5-.1-.2 0-.4-.101-.5-.3-.2 0-.4-.2-.5-.4-.1-.2-.2-.5-.2-.9V44.7h-2c-.3 0-.6-.101-.8-.2-.2-.1-.3-.2-.5-.4s-.2-.3-.2-.4v-.4c0-.1 0-.2.1-.399 0-.2.1-.301.2-.4.1-.1.3-.3.5-.4.1 0 .4-.1.7-.1h2.1v-3.5c0-1 .1-1.9.3-2.7C4.1 35 4.5 34.3 5 33.7c.5-.6 1.1-1.1 1.9-1.4.8-.3 1.7-.5 2.7-.5.9 0 1.5.101 1.8.4.3.3.5.6.5 1.1 0 .3-.1.601-.3.9-.2.3-.6.4-1.2.4h-.6c-.6 0-1.1.101-1.5.301-.4.199-.7.5-.9.8C7.2 36 7 36.5 7 37c-.1.5-.1 1-.1 1.6V42h2.7c.3 0 .6.1.8.2.2.1.3.2.5.399.1.101.2.301.2.401 0 .2.1.3.1.4 0 .1 0 .3-.1.399 0 .2-.1.3-.2.4-.1.1-.3.3-.5.399-.2.101-.5.2-.8.2H6.8V57z" />
        <path d="M30.4 50.2c0 1.3-.2 2.5-.7 3.5-.5 1.1-1.1 2-1.9 2.8-.8.8-1.8 1.4-2.8 1.8-1.1.4-2.3.601-3.5.601-1.3 0-2.4-.2-3.5-.601-1.1-.399-2-1-2.8-1.8-.8-.8-1.4-1.7-1.9-2.8-.5-1.101-.7-2.2-.7-3.5s.2-2.4.7-3.5c.5-1.101 1.1-2 1.9-2.7.8-.8 1.7-1.4 2.8-1.8 1.1-.4 2.3-.601 3.5-.601 1.3 0 2.4.2 3.5.601 1.1.399 2 1 2.8 1.8.8.8 1.4 1.7 1.9 2.7.5 1.1.7 2.3.7 3.5zm-3.4 0c0-.8-.1-1.5-.4-2.3-.2-.7-.6-1.4-1.1-1.9s-1-1-1.7-1.3c-.7-.3-1.5-.5-2.4-.5s-1.7.2-2.4.5-1.3.8-1.7 1.3c-.5.5-.8 1.2-1.1 1.9-.2.699-.4 1.5-.4 2.3s.1 1.5.4 2.3c.2.7.6 1.4 1.1 1.9.5.6 1 1 1.7 1.3s1.5.5 2.4.5 1.7-.2 2.4-.5 1.3-.8 1.7-1.3c.5-.601.8-1.2 1.1-1.9.3-.7.4-1.5.4-2.3z" />
        <path d="M38.1 44.8h.1c.4-.899 1-1.7 1.9-2.3s1.8-.9 2.9-.9c.5 0 1 .101 1.3.301.4.199.6.6.6 1.1 0 .6-.2 1-.6 1.2-.4.2-.8.3-1.4.3h-.2c-1.3 0-2.4.5-3.2 1.4-.8.899-1.3 2.3-1.3 4.1v7c0 .4-.1.7-.2.9-.1.199-.3.399-.4.5-.2.1-.4.199-.5.3-.2 0-.3.1-.5.1-.1 0-.3 0-.5-.1-.2 0-.4-.101-.5-.3-.1-.2-.3-.301-.4-.5C35 57.7 35 57.4 35 57V43.5c0-.4.1-.7.2-.9.1-.199.3-.399.4-.5.2-.1.3-.199.5-.199s.3-.101.5-.101c.1 0 .3 0 .4.101.2 0 .3.1.5.199.2.101.3.301.4.5.1.2.2.5.2.9v1.3z" />
        <path d="M49.2 51.3c0 .7.2 1.4.5 2 .3.601.7 1.2 1.2 1.601.5.5 1.1.8 1.7 1.1s1.3.4 2 .4c1 0 1.8-.2 2.5-.5.7-.4 1.2-.801 1.8-1.2.2-.2.4-.3.6-.4.2-.301.3-.301.5-.301.4 0 .7.1 1 .4.3.199.4.6.4 1 0 .1 0 .3-.1.5s-.2.4-.4.7c-1.6 1.7-3.7 2.5-6.3 2.5-1.3 0-2.4-.199-3.5-.6s-2-1-2.8-1.8c-.8-.8-1.4-1.7-1.8-2.7-.4-1.1-.7-2.3-.7-3.6 0-1.301.2-2.5.6-3.5.4-1.101 1-2 1.8-2.801.8-.8 1.7-1.399 2.7-1.8 1-.399 2.2-.6 3.4-.6 2.1 0 3.8.6 5.2 1.8s2.3 2.9 2.6 5.2c0 .3.1.5.1.6v.5c0 1.101-.6 1.7-1.7 1.7H49.2V51.3zm9.9-2.5c0-.7-.1-1.3-.3-1.8-.2-.6-.5-1.1-.9-1.5s-.9-.7-1.4-1c-.6-.2-1.2-.4-2-.4-.7 0-1.4.101-2 .4-.6.2-1.2.6-1.6 1-.5.4-.8.9-1.1 1.5-.3.6-.5 1.2-.5 1.8h9.8z" />
        <path d="M77.9 55.1c.399-.3.8-.5 1.199-.5.4 0 .7.101 1 .4.2.3.4.6.4.9 0 .199 0 .5-.1.699a1.856 1.856 0 01-.599.701c-.7.5-1.399.9-2.3 1.2s-1.8.4-2.7.4c-1.3 0-2.5-.2-3.5-.601-1.1-.399-2-1-2.8-1.8s-1.4-1.7-1.8-2.7c-.4-1.1-.7-2.3-.7-3.6s.2-2.5.7-3.601c.4-1.1 1.1-2 1.8-2.8.8-.8 1.7-1.399 2.8-1.8 1.101-.4 2.2-.6 3.5-.6.9 0 1.7.1 2.601.399C78.2 42 79 42.4 79.6 43l.7.7c.101.2.2.5.2.7 0 .399-.1.8-.4 1-.3.3-.6.399-1 .399-.199 0-.399 0-.5-.1-.2-.099-.4-.199-.7-.499-.301-.3-.7-.5-1.2-.7s-1-.3-1.7-.3c-.9 0-1.6.2-2.3.5s-1.2.8-1.7 1.3-.8 1.2-1.1 1.9c-.2.699-.4 1.5-.4 2.3s.1 1.5.3 2.2c.2.699.6 1.3 1 1.899.5.5 1 1 1.7 1.3.7.301 1.4.5 2.3.5.7 0 1.3-.1 1.8-.3.4-.099.9-.299 1.3-.699z" />
        <path d="M94.6 56.2h-.1c-.6.899-1.4 1.6-2.3 2.1-.9.5-2 .7-3.3.7-.7 0-1.301-.1-2-.3-.7-.2-1.4-.5-1.9-.9-.6-.399-1.1-.899-1.4-1.6-.4-.7-.6-1.5-.6-2.4 0-1.3.3-2.2 1-3 .7-.7 1.6-1.3 2.7-1.7 1.1-.399 2.3-.6 3.7-.699 1.399-.101 2.8-.2 4.199-.2v-.5c0-1.2-.399-2.101-1.1-2.7s-1.7-.9-3-.9c-.7 0-1.4.101-2 .301-.6.199-1.3.5-1.9 1-.3.199-.699.3-1 .3-.3 0-.6-.101-.899-.4-.2-.2-.4-.6-.4-.899 0-.2.101-.5.2-.7s.3-.4.6-.601c.7-.5 1.601-1 2.5-1.3 1-.3 2-.5 3.2-.5s2.2.2 3.101.5c.899.3 1.6.8 2.199 1.4.601.6 1 1.3 1.301 2.1.3.8.399 1.601.399 2.5V56.9c0 .3-.1.6-.2.899-.1.201-.2.401-.4.501-.2.101-.3.2-.5.2s-.3.1-.4.1c-.1 0-.3 0-.399-.1-.2 0-.301-.1-.5-.2-.201-.1-.301-.3-.401-.5s-.2-.5-.2-.899v-.7h-.2zm-.9-5.5c-.8 0-1.7 0-2.5.1-.9.101-1.7.2-2.4.4s-1.3.5-1.8.9-.7 1-.7 1.7c0 .5.101.9.3 1.2.2.3.5.6.801.8.3.2.699.4 1.1.4.4.1.8.1 1.2.1 1.5 0 2.7-.5 3.5-1.399.8-.9 1.2-2.101 1.2-3.5v-.9h-.7v.199z" />
        <path d="M111.4 45.4c-.5-.5-1-.801-1.5-1-.5-.2-1.101-.301-1.601-.301-.399 0-.7 0-1.1.101-.4.1-.7.2-1 .399-.3.2-.5.4-.7.7s-.3.601-.3 1c0 .7.3 1.2.899 1.601.601.3 1.601.6 2.801.899.8.2 1.5.4 2.199.7.7.3 1.301.6 1.801 1s.899.8 1.199 1.4c.301.5.4 1.199.4 1.899 0 1-.2 1.8-.6 2.5-.4.7-.9 1.2-1.5 1.7-.601.4-1.301.7-2.101.9-.8.199-1.6.3-2.399.3-1 0-2-.2-2.9-.5-1-.3-1.8-.8-2.5-1.4-.3-.3-.5-.5-.6-.7-.098-.198-.098-.398-.098-.598 0-.4.101-.8.4-1 .3-.3.6-.4 1-.4.399 0 .8.2 1.2.5.5.5 1.1.801 1.699 1.101.601.3 1.2.399 1.9.399.4 0 .8 0 1.2-.1.399-.1.7-.2 1-.4.3-.199.6-.399.8-.699.2-.301.3-.7.3-1.2 0-.8-.399-1.3-1.1-1.7s-1.8-.7-3.2-1c-.6-.1-1.1-.3-1.7-.5-.6-.2-1.1-.5-1.6-.8s-.8-.8-1.101-1.3c-.3-.5-.399-1.2-.399-2 0-.9.2-1.601.5-2.301.401-.6.801-1.2 1.401-1.6.601-.4 1.2-.7 2-.9.7-.199 1.5-.3 2.301-.3.899 0 1.699.101 2.6.4.8.3 1.6.7 2.2 1.2.3.3.5.5.6.699.101.2.101.4.101.601 0 .399-.101.7-.4 1s-.6.399-1 .399c-.402-.199-.802-.399-1.102-.699z" />
        <path d="M126 58.4c-.6.3-1.3.399-2.1.399-1.601 0-2.801-.399-3.601-1.3s-1.2-2.2-1.2-3.9v-9H117.2c-.3 0-.601 0-.8-.1-.2-.1-.4-.2-.5-.3-.101-.101-.2-.3-.2-.4 0-.2-.101-.3-.101-.399 0-.101 0-.2.101-.4 0-.2.1-.3.2-.4.1-.1.3-.3.5-.399.199-.101.5-.2.8-.2h1.899v-3.2c0-.399.101-.7.2-.899.101-.2.3-.4.4-.601.2-.1.399-.2.5-.3.2 0 .3-.1.5-.1.1 0 .3 0 .5.1.2 0 .3.1.5.3.2.101.3.3.399.601.101.199.2.6.2.899V42h3.2c.3 0 .6.1.8.2.2.1.3.2.5.399.102.101.202.301.202.401 0 .2.1.3.1.4 0 .1 0 .3-.1.399 0 .2-.1.3-.2.4-.1.1-.3.3-.5.3-.2.1-.5.1-.8.1h-3.2V53.2c0 1 .2 1.7.5 2.1.4.4.8.601 1.4.601.2 0 .5 0 .7-.101.199-.1.399-.1.6-.1.4 0 .7.1.9.399.199.301.3.601.3.9s-.101.5-.2.7c0 .401-.2.601-.5.701z" />
        <path d="M133.2 44.8h.1c.4-.899 1-1.7 1.9-2.3.899-.6 1.8-.9 2.899-.9.5 0 1 .101 1.301.301.4.199.6.599.6 1.099 0 .6-.2 1-.6 1.2-.4.2-.801.3-1.4.3h-.2c-1.3 0-2.399.5-3.2 1.4-.8.899-1.3 2.3-1.3 4.1v7c0 .4-.1.7-.2.9-.1.199-.3.399-.399.5-.101.1-.4.199-.5.3-.2 0-.3.1-.5.1-.101 0-.3 0-.5-.1-.2 0-.4-.101-.5-.3-.2-.101-.3-.301-.4-.5-.1-.2-.2-.5-.2-.9V43.5c0-.4.101-.7.2-.9.101-.199.3-.399.4-.5.2-.1.3-.199.5-.199s.3-.101.5-.101c.1 0 .3 0 .399.101.2 0 .301.1.5.199.2.101.301.301.4.5.1.2.2.5.2.9v1.3z" />
        </g>
        <g>
        <g>
        <path fill="#08A6DF" d="M70 32.9c-9.1 0-16.5-7.4-16.5-16.5 0-4.8 2.1-9.3 5.7-12.4.5-.4 1.2-.4 1.6.1.4.5.4 1.2-.1 1.6-3.1 2.7-4.9 6.6-4.9 10.7 0 7.8 6.4 14.2 14.2 14.2s14.2-6.4 14.2-14.2c0-7.8-6.4-14.1-14.2-14.1-1.9 0-3.7.4-5.4 1.1-.6.2-1.3 0-1.5-.6-.2-.6 0-1.3.6-1.5C65.7.4 67.8 0 70 0c9.1 0 16.5 7.4 16.5 16.5S79.1 32.9 70 32.9z" />
        </g>
        <g>
        <path fill="#7C2A8A" d="M70 28.4c-6.6 0-11.9-5.4-11.9-11.9 0-6.6 5.4-11.9 11.9-11.9 5 0 9.5 3.2 11.2 7.9.5 1.3.7 2.6.7 4 0 .6-.5 1.1-1.101 1.1-.6 0-1.1-.5-1.1-1.1 0-1.1-.2-2.2-.601-3.3-1.399-3.8-5-6.4-9.1-6.4-5.3 0-9.6 4.3-9.6 9.6s4.3 9.6 9.6 9.6c.6 0 1.1.5 1.1 1.1.002.8-.498 1.3-1.098 1.3z" />
        </g>
        <g>
        <path fill="#EC1848" d="M70 23.9c-4.1 0-7.4-3.3-7.4-7.4s3.3-7.4 7.4-7.4c.6 0 1.1.5 1.1 1.1 0 .6-.5 1.1-1.1 1.1-2.8 0-5.1 2.3-5.1 5.1s2.3 5.1 5.1 5.1 5.1-2.3 5.1-5.1c0-.6.5-1.1 1.101-1.1.6 0 1.1.5 1.1 1.1.099 4.2-3.201 7.5-7.301 7.5z" />
        </g>
        </g>
    </symbol>
    <symbol id="users" viewBox="0 0 16 16">
        <path d="M8,0a8,8,0,1,0,8,8A8,8,0,0,0,8,0ZM8,15a7,7,0,0,1-5.19-2.32,2.71,2.71,0,0,1,1.7-1,13.11,13.11,0,0,0,1.29-.28,2.32,2.32,0,0,0,.94-.34,1.17,1.17,0,0,0-.27-.7h0A3.61,3.61,0,0,1,5.15,7.49,3.18,3.18,0,0,1,8,4.07a3.18,3.18,0,0,1,2.86,3.42,3.6,3.6,0,0,1-1.32,2.88h0a1.13,1.13,0,0,0-.27.69,2.68,2.68,0,0,0,.93.31,10.81,10.81,0,0,0,1.28.23,2.63,2.63,0,0,1,1.78,1A7,7,0,0,1,8,15Z" />
    </symbol>
    <symbol id="comments" viewBox="0 0 16 16">
        <path d="M0,16.13V2H15V13H5.24ZM1,3V14.37L5,12h9V3Z" />
        <rect x="3" y="5" width="9" height="1" />
        <rect x="3" y="7" width="7" height="1" />
        <rect x="3" y="9" width="5" height="1" />
    </symbol>
    <symbol id="pages" viewBox="0 0 16 16">
        <rect x="4" width="12" height="12" transform="translate(20 12) rotate(-180)" />
        <polygon points="2 14 2 2 0 2 0 14 0 16 2 16 14 16 14 14 2 14" />
    </symbol>
    <symbol id="collapse" viewBox="0 0 16 16">
        <polygon points="11.62 3.81 7.43 8 11.62 12.19 10.09 13.71 4.38 8 10.09 2.29 11.62 3.81" />
    </symbol>
    </svg>
    <header class="page-header">
        <nav>
            <a href="Home.jsp" aria-label="forecastr logo" class="logo">
                <svg width="140" height="49">
                <use xlink:href="#logo"></use>
                </svg>
            </a>
            <button class="toggle-mob-menu" aria-expanded="false" aria-label="open menu">
                <svg width="20" height="20" aria-hidden="true">
                <use xlink:href="#down"></use>
                </svg>
            </button>
            <ul class="admin-menu">
                <li class="menu-heading">
                    <h3>STUDENT PANEL</h3>
                </li>
                <li>
                    <a href="student?mod=0">
                        <svg>
                        <use xlink:href="#users"></use>
                        </svg>
                        <span>Profile</span>
                    </a>
                </li>
                <li>
                    <a href="student?mod=1">
                        <svg>
                        <use xlink:href="#pages"></use>
                        </svg>
                        <span>Exam Register</span>
                    </a>
                </li>
                <li>
                    <a href="student?mod=2">
                        <svg>
                        <use xlink:href="#pages"></use>
                        </svg>
                        <span>Registed Exam</span>
                    </a>
                </li>
                <li>
                    <a href="student?mod=3">
                        <svg>
                        <use xlink:href="#comments"></use>
                        </svg>
                        <span>Notifications</span>
                    </a>
                </li>
                <li>
                    <a href="logout">
                        <svg>
                        <use xlink:href="#comments"></use>
                        </svg>
                        <span>Log out</span>
                    </a>
                </li>
                <li>
                    <div class="switch">
                        <input type="checkbox" id="mode" checked>
                        <label for="mode">
                            <span></span>
                            <span>Dark</span>
                        </label>
                    </div>
                    <button class="collapse-btn" aria-expanded="true" aria-label="collapse menu">
                        <svg aria-hidden="true">
                        <use xlink:href="#collapse"></use>
                        </svg>
                        <span>Collapse</span>
                    </button>
                </li>
            </ul>
        </nav>
    </header>
    <section class="page-content">
        <section class="search-and-user">
            <div class="admin-profile">
                <span class="greeting">Hello ${user.userName}</span>
                <svg>
                <use xlink:href="#users"></use>
                </svg>
            </div>
        </section>
        <section class="grid">
            <article class="exam-list">
                <div>
                    <table class="list">
                        <tr>
                            <th>ID</th>
                            <th>Exam Detail</th>
                            <th>Status</th>
                        </tr>
                        <c:forEach items="${regis}" var="r">
                            <tr>
                                <td>${r.id}</td>
                                <td>${r.exam}</td>
                                <td>${r.status}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </article>
        </section>
    </section>
    <!-- partial -->
    <script  src="./script_1.js"></script>
</body>
</html>
