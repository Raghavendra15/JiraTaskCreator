package JiraParser;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
/**
 * Created by raghss on 5/14/2016.
 */
public class Jira_Integrator extends javax.servlet.http.HttpServlet {

    public Jira_Integrator() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       /* String ReqAssignee = request.getParameter("assignee");

        String project=request.getParameter("project");
        String issueType=request.getParameter("issueType");
        String summary=request.getParameter("summary");
        String description = request.getParameter("description");
        String priority=request.getParameter("priority");
       */ PrintWriter out = response.getWriter();


        out.println("Please wait while we process your request ! ");
        // Process ps1 = Runtime.getRuntime().exec(new String[] {"java -jar C:\\Users\\raghss.ORADEV\\jiraintegration.jar create -project \"BICSQA\" -issueType \"Task\" -summary \"Backlog:Test Java JIRA from Servlet\" -assignee \"raghavendra.s.s.s@oracle.com\" -description \"Based on Dev 12c\"  -priority 1 "});
        //ps.redirectErrorStream(true);



       ServletContext context = getServletContext();

        String jarpath = context.getRealPath("/WEB-INF/lib/jiraintegration.jar");

        out.println("jarpath"+jarpath);

        String project=request.getParameter("project");
        out.println(project);
        String issueType =request.getParameter("issueType");
        out.println(issueType);
        String summary =request.getParameter("summary");
        out.println(summary);
        String assignee=request.getParameter("assignee");
        out.println(assignee);
        String description=request.getParameter("description");
        out.println(description);
        String priority=request.getParameter("priority");
        out.println(priority);

        /*ProcessBuilder ps= new ProcessBuilder("java","-jar", jarpath,"create","-project", project,"-issueType", issueType,  "-summary", summary, "-assignee",assignee,"-description",description,"-priority",priority );

        ps.redirectErrorStream(true);

        Process pr = ps.start();
        */
        //ProcessBuilder pb = new ProcessBuilder(jarpath, "-jar", "parma01 parma02");
       if(assignee==null || assignee.isEmpty()) {
             ProcessBuilder ps= new ProcessBuilder("java","-jar", jarpath,"create","-project", project,"-issueType", issueType,  "-summary", summary, "-assignee","raghavendra.s.s.s@oracle.com","-description",description,"-priority",priority );

        ps.redirectErrorStream(true);

        Process pr = ps.start();

        }else{
           ProcessBuilder ps= new ProcessBuilder("java","-jar", jarpath,"create","-project", project,"-issueType", issueType,  "-summary", summary, "-assignee",assignee,"-description",description,"-priority",priority );

           ps.redirectErrorStream(true);

           Process pr = ps.start();

       }
        //Process ps1  = Runtime.getRuntime().exec(new String[] {"java -jar C:\\Users\\raghss.ORADEV\\IdeaProjects\\JiraUI_WebApp\\out\\artifacts\\JiraUI_WebApp_war_exploded\\WEB-INF\\lib\\jiraintegration.jar create -project \"BICSQA\" -issueType \"Task\" -summary \"Backlog:Test Java JIRA from Servlet\" -assignee \"raghavendra.s.s.s@oracle.com\" -description \"Based on Dev 12c\"  -priority 1 "});
        out.println("<html>");
        out.println("Project is    " + request.getParameter("project")+"\n");
        out.println("issueType is  " + request.getParameter("issueType")+"\n");
        out.println("Assigned to : " + request.getParameter("assignee")+"\n");
        out.println("Summary is    " + request.getParameter("summary")+"\n");
        out.println("Description is  : " + request.getParameter("description")+"\n");
        out.println("Priority is   " + request.getParameter("priority")+"\n");
        out.println("</html>");

        // Process pr = ps.start();

//request.getRequestDispatcher("https://jira.oraclecorp.com").forward(request,response);
    }
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
      this.processRequest(request, response);

         response.sendRedirect("https://jira.oraclecorp.com");
    }
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        this.processRequest(request, response);
    }
}

