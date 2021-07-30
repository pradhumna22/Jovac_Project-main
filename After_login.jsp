<!DOCTYPE html>

<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="{% static 'css/home.css' %}">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <title>Status Infotainment</title>
    <style>
        body {
            background-color: rgb(86, 228, 228);
            margin: 0;
            font-family: 'Poppins', sans-serif;
        }
        .topnav a:hover{
            background-color: rgb(27, 26, 83);

        }
        .topnav a {
            color: white;
            text-align: center;
            padding: 7px 16px;
            text-decoration: none;
            font-size: 17px;
            display: inline-block;
            border: 2px solid white;
            border-radius: 9999px;
        }

    </style>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
</head>

<body>
    <header class="head"
        style="background-color: rgb(12, 11, 52); display: flex; justify-content: space-between; align-items: center; padding: 0px 100px; color: white;">

        <h1> <b>Status Infotainment</b> </h1> 
        <div class="topnav">
            <a href="logout.jsp">Logout</a>
        </div>
    </header>
<%@  page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"  import="java.io.*, java.net.*,java.util.Scanner" %>
<% 
        String mailId = request.getParameter("email");
        String pass = request.getParameter("pass");
        session.setAttribute("mail",mailId);
	int d=0;
        String filename = "details.txt";
        InputStream ins = application.getResourceAsStream("details.txt");
        BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
        String data;
        String message = "Unauthorized user, Please fill valid credentials or create a new account";
        while((data = br.readLine())!= null){
            String [] userdata = data.split("::");
            if(userdata[2].equals(mailId) && userdata[1].equals(pass)){
                message = "You are an authorized user"+ "<br/>" + "Logged-in Successfully";
                d=1;

                
                break;

            }

            }
            

            if(d==1){
                %>
                <div class="container-fluid">
        <div class="row" style="background-color:black;">
            
        </div>
    </div>
    <%
    br.close();
     String jep ="Your Application number is: ";
                StringBuffer tmp = new StringBuffer(jep);
                        InputStream sh = application.getResourceAsStream("details.txt");

                BufferedReader ap= new BufferedReader((new InputStreamReader(sh)));
                String aaa =  new String();

    while((data= ap.readLine())!= null){
            
            String [] userdata = data.split("::");
            if(userdata[2].equals(mailId)){
                
                tmp.append(userdata[5]);
                aaa= userdata[5];

             break;

            }
                      
    }
                out.println("<center><h3>"+message+"</h3></center>");
                out.println("<center><h3>"+tmp.toString()+ "</h3></center>");
 ap.close();

%>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12 ml-5 mr-5 mt-5 mb-5">
                 


                <form action="run_code.jsp" method="post">

                    <div class="form-group row">
                        <div class="col-sm-7 mr-5 ml-3">
                            <label for="comment"><h4>Coding Area</h4></label>
                            <lable for "comment">
                                <h4>Select a language: <h4>
                                    <select name="lang">
                                        <option name = java value="java">Java</option>
                                        <option name = py value="python">Python</option>
                            </lable>
                            

        </select> <br>
                            <textarea class="form-control" rows="14" name="code_area" style="border:1px solid grey; letter-spacing: 1px; font-family: 'Lucida Console'; font-size: 20px; " onkeydown="if(event.keyCode===9){var v=this.value,s=this.selectionStart,e=this.selectionEnd;this.value=v.substring(0, s)+'\t'+v.substring(e);this.selectionStart=this.selectionEnd=s+1;return false;}">{{code}}</textarea>
                        </div>
                        <div class="col-sm-3">
                            <div class="row mb-4">
                                <label for="comment"><h4>Question</h4></label>
                                <textarea class="form-control" rows="15" name="questions" style="border:1px solid grey;" disabled>
<%
        Integer file_num = ((new Integer(aaa))%20) + 1;

        StringBuffer psp = new StringBuffer(file_num.toString());
        psp.append(".txt");
                                    
        String fn = application.getRealPath("/") +psp.toString();
        int ch; 
                                    
                                    
        FileReader fir = new FileReader(fn);
        StringBuffer ques = new StringBuffer("");
        while((ch=fir.read())!=-1){
                                    
            ques.append((char)ch);
        }
        out.println(ques);
        fir.close();    
%>        
    </textarea>
                            </div>

                            <div class="row">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-7 ml-3">
                            <button class="btn btn-outline-success float-right" type="submit"> <b>Run Your Code </b> </button>
                        </div>
                    </div>
                </form>


            </div>
        </div>
    </div>
</body>
<%


            }
            else{
                                out.println("<center><h3>"+message+ "</h3></center>");

            }


%>

</html>
