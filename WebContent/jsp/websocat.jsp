<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="catting.BoardDAO" %>
<%@ page import="catting.BoardVO" %>
<%@ page import="user.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/chatting.css" />
</head>
<body>
 <%
 
  BoardDAO dao= new BoardDAO();

String user_id = (String)session.getAttribute("user_id");
String id2=request.getParameter("id2");
String name = request.getParameter("name");
BoardVO vo = dao.getMessge(user_id,id2);
 

%>
<input type="hidden" id="user_id" value='<%=user_id %>' />
<input type="hidden" id="id2" value='<%=id2 %>' />
<fieldset>
		<input type="hidden" id="test">
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"><% if(vo.getContext()==null){%> 반가워요! <%}else{%><%= vo.getContext()%><%}%></textarea>
        <br/>
        <input id="inputMessage" type="text"/>
        <input type="submit" value="send" onclick="send()" />
        
        <button><a id="message" href="../jsp/board.jsp">뒤로가기</a></button>
    </fieldset>
</body>
  <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
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
      onMessage(event)
    };

    function onMessage(event) {
        textarea.value +=  $('#id2').val()+": "+event.data + "\n";
    }

    function onOpen(event) {
    	 textarea.value +="\n"
    	
       /*  textarea.value += "연결 성공\n"; */
    }

    function onError(event) {
      alert(event.data);
    }

    function send() {
        textarea.value += $('#user_id').val()+": " + inputMessage.value + "\n";
        webSocket.send(inputMessage.value);
        inputMessage.value = "";

    }
    $('#message').on("click",(e)=>{
    	const messageWindow=$('#messageWindow').val();
    	e.preventDefault()
    	console.log('send click')
    	
    	$.ajax({
    		type:'post',
    		async:false,
    		url:'../jsp/MessageCheck.jsp?id2=<%= id2%>&name=<%= name%>',
    		dataType:'text',
    		data:{messageWindow:messageWindow},
    		success: function(data,textStatus){
    			if(data==='usable'){
    				console.log('전송완료하였습니다.')
    			}else{
    				console.log('전송실패하였습니다.')
    			}
    			
    		},
    		error:function(data,textStatus){
    			console.log('error');
    		}
    		
    	})
		$(location).attr('href','../jsp/board.jsp');
    })
  </script>

</html>