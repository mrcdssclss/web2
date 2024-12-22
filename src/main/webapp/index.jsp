<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="utils.ResultsBean" %>
<html>
<body>
<link>
<link rel="stylesheet" href="IndexStyle.css">
<div id="main">
    <h2>Шмидт Александра Андреевна, Р3215, вариант 1339</h2>
    <section class="block plot-section">
        <div class="graphic">
            <svg id="graph" height="300" width="300" xmlns="http://www.w3.org/2000/svg">
                <!-- четверть круга, левая нижняя часть -->
                <circle id = round cx="250" cy="150" r="50" fill="#8F4A46" fill-opacity="0.6"/>
                <rect id = rect1 x="200" y="100" width="50" height="50" fill="#DEBDBB" fill-opacity="1"/>
                <rect id = rect2 x="250" y="50" width="50" height="200" fill="#DEBDBB" fill-opacity="1"/>

                <!-- прямоугольник, правая верхняя часть -->
                <rect id = rect3 x="250" y="50" width="100" height="100" fill="#8F4A46" fill-opacity="0.6"/>

                <!-- Треугольник (правая нижняя часть) -->
                <polygon id = triangle points="250,150 350,150 250,200" fill="#8F4A46" fill-opacity="0.6"/>
                <!-- Центр оси координат -->
                <circle id=target-dot cx="250" cy="150" r="0" stroke="white" fill="white"></circle>
                <line stroke="#2B465E" x1="100" x2="400" y1="150" y2="150"></line>
                <line stroke="#2B465E" x1="250" x2="250" y1="0" y2="300"></line>
                <polygon fill="white" points="250,0 244,15 256,15" stroke="white"></polygon>
                <polygon fill="white" points="400,150 385,156 385,144" stroke="white"></polygon>

                <!-- Засечки -->
                <line stroke="#2B465E" x1="300" x2="300" y1="155" y2="145"></line>
                <line stroke="#2B465E" x1="350" x2="350" y1="155" y2="145"></line>

                <line stroke="#2B465E" x1="150" x2="150" y1="155" y2="145"></line>
                <line stroke="#2B465E" x1="200" x2="200" y1="155" y2="145"></line>

                <line stroke="#2B465E" x1="245" x2="255" y1="100" y2="100"></line>
                <line stroke="#2B465E" x1="245" x2="255" y1="50" y2="50"></line>

                <line stroke="#2B465E" x1="245" x2="255" y1="200" y2="200"></line>
                <line stroke="#2B465E" x1="245" x2="255" y1="250" y2="250"></line>

                <!-- Подписи к засечкам    -->
                <text fill="white" x="295" y="140">R/2</text>
                <text fill="white" x="348" y="140">R</text>

                <text fill="white" x="140" y="140">-R</text>
                <text fill="white" x="190" y="140">-R/2</text>

                <text fill="white" x="260" y="105">R/2</text>
                <text fill="white" x="260" y="55">R</text>

                <text fill="white" x="260" y="205">-R/2</text>
                <text fill="white" x="260" y="255">-R</text>

                <text fill="white" x="260" y="10">Y</text>
                <text fill="white" x="390" y="140">X</text>
            </svg>
        </div>
</section></div>
    <table class="main-section">
        <tbody>
            <tr>
                <td class="left-block">
                    <img id = "happy" src="https://media1.tenor.com/m/fitGu2TwtHoAAAAd/cat-hyppy.gif" width="300" height="300">
                </td>
                <td>
                    <table class="center-block">
                        <tr>
                            <td>
                                <label >Выберите X</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select id="selectX">
                                    <option value="-2" selected>-2</option>
                                    <option value="-1.5">-1.5</option>
                                    <option value="-1">-1</option>
                                    <option value="-0.5">-0.5</option>
                                    <option value="0">0</option>
                                    <option value="0.5">0.5</option>
                                    <option value="1">1</option>
                                    <option value="1.5">1.5</option>
                                    <option value="2">2</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Введите Y</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="number" id="yInput" step="any" min="-5" max="3" placeholder="Введите y"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Выберите R</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select id="selectR">
                                    <option value="1" selected>1</option>
                                    <option value="1.5">1.5</option>
                                    <option value="2">2</option>
                                    <option value="2.5">2.5</option>
                                    <option value="3">3</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <button id="getButton" value="1">Проверить</button>
                                <label id="status"></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="table.jsp" class="button">результаты</a>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <img id = "meow" src="https://media1.tenor.com/m/DM7SdBiQKhEAAAAd/cat-underwater.gif" width="300" height="300">
                </td>
            </tr>
        </tbody>
    </table>
<%
    //todo неправильное приведение типов
    ResultsBean resultsBean = (ResultsBean) request.getSession().getAttribute("results");
    if (resultsBean == null){
        resultsBean = new ResultsBean();
        request.getSession().setAttribute("results", resultsBean);
    }
%>
<script>
    //todo как передается все сюда и отсюда
    let x = 0;
    let y = 0;
    let r = 0;
    let b = document.getElementById("selectR").value;

    const button = document.getElementById("getButton")
    const graph = document.getElementById("graph")

    graph.addEventListener("click", ev => {
        const svgRect = graph.getBoundingClientRect();
        x = ev.clientX - svgRect.left;
        y = ev.clientY - svgRect.top;
        r = document.getElementById("selectR").value;
        //todo переписать по божески
        x = ((x - 259) / 100 * r)
        y = ((y - 159) / -100 * r)
        sendPostRequest()
    })

    function isIncorrect(str) {
        return !str || !str.trim() || str.startsWith('.');
    }

    button.addEventListener("click", ev => {
        document.getElementById("status").innerText = "";
        x = document.getElementById("selectX").value;
        y = document.getElementById("yInput").value;
        r = document.getElementById("selectR").value;
        if (isIncorrect(y) || y < -5 || y > 3) {
            document.getElementById("status").innerText = "Некорректное значение для y";
        } else {
            sendPostRequest()
        }
    })

    //todo по человечески окрашивать
    function drawCircle(x, y, answer) {
        clearCircles()
        const circle = document.createElementNS("http://www.w3.org/2000/svg", "circle")
        circle.setAttribute("cx", x / r * 100 + 250);
        circle.setAttribute("cy", y / r * -100 + 150);
        circle.setAttribute("r", 2)
        circle.setAttribute("class", "circles");
        circle.setAttribute("fill", "light blue")
        if (answer === true) {
            circle.setAttribute("fill", "pink")
        }
        graph.appendChild(circle)

    }

    function clearCircles() {
        const circles = graph.querySelectorAll("circle.circles")
        if (r !== b){
            circles.forEach(circle => {
            graph.removeChild(circle);
        });}
    }

    function sendPostRequest() {
        const data = {
            x: x,
            y: y,
            r: r
        }
        const jsonFormatData = JSON.stringify(data)
        fetch("controllerServlet", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: jsonFormatData
        }).then(response => {
            return response.text()
        }).then(result =>{
            const json = JSON.parse(result)
            drawCircle(x, y, json.answer)
        })
    }
</script>
</body>
</html>
