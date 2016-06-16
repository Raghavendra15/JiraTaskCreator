<%--
  Created by IntelliJ IDEA.
  User: raghss
  Date: 5/27/2016
  Time: 12:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JIRA Task Creator</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"/>

</head>
<script>$('.selectpicker').selectpicker({
    style: 'btn-info',
    size: 4
});
</script>
<style>
    .section-plans{
        background-color: aliceblue;
        position: absolute;
        border-radius: 5px;
    }
    .col{}
    .navbar-custom {
        color: white;
        margin-top: 2em;
        background-color: transparent;
        border-color: transparent;
        float: right;
        height: 70px;
    }

</style>
<body>
<div class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <!--<image src="Oracle.png" align="right"  width="200px" height="80px" ></image>-->
            <a href="https://jira.oraclecorp.com" class="navbar-brand"> <font color="#097054">JIRA Dashboard</font></a>
        <image src="Jira.jpg" align="left"  width="600px" height="80px" ></image>
        </div>
    </div>
</div>
<div>
<div class="container">
    <div class="header-panel">
    <!--<h1><font color="#ff9900">Jira Task Creator </font> </h1>-->
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading"><font size="4"><b>Jira Task Creator</b></font></div>
        <div class="panel-body">
            <div style="overflow:hidden;">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-8">
                            <div id="datetimepicker12"></div>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    $(function () {
                        $('#datetimepicker12').datetimepicker({
                            inline: true,
                            sideBySide: true
                        });
                    });
                </script>
            </div>
    <form class="form-horizontal" action="/JiraTask" method="get">
<div class="form-group">
    <%--@declare id="username"--%><label class="control-label col-sm-2" for="username"><font color="#6495ed"> Project Name</label>
        <div class="col-md-4">
    <input type="text" class="form-control" name="project" value="BICSQA"/>
        </div>
</div>
        <div class="form-group">
            <%--@declare id="username"--%><%--@declare id="issuetype"--%><label class="control-label col-sm-2" for="issueType">Issue Type</label>
                <div class="col-md-4">
                <select class="form-control selectpicker show-menu-arrow" name="issueType">
                    <option>Choose IssueType</option>
                    <option  value="Task">Task</option>
                    <option  value="epic">Epic</option>
                    <option  value="story">Story</option>
                    <option  value="test">Test</option>

                </select>
                </div>

        </div>
        <div class="form-group">
            <%--@declare id="assignee"--%><label class="control-label col-sm-2" for="assignee">Assignee</label>
                <div class="col-md-4">
                <select class="form-control" name="assignee" ><option value=""> None</option>
                    <option class="assignee" value="andrew.new@oracle.com">Andy</option>
                    <option class="assignee" value="raghavendra.s.s.s@oracle.com">Raghavendra SS</option>
                    <option class="assignee" value="rashmi.patange@oracle.com">Rashmi Patange</option>
                    <option class="assignee" value="vinod.murthy@oracle.com">Vinod Murhty</option>

                    <option class="assignee" value="deepika.arivalagan@oracle.com">Deepika  Arivalagan</option>
                    <option class="assignee" value="sneha.gharpure@oracle.com">Sneha Gharpure</option>
                    <option class="assignee" value="reena.jeganathan@oracle.com">Reena Jeganathan</option>
                    <option class="assignee" value="prasanth.dhulipala@oracle.com">Prasanth Dhulipala</option>
                    <option class="assignee" value="johnson.selvaraj@oracle.com">Jhonson Selvaraj</option>
                </select>
                </div>
        </div>
        <div class="form-group">
            <%--@declare id="username"--%><label class="control-label col-sm-2" for="username">Priority   </label>
                <div class="col-md-4">
            <select class="form-control" name="priority"><option>Choose Priority</option>
                <option  value="1">1</option>
                <option  value="2">2</option>
                <option  value="3">3</option>
                <option  value="4">4</option>

            </select>
        </div>
                </div>

        <div class="form-group">
            <%--@declare id="username"--%><label class="control-label col-sm-2" for="username">Summary </label>
                <div class="col-md-8">
                <textarea class="form-control"align="right" name="summary" id="textmessage" style="height: 80px; width: 600px;" placeholder="Enter Summary here..."    onclick="this.value=''" autofocus></textarea>
        </div>
                </div>
        <div class="form-group">
            <%--@declare id="username"--%><label class="control-label col-sm-2" for="username">Description </label>
                <div class="col-md-8">
                <textarea class="form-control"align="right" name="description" id="textsmessage" style="height: 80px; width: 600px;" placeholder="Enter Description here..."    onclick="this.value=''" autofocus></textarea>
                </div>
        </div>
        </font>
<div class="form-group">
   <label class="control-label col-sm-2"></label>
<div class="col-md-4">
    <button type="submit" name="Submit" class="btn btn-primary btn-lg">Create Task</button>
</div>
</div>
    </form>
    </div>
    </div>
    <image src="Oracle.png" align="right"  width="250px" height="80px" ></image>
    <table align="left">
        <tr>
            <td align="left"><br><br><font size="2">Copyright &copy; BICS  | Contact <a href="raghavendra.s.s.s@oracle.com">raghavendra.s.s.s@oracle.com</a> if tasks are not getting created.</font></td>
        </tr>
    </table>

</div>

<div class="container">

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>
