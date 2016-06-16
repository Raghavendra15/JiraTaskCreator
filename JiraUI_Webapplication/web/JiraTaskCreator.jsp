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
  <title>JIRA </title>
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
  #textmessage{
    padding-right: 10px;
    padding-left: 10px;
  }
    .padd{
        padding-top: 20px;
        padding-left: 10px;
    }

</style>
<body>
<div class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header"></div>
    <!--<image src="Oracle.png" align="left"  width="200px" height="80px" ></image>-->
    <a href="https://jira.oraclecorp.com" class="navbar-brand"><font color="" JIRA Dashboard</a>
    <image src="Jira.jpg" align="left"  width="600px" height="80px" ></image>
  </div>
</div>

<div class="container">
  <h1><font color="#ff9900"> Jira Task Creator </font></h1>
  <form class="form-inline" action="/JiraTask" method="get">
    <div class="form-group">
      <%--@declare id="project"--%><label for="project"><font color="#097054">Project Name</label>
      <input type="text" class="form-control" name="project" value="BICSQA"/>
    </div>
    <div class="form-group">
      <%--@declare id="username"--%><%--@declare id="issuetype"--%><label for="issueType">Issue Type</label>
      <select class="form-control selectpicker show-menu-arrow" name="issueType">
        <option>Choose IssueType</option>
        <option  value="Task">Task</option>
        <option  value="epic">Epic</option>
        <option  value="story">Story</option>
        <option  value="test">Test</option>

      </select>


    </div>
    <div class="form-group">
      <%--@declare id="assignee"--%><label  for="assignee">Assignee</label>
      <select class="form-control" name="assignee"><option value=""> None</option>
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
    <div class="form-group">
      <%--@declare id="username"--%><label for="username">Priority   :</label>
        <select class="form-control" name="priority"><option>Choose Priority</option>
          <option  value="1">1</option>
          <option  value="2">2</option>
          <option  value="3">3</option>
          <option  value="4">4</option>

        </select>
    </div>

    <div class="form-group">
      <%--@declare id="username"--%><label for="username">Summary </label>
        <div class="row">
      <textarea class="form-control col-md-6" name="summary" id="tmessage" style="height: 100px; width: 800px;" placeholder="Enter Summary here..."    onclick="this.value=''" autofocus></textarea>
    </div>
    </div>
    <div class="form-group">
      <%--@declare id="username"--%><label for="username">Description </label>
        <div class="row">
            <div class="text-center">
      <textarea class="form-control"  name="description" id="textmessage" style="height: 100px; width: 800px;" placeholder="Enter Description here..."    onclick="this.value=''" autofocus></textarea>
    </div>
    </div>
          </div>

<div class="padd"></div>

<div class="row">

    <div class="text-center">

      <input  type="submit" align="center" name="Submit" class="btn btn-primary btn-lg" value="Create Task"/>

</div>
  </div>
</form>
  </form>

</div>

<div class="container">
  <image src="Oracle.png" align="right"  width="300px" height="80px" ></image>
  <table align="right">
    <tr>
      <td align="right"><br><br>Copyright &copy; BICS  | Contact <a href="raghavendra.s.s.s@oracle.com">raghavendra.s.s.s@oracle.com</a> if tasks are not getting created.</td>
    </tr>
  </table>


</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>
