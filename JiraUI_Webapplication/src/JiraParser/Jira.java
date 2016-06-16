package JiraParser; /**
 * Created by raghss on 5/14/2016.
 */

import java.io.*;

/**
 * Created by raghss on 5/13/2016.
 */
public class Jira {



    private String project;
    private String issueType;
    private String summary;

    private String assignee;
    private String description;
    private String priority;

    public Jira(String project, String issueType, String summary, String assignee, String description, String priority) {
        this.project = project;
        this.issueType = issueType;
        this.summary = summary;
        this.assignee = assignee;
        this.description = description;
        this.priority = priority;
    }

    public static void main(String[] args) throws IOException, InterruptedException {
        Jira jira = new Jira("BICS", "Test", "Test creation 10000884", "raghavendra.s.s.s@oracle.com", "Demo", "4");
        ProcessBuilder ps = new ProcessBuilder("java", "-jar", "C:\\Users\\raghss.ORADEV\\jiraintegration.jar", "create", "-project", jira.project, "-issueType", jira.issueType, "-summary", jira.summary, "-assignee", jira.assignee, "-description", jira.description, "-priority", jira.priority);
                /*"-project BICSQA (mandatory - always BICSQA, no parameter passed)",
                "-issueType Task (pass parameter, epic, story, task, test)",
                "-summary  Backlog:Test 12c SAC Installed and running OOTB(blank param by default, but mandatory entry req)",
                "-assignee andrew.new@oracle.com", "(unassigned by default, otherwise pick owner from list)",
                "-description", "Based on Dev getting SAC working with 12c, behaviour will be to test to make sure everything works and then enable the tests" , "(blank param by default, but mandatory entry req)",
                "-priority 1 (pass param - 1, 2, 3, 4)");
*/

//standard output and error output of a subprocess are sent to two
//separate streams
        //Process ps = Runtime.getRuntime().exec("java -jar C:\\Users\\raghss.ORADEV\\jiraintegration.jar create -project \"BICSQA\" -issueType \"Task\" -summary \"Backlog:Test Java JIRA JAR OOTB\" -assignee \"andrew.new@oracle.com\" -description \"Based on Dev getting SAC working with 12c, behaviour will be to test to make sure everything works and then enable the tests\"  -priority 1 ");
        // ProcessBuilder ps = new ProcessBuilder("java", "-jar", "C:\\Users\\raghss.ORADEV\\jiraintegration.jar", "create", "-project","Dummy 123", "-issueType", "Task", "-summary","Dummy1234","-assignee","raghavendra.s.s.s@oracle.com", "-description", "Description", "-priority","1");

        ps.redirectErrorStream(true);

        Process pr = ps.start();
        BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream()));
        String line;
        while ((line = in.readLine()) != null) {
            System.out.println(line);
        }
        pr.waitFor();
        System.out.println("Working Ok!");

        in.close();
        System.exit(0);


    }
}

