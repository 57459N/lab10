<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%-- Импортировать JSTL-библиотеку --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Импортировать собственную библиотеку теговых файлов --%>
<%@taglib prefix="my" tagdir="./WEB-INF/tags" %>
<%@taglib prefix="captcha" uri="http://bsu.rfe.java.teacher.tag/captcha" %>


<html>
<head>
    <title>Регистрация нового пользователя</title>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF8'/>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
<%-- Подключить заголовок страницы --%>
<div style="padding: 15px; clear: both;">
    <%-- Вставить разметку 1-колоночной страницы --%>
    <div>
        <h1>Регистрация нового пользователя</h1>
        <%-- Вставить тег отображения сообщения об ошибке --%>
        <my:errorMessage/>
        <%-- Отобразить форму регистрации (с подстановкой переданных
        данных) --%>
        <form action="doRegister.jsp" method="post">
            <table body="0" cellspacing="0" cellpadding="10">
                <tr>
                    <td>Логин:</td>
                    <%-- Начальное значение поля login равно
                    свойству login сохранѐнного в сессии JavaBean'а --%>
                    <td><input type="text" name="login"
                               value="${sessionScope.userData.login}"></td>
                </tr>
                <tr>
                    <td>Пароль:</td>
                    <td><input type="password" name="password"
                               value=""></td>
                </tr>
                <tr>
                    <td>Имя:</td>
                    <%-- Начальное значение поля name равно
                    свойству name сохранѐнного в сессии JavaBean'а --%>
                    <td><input type="text" name="name"
                               value="${sessionScope.userData.name}"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <%-- Начальное значение поля email равно
                    свойству email сохранѐнного в сессии JavaBean'а --%>
                    <td><input type="text" name="email"
                               value="${sessionScope.userData.email}"></td>
                </tr>
                <tr>
                    <td>
                        <captcha:body/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit"
                               value="Зарегистрироваться">
                        <%-- При нажатии на кнопку "Отменить" возвращаемся на страницу кабинета --%>
                        <input type="button"
                               value="Отменить" onclick="window.location='<c:url value="./index.jsp"/>';">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<%-- Вставить нижний заголовок страницы --%>
<%@ include file="static/footer.jsp" %>
</body>
</html>
