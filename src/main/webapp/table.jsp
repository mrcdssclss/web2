<%@ page import="utils.ResultsBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Результаты</title>
    <link rel="stylesheet" href="TestStyle.css">
</head>
<body>
<table id="resultsTable" border="1">
    <thead>
    <tr>
        <th><h2 class="headerOfTable">X</h2></th>
        <th><h2 class="headerOfTable">Y</h2></th>
        <th><h2 class="headerOfTable">R</h2></th>
        <th><h2 class="headerOfTable">Ответ</h2></th>
        <th><h2 class="headerOfTable">Время выполнения (наносекунды)</h2></th>
        <th><h2 class="headerOfTable">Время на сервере</h2></th>
    </tr>
    </thead>
    <tbody>
    <jsp:useBean id="results" type="utils.ResultsBean" scope="session"/>
    <%
        if (results != null){
            ArrayList<ResultsBean.Result> lst = (ArrayList<ResultsBean.Result>) results.getResults();
            for (ResultsBean.Result result : lst) { %>
                <tr>
                    <td><%= result.getX() %></td>
                    <td><%= result.getY() %></td>
                    <td><%= result.getR() %></td>
                    <td><%= result.isAnswer() %></td>
                    <td><%= result.getExecutionTime() %></td>
                    <td><%= result.getTime() %></td>
                </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
<a href="index.jsp" class="button">вернуться</a>
</body>
</html>


