<html>
<head>

<style>
body{
                background-color: rgb(86, 228, 228);
                margin: 0;
                font-family: 'Poppins', sans-serif;
}
</style>
</head>
<body>
    <header class="head"
        style="background-color: rgb(12, 11, 52); display: flex; justify-content: space-between; align-items: center; padding: 0px 100px; color: white;">

        <h1> <b>Status Infotainment</b> </h1> 
        
    </header> 
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="java.io.*, java.net.*"
%>
<%
String fileName = "details.txt";
int job = 1000;
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String email = request.getParameter("email");
String num = request.getParameter("mobile");
String qualification =request.getParameter("hq");

String file2 = application.getRealPath("/") + "new_app_num.txt";

FileReader readf = new FileReader(file2);

int ch;
StringBuffer stt = new StringBuffer();
while((ch=readf.read())!=-1){

stt.append((char)ch);
}
String strr = stt.toString();
Integer value =Integer.valueOf(strr);

String file = application.getRealPath("/") + fileName;
FileWriter filewriter = new FileWriter(file, true);
filewriter.write(name+ "::"+pass+"::"+email+"::" +num+ "::"+qualification+"::"+value+"\r\n");
filewriter.close(); 


readf.close();
value+=1;
FileWriter filn = new FileWriter(file2);
filn.write(value.toString());
filn.close();



out.println("<center> <h2> <b>Account Created Successfully!!!!</b> </h2><br/> </center>");
out.println("<center> <h3>Your job application number is " + (value-1) + "</h3> </center>" );

%>





<form action= index.html align = center>
<input type = submit value =  "Click to login">
</form>
</body>
</html>