<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="java.io.*, java.net.*" session="true"%>
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

<% String mail = (String)session.getAttribute("mail");

StringBuffer temp = new StringBuffer("");
String dat;
InputStream a1 = application.getResourceAsStream("details.txt");
BufferedReader final1= new BufferedReader((new InputStreamReader(a1)));

    while((dat= final1.readLine())!= null){
            String [] userdata = dat.split("::");
            if(userdata[2].equals(mail)){

                temp.append(userdata[5]);

             break;

            }
     
    }
    final1.close();
    
String langChoosen = request.getParameter("lang");
String newfilename = "JOB"+temp.toString()+"."+langChoosen;

String Usercode = request.getParameter("code_area");
StringBuffer sss = new StringBuffer("C:\\Program Files\\Apache Software Foundation\\Tomcat 10.0\\webapps\\Jovac_Project-main\\");
sss.append(newfilename);

 FileWriter abp = new FileWriter(sss.toString());
 abp.write(Usercode);
 abp.flush();
 abp.close();
 out.println("<center><h1>Code Submitted successfully</h1></center>");
 session.invalidate(); 
 


%>
</body>
</html>