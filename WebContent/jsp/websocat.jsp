<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="catting.BoardDAO" %>
<%@ page import="user.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 String user_id =(String)  session.getAttribute("user_id"); //본인아이디
 String id = request.getParameter("id");//친구아이디
	System.out.println(request.getParameter("id"));
%>
<fieldset>
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <br/>
        <input id="inputMessage" type="text"/>
        <input type="submit" value="send" id="send" onclick="send()" />
    </fieldset>
</body>


<script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8070/Javachatting/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
      onError(event)
    };

    webSocket.onopen = function(event) {
      onOpen(event)
    };

    webSocket.onmessage = function(event) {
      onMessage(event,id)
    };

    function onMessage(event) {
        textarea.value += "상대 : " + event.data + "\n";
    }

    function onOpen(event) {
    	
        textarea.value += "연결 성공\n";
    }

    function onError(event) {
      alert(event.data);
    }

    function send() {
    	
        textarea.value += "나: " + inputMessage.value + "\n";
        webSocket.send(inputMessage.value);
        inputMessage.value = "";
        
 
    }
    $('#send').on("click",(e)=>){
    	const context=$('#messageWindow').val();
    	e.preventDefault()
    	console.log('send click')
    	
    	$.ajax({
    		type:'post',
    		async:false,
    		url:'src/MessageCheck',
    		
    	})	
    }
  </script>
</html>