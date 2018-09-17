

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author pallavisingh
 */
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.apache.poi.hssf.usermodel.HeaderFooter.date;
@WebServlet(name="MarksServlet",urlPatterns={"/MarksServlet"})
public class MarksServlet extends HttpServlet{
    Connection con;
    // static String []m1;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Statement st,st1,st2,st3;
            ResultSet rs,res1;
            RequestDispatcher rd = request.getRequestDispatcher("dash.jsp");
            rd.include(request, response);
            Class.forName("com.mysql.jdbc.Driver");
            String eno=(String)request.getSession().getAttribute("eno");
            String join_year=eno.substring(7);
            String str="jdbc:mysql://localhost:3306/db_"+join_year;
            con=DriverManager.getConnection(str,"root","");
            st = (Statement)con.createStatement();
            st1 = (Statement)con.createStatement();
            st2 = (Statement)con.createStatement();
            st3 = (Statement)con.createStatement();
            PrintWriter pout=response.getWriter();
            Date date=new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            int year = cal.get(Calendar.YEAR);
            
            int jyear=Integer.parseInt(join_year);
            int num=year-jyear;
            int month = cal.get(Calendar.MONTH);
            int sem=0;
            if(month<6&&month>=0)
                sem=num*2;
            else
                sem=num*2+1;
            System.out.println("sem"+sem);
            String sql="select * from marks where Eno_num='"+eno+"' and semester='"+sem+"'";
            rs=st.executeQuery(sql);
            String department=eno.substring(5,7);
            String Course=eno.substring(3,5);
            out.println(eno);
            Integer marks=(Integer)request.getSession().getAttribute("count");
            out.println(marks);
            int count=marks;
            int start=0;
            String []m=request.getParameterValues("tnp");
            // m1=request.getParameterValues("tnp");
            String []subs=request.getParameterValues("subj");
            int total_subjects=count;
            int total_marks=0;
            int total_credits=0;
            int total_marks_credits=0;
            int backs_count=0;
            if(rs.next())
            {
                while(start<count)
                {
                    String sub_name=rs.getString("subject_name");
                    String sub_code=rs.getString("subject_code");
                    //out.println(str);
                    out.println(start+"start");
                    int m1=0;
                    out.println(m[start]);
                    out.println(m.length);
                    if(m[start].equals(""))
                    {
                        String t2="select * from db_"+join_year+".marks where subject_code='"+sub_code+"' and Eno_num='"+eno+"' and semester='"+sem+"' and programCode='"+Course+"' and branchCode='"+department+"'";
                        Statement stmt=con.createStatement();
                        ResultSet rs7=stmt.executeQuery(t2);
                        rs7.next();
                        m[start]=rs7.getString("marks");
                        m1=Integer.parseInt(m[start]);
                        out.println("empty str"+m1);
                    }
                    else if(!m[start].equals("Not Given"))
                    {
                        System.out.println("again");
                        m1=Integer.parseInt(m[start]);
                        System.out.println("m1 is int");
                    }
                    else
                    {
                        System.out.println(m1+"hhhhhlllllloooo");
                    }
                    out.println(m1);
                    out.println(subs[start]);
                    out.println(rs.getString("subject_name"));
                    String temp="select * from backs where Eno='"+eno+"' and sem='"+sem+"' and program_code='"+Course+"' and branch_code='"+department+"' and subject_code='"+sub_code+"'";
                    ResultSet r1=st2.executeQuery(temp);
                    if(r1.next())
                    {
                        if(m1<30)
                        {
                            backs_count++;
                        }
                        else
                        {
                            String delete1="DELETE FROM backs WHERE Eno='"+eno+"' and sem='"+sem+"' and subject_code='"+sub_code+"' and program_code='"+Course+"' and branch_code='"+department+"'";
                            System.out.println(delete1);
                            st2.execute(delete1);
                            System.out.println("aaasssss");
                        }
                        
                    }
                    else
                    {
                        if(m1<30)
                        {
                            backs_count++;
                            String insert1="INSERT INTO `backs`(`Eno`, `subject_code`, `program_code`, `branch_code`, `sem`) VALUES ('"+eno+"','"+sub_code+"','"+Course+"','"+department+"','"+sem+"')";
                            st2.execute(insert1);
                        }
                    }
                    System.out.println("ddddsssss");
                    String update="UPDATE `Marks` SET `marks`='"+m1+"' WHERE Eno_num='"+eno+"' and subject_name='"+subs[start]+"' and semester='"+sem+"'";
                    st1.executeUpdate(update);
                    String credits="select * from subjects where  Semester='"+sem+"'and Subject_name='"+subs[start]+"'";
                    res1=st1.executeQuery(credits);
                    res1.next();
                    String c=res1.getString("credits");
                    int credit=Integer.parseInt(c);
                    out.println(credit);
                    out.println(count);
                    total_credits+=credit;
                    total_marks+=m1;
                    total_marks_credits+=m1*credit;
                    out.println("ggg");
                    out.println(sub_code);
                    rs.next();
                    start++;
                }
                
            }
            else
            {
                String sub_name=rs.getString("subject_name");
                String sub_code=rs.getString("subject_code");
                int m1=Integer.parseInt(m[start]);
                
                if(m1<30)
                {
                    backs_count++;
                    String insert1="INSERT INTO `backs`(`Eno`, `subject_code`, `program_code`, `branch_code`, `sem`) VALUES ('"+eno+"','"+sub_code+"','"+Course+"','"+department+"','"+sem+"')";
                    System.out.println(insert1);
                    st2.execute(insert1);
                    
                }
                String update="UPDATE `marks` SET `marks`='"+m1+"' WHERE Eno_num='"+eno+"' and subject_name='"+subs[start]+"'";
                st1.executeUpdate(update);
                String credits="select * from subjects where  Semester='"+sem+"'and  Subject_name='"+subs[start]+"'";
                res1=st1.executeQuery(credits);
                res1.next();
                String c=res1.getString("credits");
                int credit=Integer.parseInt(c);
                out.println(credit);
                out.println(count);
                total_credits+=credit;
                out.println(m1);
                total_marks+=m1;
                total_marks_credits+=m1*credit;
            }
            out.println("eee");
            float percentage=total_marks/total_subjects;
            float percentage_credits=total_marks_credits/total_credits;
            System.out.println("ss"+sem);
            String sql2="select * from result where enrollment_number='"+eno+"' and semester='"+sem+"'";
            ResultSet rs3=st1.executeQuery(sql2);
            int i=sem-1;
            int dead_backs=0;
            int active_backs=0;
            int active_backs1=0;
            String temp1="select * from result where semester='"+i+"' and enrollment_number='"+eno+"'";
            ResultSet r2=st2.executeQuery(temp1);
            r2.next();
            String temp2="select * from result where semester='"+sem+"' and enrollment_number='"+eno+"'";
            System.out.println(temp1+" "+temp2);
            ResultSet r3=st3.executeQuery(temp2);
            String dead;
            String active;
            if(!r3.next())
            {
                dead=r2.getString("Dead_Backs");
                active=r2.getString("Active_Backs");
                dead_backs=Integer.parseInt(dead);
                active_backs=Integer.parseInt(active);
                System.out.println("entered");
            }
            else
            {
                dead=r3.getString("Dead_Backs");
                active=r3.getString("Active_Backs");
                dead_backs=Integer.parseInt(dead);
                System.out.println(dead_backs);
                active_backs=Integer.parseInt(active);
                System.out.println("ne");
            }
            active_backs1=Integer.parseInt(r2.getString("Active_Backs"));
            out.println(active_backs1);
            active_backs1+=backs_count;
            if(active_backs!=0)
            {
                System.out.println("if"+active_backs);
                String prev_active=r2.getString("Active_Backs");
                int prev_abk=Integer.parseInt(prev_active);
                if(prev_abk!=0)
                {
                    String []back_marks=request.getParameterValues("back");
                    String []back_subj=request.getParameterValues("back_subj");
                    int len=back_marks.length;
                    System.out.println(len+"llll");
                    for(int k=0;k<len;k++)
                    {
                        String tp=back_marks[k];
                        System.out.println(tp+"kkkkk");
                        int back_ms=Integer.parseInt(tp);
                        
                        Statement st4=(Statement)con.createStatement();
                        String update="UPDATE `marks` SET `marks`='"+back_ms+"' WHERE Eno_num='"+eno+"' and subject_code='"+back_subj[k]+"' and programCode='"+Course+"' and branchCode='"+department+"'";
                        st4.executeUpdate(update);
                        System.out.println(update);
                        
                        if(back_ms>30)
                        {
                            System.out.println("delete");
                            Statement st5=(Statement)con.createStatement();
                            String delete2="DELETE FROM backs WHERE Eno='"+eno+"'  and subject_code='"+back_subj[k]+"' and program_code='"+Course+"' and branch_code='"+department+"'";
                            out.println(delete2);
                            st5.execute(delete2);
                            dead_backs++;
                            out.println(active_backs);
                            out.println(dead_backs);
                        }
                    }
                }
                
            }
            active_backs=active_backs1-dead_backs;
            System.out.println(active_backs);
            if(rs3.next())
            {
                String result="UPDATE `result` SET `total_marks`='"+total_marks+"',`total_marks_credits`='"+total_marks_credits+"',`total_credits`='"+total_credits+"',`percentage`='"+percentage+"',`percentage_credits`='"+percentage_credits+"',Active_Backs='"+active_backs+"',Dead_Backs='"+dead_backs+"' WHERE `enrollment_number`='"+eno+"' and semester='"+sem+"'";
                System.out.println(result);
                st1.execute(result);
                
            }
            else
            {
                String result="INSERT INTO `result`(`enrollment_number`, `total_marks`, `total_marks_credits`, `total_credits`, `percentage`, `percentage_credits`, `semester`,`Dead_Backs`, `Active_Backs`) VALUES('"+eno+"','"+total_marks+"','"+total_marks_credits+"','"+total_credits+"','"+percentage+"','"+percentage_credits+"','"+sem+"','"+dead_backs+"','"+active_backs+"')";
                System.out.println(result);
                st1.execute(result);
            }
            out.println("marks added successfully");
            
            pout.println("<center><h3>marks added successfully</h3></center>");
            
        }
        catch(Exception e){
            out.println("error..... <br>"+e);
        }
        
    }
}
