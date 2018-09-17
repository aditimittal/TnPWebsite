<%-- 
    Document   : Download_placementDB
    Created on : Feb 20, 2018, 1:21:14 AM
    Author     : pallavisingh
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
    <body>
        <%! String id; %>
        <%! String company_name; %>
        <%ServletOutputStream servletOutputStream ;
        try{
              Connection con;
            Statement st1;
            String year_db = request.getParameter("year_db");
            Class.forName("com.mysql.jdbc.Driver");
            String str="jdbc:mysql://localhost:3306/db_"+year_db;
            con=DriverManager.getConnection(str,"root","");
            st1 = (Statement)con.createStatement();
        String company_for = request.getParameter("company_for");
        id = request.getParameter("id");
                            System.out.println("placement");
                System.out.println(company_for+" ");
                String log_sql = "Select *from company_details where company_id="+id;
                System.out.println(log_sql);
                                    System.out.println("dwdgdh");
                    System.out.println("111111");

        ResultSet res7 = st1.executeQuery(log_sql);
                            System.out.println("mmccvvvvvvvvvvvvv");

                while (res7.next()){
                    System.out.println("hhhhh");
            company_name = res7.getString("company_name");
        }
                String fileName;
                System.out.println(company_name);
                    fileName=company_for+"_placement_database.xlsx";
                // for writing into xsl file
            //Blank workbook
            XSSFWorkbook workbook = new XSSFWorkbook();            
            //Create a blank sheet
            XSSFSheet sheet = workbook.createSheet(company_for+" Student Data");
            System.out.println(year_db+"nmcnmnmcnmncm");
           
            String str2="select count(Enrollment_number) from placementrecord";
            ResultSet rs2=st1.executeQuery(str2);
            rs2.next();
            System.out.println(str2);
            String c=rs2.getString("count(Enrollment_number)");
            System.out.println(c);
            int count=Integer.parseInt(c);
            int k=0;
            Row row0 = sheet.createRow(0);
                Cell cell0;
                cell0 = row0.createCell(k);
                cell0.setCellValue("Enrollment_number");
                cell0 = row0.createCell(k++);
                cell0.setCellValue("company_Name");
                cell0 = row0.createCell(k++);
                cell0.setCellValue("profile_offered");
                cell0= row0.createCell(k++);
                cell0.setCellValue("type");
                cell0= row0.createCell(k++);
                cell0.setCellValue("year");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Programme_Code");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Branch_Code");
                cell0 = row0.createCell(k++);
                cell0.setCellValue("First_Name");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Last_Name");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Aadhar_Number");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Category");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Temp_Address");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Permanent_Address");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Alt_Email_id");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Father_Name");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Father_Occupation");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Father_Office_Address");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Father_Contact_Number");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Mother_Name");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Mother_Occupation");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Mother_Office_Address");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Mother_Contact_Number");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Class_X_School");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Class_X_Passing_Year");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Class_XII_or_Diploma");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Class_XII_Board");
                cell0= row0.createCell(k++);
                cell0.setCellValue("Class_XII_School");
                int i=1;
                int j=0;
            while(j<count)
            {
                String str1="select * from placementrecord where company_id='"+id+"'";
                ResultSet rs1=st1.executeQuery(str1);
                System.out.println(str1);
                rs1.next();
                int cellAfter = 0;
                System.out.println(rs1.getString("company_id"));
                String type=rs1.getString("type");
                if(type.equals(company_for))
                {
                    Row row = sheet.createRow(i);
                    Cell cell;
                     k=0;
                    cell = row.createCell(k);
                    String eroll=rs1.getString("Enrollment_number");
                    String batch=rs1.getString("year");
                    cell.setCellValue(eroll);
                    cell = row.createCell(k++);
                    cell.setCellValue(company_name);
                    cell = row.createCell(k++);
                    cell.setCellValue(rs1.getString("profile_offered"));
                    cell = row.createCell(k++);
                    cell.setCellValue(type);
                    cell = row.createCell(k++);
                    cell.setCellValue(batch);
                    String p_code=rs1.getString("Programme_Code");
                    String b_code=rs1.getString("Branch_Code");
                    String s="select * from programme_codes where Programme_Code='"+p_code+"'";
                    ResultSet rs4=st1.executeQuery(s);
                    rs4.next();
                    System.out.println(s);
                    cell = row.createCell(k++);
                    System.out.println(rs4.getString("Programme_Name"));
                    cell.setCellValue(rs4.getString("Programme_Name"));
                    s="select * from branch_codes where Branch_Code='"+b_code+"' and Programme_Name='"+rs4.getString("Programme_Name")+"'";
                    System.out.println(s);                    
                    ResultSet rs5=st1.executeQuery(s);
                    rs5.next();
                    cell = row.createCell(k++);
                    cell.setCellValue(rs5.getString("Branch_Name"));
                    System.out.println(s);
                    String query="select * from db_"+batch+".personal_details where Enrollment_Number='"+eroll+"'";
                    System.out.println(query);
                    ResultSet rs3=st1.executeQuery(query);
                    rs3.next();
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("First_Name"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Last_Name"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Aadhar_Number"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Category"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Temp_Address"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Permanent_Address"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Alt_Email_id"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Father_Name"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Father_Occupation"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Father_Office_Address"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Father_Contact_Number"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Mother_Name"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Mother_Occupation"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Mother_Office_Address"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Mother_Contact_Number"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Class_X_School"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Class_X_Passing_Year"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Class_XII_or_Diploma"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Class_XII_Board"));
                    cell = row.createCell(k++);
                    cell.setCellValue(rs3.getString("Class_XII_School"));
                    i++;
                    j++;
                }
            }
            response.reset();
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment; filename="+fileName);
            System.out.println("nahi");
            workbook.write(response.getOutputStream());
            System.out.println("thik");
            response.getOutputStream().flush();
            response.getOutputStream().close();
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        %>
    </body>
</html>
