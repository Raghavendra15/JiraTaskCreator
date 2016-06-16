<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: raghss
  Date: 5/14/2016
  Time: 12:22 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <title>IntelliJ Idea !15</title>
</head>
<style>
    form {
        margin: 0 auto;
        width:250px;
    }
    body {
        min-width: 520px;
        font-family: "Trebuchet MS", "Helvetica", "Arial",  "Verdana", "sans-serif";
        font-size: 80%;
    }.form{
         width: auto;
         position: center;
         padding-bottom: 100px;
     }
    .column {
        width: auto;
        float: left;
        padding-bottom: 100px;
    }
    .portlet {
        margin: 0 1em 1em 0;
        padding: 0.3em;
    }
    .portlet-header {
        padding: 0.2em 0.3em;
        margin-bottom: 0.5em;
        position: relative;
    }
    .portlet-toggle {
        position: absolute;
        top: 50%;
        right: 0;
        margin-top: -8px;
    }
    .portlet-content {
        padding: 0.4em;
    }
    .portlet-placeholder {
        border: 1px dotted black;
        margin: 0 1em 1em 0;
        height: 50px;
    }
    h1 {
        font-size: 2em;
    }
    img {
        vertical-align: text-top;
    }#submitButton {

         background: #0066A2;

         color: white;

         border-style: outset;

         border-color: #0066A2;

         height: 40px;

         width:120px;

         font: bold 15px arial, sans-serif;

     }

    option.serif {background-color: #c4bfcc;  font-size: 12px;}
    option.issuetype {background-color: #c0ff8b;}
    option.assignee {background-color: #a9ffaa;}
</style>

<body>
<image src="Jira.jpg" align="left"  width="600px" height="80px" class="img-rounded"></image>
<h1 align="left" id="Jira"> <font color="#483d8b" size="7"> JIRA Task Creator </font> </h1>
<div align="right" class="chart-content"> <%= new java.util.Date()%></div>
<form class="form-horizontal"align="center" action="/JiraTask" method="get">


    <br>
    <div class="row">
        <div class="col-xs-6 form-group">
            <font color="#483d8b" size="4"><label> <font > Project: </font><span class="small"></span></label><br><input align="middle" type="text" name="project" value="BICSQA" autofocus><br>
                <font size="1"><b> <p>Project is generally BICS</p></b></font>
                <!--Issue Type:  <input align="middle" type="text" name="issueType" value="Task"><br>-->
        </div>
        <div class="col-xs-12 form-group">

            <label> <font > Issue Type: </font><span class="small"></span></label><br>
            <select class="serif" name="issueType" autofocus>
                <option>Choose IssueType</option>
                <option class="issuetype" value="Task">Task</option>
                <option class="issuetype" value="epic">Epic</option>
                <option class="issuetype" value="story">Story</option>
                <option class="issuetype" value="test">Test</option>

            </select><br>
        </div>
        <form class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-sm-2">Quarter</label>
                <div class="col-md-10">
                    <input type="text" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Address</label>
                <div class="col-md-8">
                    <input type="text" class="form-control">
                </div>
                <label class="control-label col-sm-1">Addr. №</label>
                <div class="col-md-1">
                    <input type="text" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Block name/Number</label>
                <div class="col-md-4">
                    <input type="text" class="form-control">
                </div>
                <label class="control-label col-sm-1">Entrance</label>
                <div class="col-md-1">
                    <input type="text" class="form-control">
                </div>
                <label class="control-label col-sm-1">Floor</label>
                <div class="col-md-1">
                    <input type="text" class="form-control">
                </div>
                <label class="control-label col-sm-1">Apartment</label>
                <div class="col-md-1">
                    <input type="text" class="form-control">
                </div>
            </div>
        </form>
        <!--<font size="1"> <b><p>Issue Type Can be : Task,epic, story,test </p></b></font>-->
        <!--<input align="middle" type="text"size="50" name="summary" value=""><br>-->
        <div class="col-xs-12 form-group">
            <!--Assignee  :  <input align="center" type="text"size="28" name="assignee" value=""><br>-->
            <label> <font > Assignee : </font><span class="small"></span></label><br>
            <select class="serif" name="assignee" autofocus><option> None</option>
                <option class="assignee" value="andrew.new@oracle.com">Andy</option>
                <option class="assignee" value="raghavendra.s.s.s@oracle.com">Raghavendra SS</option>
                <option class="assignee" value="rashmi.patange@oracle.com">Rashmi Patange</option>
                <option class="assignee" value="vinod.murthy@oracle.com">Vinod Murhty</option>

                <option class="assignee" value="deepika.arivalagan@oracle.com">Deepika  Arivalagan</option>
                <option class="assignee" value="sneha.gharpure@oracle.com">Sneha Gharpure</option>
                <option class="assignee" value="reena.jeganathan@oracle.com">Reena Jeganathan</option>
                <option class="assignee" value="prasanth.dhulipala@oracle.com">Prasanth Dhulipala</option>
                <option class="assignee" value="johnson.selvaraj@oracle.com">Jhonson Selvaraj</option>
            </select><br>
        </div>
    </div>
    <label> <font > Summary : </font><span class="small"></span></label><textarea class="form-control" align="right" name="summary" id="message" style="height: 80px; width: 400px;"    placeholder="Enter Summary here..." onclick="this.value=''" autofocus></textarea><br>
    <label> <font > Description : </font><span class="small"></span></label> <textarea class="form-control" align="right" name="description" id="textmessage" style="height: 80px; width: 400px;" placeholder="Enter Description here..."    onclick="this.value=''" autofocus></textarea><br>
    <!--Priority : <input align="center" type="text" size="50"name="priority" value=""><br>-->
    <label> <font > Priority: </font><span class="small"></span></label><br>
    <select class="serif" name="priority"><option>Choose Priority</option>
        <option class="serif" value="1">1</option>
        <option class="serif" value="2">2</option>
        <option class="serif" value="3">3</option>
        <option class="serif" value="4">4</option>

    </select><br>

    <font size="1"> <b><p>Priority can be : 1, 2, 3, 4 </p></b></font>

    <!--<input id="submitButton" type="submit" name="Submit" value="Create"><br>-->
    <button type="submit" name="Submit" class="btn btn-primary btn-lg">Create</button>


    </font>



</form> </div>


<image src="Oracle.png" align="right"  width="350px" height="100px" ></image>

<div>
    <table align="right">
        <tr>
            <td align="right"><br><br>Copyright &copy; BICS  | Contact <a href="raghavendra.s.s.s@oracle.com">raghavendra.s.s.s@oracle.com</a> if tasks are not getting created.</td>
        </tr>
    </table>
</div>

</body>
</html>
