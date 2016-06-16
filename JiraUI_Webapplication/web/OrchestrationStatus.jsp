<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
 <%@page import="java.io.File"%>
 <%@page import="java.util.Scanner"%>
 <%@page import=""%>
<%@ page import="JiraParser.OrchestrationPageHelper" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orchestration list</title>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	
<%
OrchestrationPageHelper oph=new OrchestrationPageHelper();
//String tabledata =   "[{'name' : 'abc', 'age' : 50},{'age' : '25', 'hobby' : 'swimming'},{'name' : 'xyz', 'hobby' : 'cricket'}]" ; 
//String region_usage_data="[['Region','Usage'],['systemtestmain',4],['IDC',5],['UK',11],['HQ',100]]";
//String user_usage_data="[['User','Usage'],['tpowell',2],['rielkad',2],['systemtestmain',4],['pdhulipa',3],['sberry',1],['pmdavis',3],['rgrieve',1],['nkearsey',2],['vimurthy',100]]";

String tabledata=oph.getFullRowUsageStr();
String region_usage_data=oph.getUsageByRegionStr();
String user_usage_data=oph.getUsageByUserStr();
%>
<script type="text/javascript">   	
     //var tabList = [{"name" : "abc", "age" : 50},{"age" : "25", "hobby" : "swimming"},{"name" : "xyz", "hobby" : "programming"}];
     var tabList=  <%=tabledata%>;
    $( document ).ready(function() {
    	var s=JSON.stringify(tabList);
    	//alert(s.indexOf("ExceptionCaught") > -1);
    	if(s.indexOf("ExceptionCaught") > -1){
    		$("#excelDataTable").append("<tr><td> <font size='3' color='red'>Problem reading records.The data file may be in bad state. Please retry later !</font></td></tr>");
    		return;
    	}
    	buildHtmlTable(tabList);
    });
    
    function buildHtmlTable(myList) {
        var rowspans=getRowSpans(myList);
       var columns = addAllColumnHeaders(myList);
       var total=0;
   	var subTotal=0;
   	 var rowspanidex=0;
   	 var rowspanvalue;
       for (var i = 0 ; i < myList.length ; i++) { 
   	    total=total+myList[i]["Usage"];
   	    console.log( 'i is '+i);	
   		var row$ = $('<tr/>');			
   		if(i==0){
   			
   			console.log("rowindex at i =0 is  "+rowspanidex);
   			var rspan=rowspans[rowspanidex]+2;
   			console.log("rspan at i =0 is  "+rspan);
   			for (var colIndex = 0 ; colIndex < columns.length ; colIndex++) {
   				var cellValue = myList[i][columns[colIndex]];
   				
   				if(colIndex==0){
   					row$.append($('<td rowspan="'+rspan+'"/>').html(cellValue));
   				}else{
   					row$.append($('<td/>').html(cellValue));
   				}	
 
   			}   			
   			subTotal=myList[i]['Usage'];
   		}else{
   		     var isFullRow=false;
   			for (var index = 0 ; index < rowspans.length ; index++) {
   				var rsvalue = rowspans[index];   				 
   				if(i==rsvalue+1){
   					isFullRow="yes";
   					break;
   				}
   			}
   			if(isFullRow=="yes"){				
   			    var subtotrow$ = $('<tr/>');   				
   				subtotrow$.append($('<td colspan="2" align="right" style="background-color: #EFF2FB;"/>').html('sub-total : '+subTotal));
   				$("#excelDataTable").append(subtotrow$);
   				console.log("i for full row "+i);
   				console.log("rowindex before full row "+rowspanidex);
   				var rspan=rowspans[rowspanidex+1] - rowspans[rowspanidex] +1;   							
   				console.log("span before full row "+rspan);
   				
   				for (var colIndex = 0 ; colIndex < columns.length ; colIndex++) {
   					var cellValue = myList[i][columns[colIndex]];   					
   					
   					if(colIndex==0){
   						row$.append($('<td rowspan="'+rspan+'"/>').html(cellValue));
   					}else{
   						row$.append($('<td/>').html(cellValue));
   					}			  					
   			
   				
   				}   			          
   				subTotal=myList[i]['Usage'];
   				rowspanidex++;   			
   			}else{
   				subTotal=subTotal+myList[i]['Usage'];
   				for (var colIndex = 0 ; colIndex < columns.length ; colIndex++) {
   					var cellValue = myList[i][columns[colIndex]];
   					if(colIndex==0){   					        
   					}else{
   						row$.append($('<td />').html(cellValue));            
   					}		
   					
   				}				
   			}
   		}
   		
   		$("#excelDataTable").append(row$);
   		if(i==myList.length-1){
   					var subtotrow$ = $('<tr/>');
   					subtotrow$.append($('<td colspan="3" align="right" style="background-color: #EFF2FB;"/>').html('sub-total : '+subTotal));
   					$("#excelDataTable").append(subtotrow$);
   		}
   		
   		
   	}
   	
   	var totalrow$ = $('<tr style="background-color: #F6CED8;"/>');
   	totalrow$.append($('<td colspan="3" align="right"/>').html('total : '+total));
   	$("#excelDataTable").append(totalrow$);   
   }


   function getRowSpans(myList)
   {
       var columns = getAllColumnHeaders(myList);
       var rowspans = [];
       for (var i = 0 ; i < myList.length ; i++) {    
   		     var currVal;
   			 var nextVal;
               currVal = myList[i][columns[0]];
   			if(i!=myList.length-1){
   				nextVal = myList[i+1][columns[0]];
   				if(currVal != nextVal){
   					rowspans.push(i);
   				}
   			}    
   			else{
   				rowspans.push(i);
   			}
   			
   			      
   	  
   	}
   	console.log(rowspans);
       return rowspans;
   }
   // Adds a header row to the table and returns the set of columns.
   // Need to do union of keys from all records as some records may not contain
   // all records
   function addAllColumnHeaders(myList)
   {
       var columnSet = [];
       var headerTr$ = $('<tr style="background-color: #7DDE7D;"/>');

       for (var i = 0 ; i < myList.length ; i++) {
           var rowHash = myList[i];
           for (var key in rowHash) {
               if ($.inArray(key, columnSet) == -1){
                   columnSet.push(key);
                   headerTr$.append($('<th style="background-color: #F6CED8;"/>').html(key));
               }
           }
       }
       $("#excelDataTable").append(headerTr$);

       return columnSet;
   }

   function getAllColumnHeaders(myList)
   {
       var columnSet = [];
       

       for (var i = 0 ; i < myList.length ; i++) {
           var rowHash = myList[i];
           for (var key in rowHash) {
               if ($.inArray(key, columnSet) == -1){
                   columnSet.push(key);
                   
               }
           }
       }
       

       return columnSet;
   }
     
    </script>
    
    
    <script>
      google.load("visualization", "1", {packages:["corechart"]});      
      google.setOnLoadCallback(drawChart);
      
      function drawChart() {       
    	  var s=JSON.stringify(<%=region_usage_data%>);    	  
      		//alert(s.indexOf("ExceptionCaught") > -1);
      	if(s.indexOf("ExceptionCaught") > -1){    	  
    	  		$("#pie_chart_by_region_div").append("<font size='3' color='red'>Problem reading records.The data file may be in bad state. Please retry later !</font>");
    	  		return;
    	  }
    	var graph_pie_chart_data_region=<%=region_usage_data%>;
        var pie_chart_data_region = google.visualization.arrayToDataTable(graph_pie_chart_data_region);       
        var pie_chart_options_region = {
          title: 'Usage by Region'
        };        
	    var pie_chart_region = new google.visualization.PieChart(document.getElementById('pie_chart_by_region_div'));
        pie_chart_region.draw(pie_chart_data_region, pie_chart_options_region);        
      
       var graph_pie_chart_data_user=<%=user_usage_data%>;
        var pie_chart_data_user = google.visualization.arrayToDataTable(graph_pie_chart_data_user);       
        var pie_chart_options_user = {
          title: 'Usage by User'
        };        
	    var pie_chart_user = new google.visualization.PieChart(document.getElementById('pie_chart_by_user_div'));
        pie_chart_user.draw(pie_chart_data_user, pie_chart_options_user);
        
      }
    </script>
	

	<script>
	function statusFunc(id,index,status) {		
		var rows = document.getElementsByTagName("tr");
			var inputElems = document.getElementById(id).getElementsByTagName("input");		
			var tdElem = rows[index].cells;
			var statusElem = tdElem[1];	
			statusElem.innerHTML =status;
			var en=inputElems[1].disabled;
			if(en){
				console.log('disabled');
			}
		
		//return "status";
	}
	if(!String.prototype.startsWith){
	    String.prototype.startsWith = function (str) {
	        return !this.indexOf(str);
	    }
	}
	function newtestfunc(id,index,buttonPress) {
			//alert("Stop clicked");
			//Change the UI to set In-progress status...
			//alert(buttonPress);
			
			var rows = document.getElementsByTagName("tr");
			var inputElems = document.getElementById(id).getElementsByTagName("input");
			//var tdElems = document.getElementById(id).getElementsByTagName("td");
			var row=rows[index];
			var tdElem = rows[index].cells;
			var statusElem = tdElem[1];			
			
			//statusElem.innerHTML = "In progress";
			//statusElem.style.backgroundColor = "yellow";
			var orchname = inputElems[0].value;
			var orchSplit=orchname.split("/");
			var uid=orchSplit[2];
			//alert(uid);
			var role="nonadmin";
			if(uid.startsWith("chef")||uid.startsWith("mats")){
				alert("Instance type is chef or mats. No credentials required. Click OK to continue");
				role="admin";
				var datastring = "administrator nimbadmin "+orchname+" "+buttonPress+" "+role;
				
			}else{
				//alert("not chef");
				var username = prompt("Nimbula Username: ");
				if(!username) {
					return false;
				}
				
				var password = prompt("Nimbula Password: ");
				if(!password) {
					return false;
				}
				if(username==="orch_ui_admin"){
					username="administrator";
					if(password!="welcome") {
						alert("Invalid password");
						return false;
					}
					password="nimbadmin";
					role="admin";
				}else if(username!=uid){
					alert("User '"+username+"' is not authorized to carry out this operation for this instance. Please enter correct username")
					return false;
				}
				var datastring = username+" "+password+" "+orchname+" "+buttonPress+" "+role;;
			}	
			alert(datastring);
			var flag = 0;
			
			if(buttonPress === "Delete") {
				inputElems[1].disabled = true;
				inputElems[2].disabled = true;
				statusElem.innerHTML = "Delete in progress";
				row.style.backgroundColor = "yellow";
			$.ajax({
				url: '/bicsqa-10/StopOrchServlet',
				data: {val : datastring},
				type: 'post',
				success: function(data){
                    subdata = data.substring(1,data.length-1);
                    var arr = subdata.split(",");
                    
					arr[0] = arr[0].trim();
					arr[1] = arr[1].trim();
					if(arr[0] === "Login successful") {
						//alert("Login success!");
						if(arr[1] === "Success") {
							alert(orchname+"\n deleted");
							flag = 1;
							document.getElementById("orch_table").deleteRow(index);
							inputElems[1].disabled = false;
							inputElems[2].disabled = false;
							statusElem.innerHTML = "ready";
							
							rrow.style.backgroundColor = "";
						} else {
							alert(orchname+"\n Delete failed");
						}
					} else {
						alert(orchname+'\n '+arr[0]);
					}
					
					
					//Change back...
					if(flag==0) {
					inputElems[1].disabled = false;
					inputElems[2].disabled = false;
					//statusElem.innerHTML = "ready";
					document.location.reload();
					//statusElem.style.backgroundColor = "white";
					row.style.backgroundColor = "";
					}
				}
			});
			} else {
				//Request for restarting the orchestration...
				//alert("Restart request sending...");
				inputElems[1].disabled = true;
				inputElems[2].disabled = true;
				statusElem.innerHTML = "Restart in progress";
				row.style.backgroundColor = "yellow";
				$.ajax({
					url: '/bicsqa-10/StopOrchServlet',
					data: {val : datastring},
					type: 'post',
					success: function(data){
	                    subdata = data.substring(1,data.length-1);
	                    var arr = subdata.split(",");
	                    
	                    //alert("Restart success request");
						arr[0] = arr[0].trim();
						arr[1] = arr[1].trim();
						//alert(arr);
						//alert(arr[0]);
						if(arr[0] === "Login successful") {
							//alert("Login success!");
							if(arr[1] === "Success") {
						
								alert(orchname+"\n restarted.");
							flag=1;
							//statusElem.innerHTML = "Restart";
							} else {
								alert(orchname+"\n Restart failed");
							}
						} else {
							//alert('into else');
							alert(orchname+ '\n'+arr[0]);
							//document.location.reload();
						}
						
						
						//Change back...
						inputElems[1].disabled = false;
						inputElems[2].disabled = false;
						statusElem.innerHTML = "ready";
						if(flag==0){
							//statusElem.innerHTML = "ready";
							document.location.reload();
							inputElems[1].disabled = false;
							inputElems[2].disabled = false;
						}
						
						//statusElem.style.backgroundColor = "white";
						row.style.backgroundColor = "";
 					}
// 					complete: function(){ //A function to be called when the request finishes (after success and error callbacks are executed) - from jquery docs
// 						   //do smth if you need
// 						   document.location.reload(); 
// 					}
				});
			}
			
			
			
		return false;
		};
		
	
	</script>

</head>
<body >

	<%
		File file = new File("/net/slcnas502/export/bishiphome_qa1/BICSQA/bicsqa10dashboard/scripts/list_of_orch.txt");
	    //File file = new File("/net/slc02kpk/scratch/abhishku/DEV/bicsqa10_project/scripts/list_of_orch_blank.txt");
    	Scanner input = new Scanner(file);
    	Scanner temp = new Scanner(file);
    	int count = 0;
    	//Count No. of lines and display warning if more than 22...
    	while(temp.hasNextLine()) {
    		count++;
    		temp.nextLine();
    	}
		System.out.println("Count: "+count);
	%>
	<h1>BICS Nimbula Orchestration Management Page </h1>
		<a href="http://adc6170720.us.oracle.com:8181/bicsqa-10/ViewLatestResults.jsp">Click here to go to BICS Home Page</a>
		<br><br><hr>
		
	<div>
		<div class="column">
			<div class="portlet">
				<div class="portlet-header"><b>Instance Action Centre</b>
				
				</div>
				<div class="portlet-content" id="sysinfo">			
				<h3 align=left><u>NOTE: Please refresh page every 1 minute to check current status</u></h3>				
				<h3>How to use</h3>
	<ul  id="uldisc">
        <li id="li_wrap">Table lists all the instances and the count in BI nimbula account.</li>
        <li id="li_wrap">Quota limit is 27.The total instance count row will get red when count is 25.</li>
        <li id="li_wrap">You shall delete any unused instance to prevent getting blacklisted.</li>
		<li id="li_wrap">Click RESTART to restart an instance.May take 10-25 minutes.</li>
		<li id="li_wrap">Click DELETE to delete an instance. Will delete all orchestrations bound to an instance.May take 5-10 mins.</li>
		
	</ul>
				
				</div>
				<div class="portlet-content" id="sysinfo">
				
	<table border="1" style="float: left" id="orch_table">
	<tbody id="orch_tbody">
	<tr style="background-color: #C6C6AA;"><td align="center"><b>Instance In BI Account</b></td><td align="center"><b>Status</b></td><td colspan="2" align="center"><b>Action</b></td></tr>
	<% if(count > 24) { %>
	<tr style="background-color: #FF7E7E;"><td colspan="4">Total instance count is: <b><%=count %></b></td></tr>
	<% } else {  %>
	<tr style="background-color: #7DDE7D;"><td colspan="4">Total instance count is: <b><%=count %></b></td></tr>
	<%
		}
		int index = 2;
		while(input.hasNextLine()) {
			 String line = input.nextLine();
			 System.out.println(line);
		     int fIndex = line.indexOf("\t");
		     //System.out.println(fIndex);
            //fIndex += 7;
            String fstr = "";
            String lstr = "";
            if(fIndex>-1){
           	 fstr = line.substring(0,fIndex).trim();
           	 lstr = line.substring(fIndex, line.length()).trim();
           	 
            }else{
           	 fstr=line;
           	 lstr="ready";
            }
            String actStatus=""; 
            ServletContext context = pageContext.getServletContext();
            //System.out.println(context.getAttributeNames().toString());
           // while (context.getAttributeNames().hasMoreElements()){
            	
            	//System.out.println(context.getAttributeNames().nextElement()); 
            	//} 
            try{
            	actStatus = context.getAttribute(fstr).toString();
            	
            }catch(Exception e){
            	System.out.println("no action in progress");
            }
            String buttonStatus="";
            String rowColor="";
            if(!actStatus.isEmpty()){
            	System.out.println("servlet status param is "+actStatus);
            	lstr=actStatus;
            	buttonStatus="disabled";
            	rowColor="yellow";
            }else if(lstr.trim().matches("stopping|starting")){
            	buttonStatus="disabled";
            	rowColor="yellow";
            }
            System.out.println("instance detail "+fstr+"  "+lstr+" "+buttonStatus);
            //+" "+buttonStatus);
            
            int lIndex = fIndex;     
	 %>
		<form method="post" id="<%=index%>" onsubmit="return newtestfunc('<%=fstr%>','<%=index%>',this.submited)">
		<tr id="<%=fstr %>" bgcolor=<%=rowColor %>>
		<td><%=fstr %><input type="hidden" name="orch_name" value="<%=fstr %>" /></td>
		<td> <script>statusFunc('<%=fstr%>','<%=index%>','<%=lstr%>')</script></td>
		<td><input type="submit" id="restart_orch_btn" value="Restart" onclick="this.form.submited=this.value;" <%=buttonStatus %> /></td>
		<td><input type="submit" id="stop_orch_btn" value="Delete" onclick="this.form.submited=this.value;" <%=buttonStatus %>/></td>
		</tr>
		</form>
	<% 
		index++;
		} %>
		</tbody>
	</table>
				</div>
			</div>
		</div>
	
		<div class="column">
		<b>Usage Summary charts</b>			
			<div class="portlet">
				<div class="portlet-content" id="sysinfo">			
				<div id="pie_chart_by_region_div" style="width: 600px; height: 300px;"></div>
				</div>
				
				<div class="portlet-content" id="sysinfo">			
				<div id="pie_chart_by_user_div" style="width: 600px; height: 300px;"></div>
				</div>
				
			</div>
			<div class="portlet">
				<div class="portlet-header"><b>Usage by region table</b></div>				
				<div class="portlet-content" id="sysinfo">							
				<table id="excelDataTable" border="1" width="500" align="right" style="background-color: #FAFAFA;">
  				</table>	
  									
				</div>
			</div>
			
		</div>
		
	
	</div>
		

	
</body>
</html>
