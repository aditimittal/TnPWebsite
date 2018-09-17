package DATABASE_FETCH;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet("/exportServlet")
public class exportServlet extends HttpServlet
{    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, IllegalAccessException 
    { 
        response.setContentType("text/html;charset=UTF-8");
        
        String format = request.getParameter("format"),
               programme_code = request.getParameter("programmes").split("-")[0],
               programme_name = request.getParameter("programmes").split("-")[1],
               branch_code = request.getParameter("branches").split("-")[0],
               branch_name = request.getParameter("branches").split("-")[1],
               year = request.getParameter("year");
        
        String sheetName = programme_name+"_"+branch_name;
        String[] selectedStudentIds1 = request.getParameterValues("cbinner1");        
        String[] selectedStudentIds2UnderGrad = request.getParameterValues("cbinner1i");  
        String[] selectedStudentIds2PostGrad = request.getParameterValues("cbinner1ii");        
        String[] selectedStudentIds3 = request.getParameterValues("cbinner2");
        
        if(format.equalsIgnoreCase("Excel sheet"))
        {    
            String fileName= sheetName+"_Student_Data.xlsx";      
        
            //Blank workbook
            XSSFWorkbook workbook = new XSSFWorkbook();            
            //Create a blank sheet
            XSSFSheet sheet = workbook.createSheet(sheetName+" Student Data");
            
            FetchDetailsDAO pdd = new FetchDetailsDAO();
            
            Map<String, PersonalDetailsPOJO> resultPersonalDetails = pdd.getStudentALLDetails(programme_code, branch_code, Integer.parseInt(year));
            Map<String, EducationalPOJO> resultEducationalDetails = null;
            Map<String, UnderGradPOJO> resultUnderGradDetails = null;
            Map<String, PostGradPOJO> resultPostGradDetails = null;
            
            if(selectedStudentIds3!=null)
                resultEducationalDetails = pdd.getStudentALLEducationalDetails(programme_code, branch_code, Integer.parseInt(year));
            
            if(selectedStudentIds2UnderGrad!=null)
                resultUnderGradDetails = pdd.getStudentALLUnderGradDetails(programme_code, branch_code, Integer.parseInt(year));
            
            if(selectedStudentIds2PostGrad!=null)
                resultPostGradDetails = pdd.getStudentALLPostGradDetails(programme_code, branch_code, Integer.parseInt(year));
            
            int sno = 1, rownum = 0, skipUnderGrad = 0, skipPostGrad = 0, cellAfter = 0;             
            Row row = sheet.createRow(rownum++);  
            for(String PersonalDetails : selectedStudentIds1)
            {
                Cell cell;
                cell = row.createCell(cellAfter++);
                cell.setCellValue(PersonalDetails);
            }
            
            if(selectedStudentIds2UnderGrad!=null)
            {
                for(String underGrad : selectedStudentIds2UnderGrad)
                {
                    Cell cell;
                    cell = row.createCell(cellAfter++);
                    cell.setCellValue(underGrad);
                    skipUnderGrad++;
                }
            }
            else if(selectedStudentIds2PostGrad!=null)
            {
                for(String postGrad : selectedStudentIds2PostGrad)
                {
                    Cell cell;
                    cell = row.createCell(cellAfter++);
                    cell.setCellValue(postGrad);
                    skipPostGrad++;
                }
            }
            
            if(selectedStudentIds3!=null)
            {
                for(String Edu : selectedStudentIds3)
                {
                    Cell cell;
                    cell = row.createCell(cellAfter++);
                    cell.setCellValue(Edu);
                }
            }
            
            for(Map.Entry<String, PersonalDetailsPOJO> m: resultPersonalDetails.entrySet())
            {              
                row = sheet.createRow(rownum++);  
                cellAfter = 0;                
                
                String Enrollment_Number = m.getKey();
                PersonalDetailsPOJO us = m.getValue();
                
                for(String col: selectedStudentIds1)
                    cellAfter = IterateUStudentPOJO(us, row, cellAfter, col);
                
                if(selectedStudentIds2UnderGrad!=null&&resultUnderGradDetails.containsKey(Enrollment_Number))
                {                    
                    UnderGradPOJO underGrad = resultUnderGradDetails.get(Enrollment_Number);
                    for(String col: selectedStudentIds2UnderGrad)
                    {
                        cellAfter = IterateUnderGradStudentPOJO(underGrad, row, cellAfter, col);
                    }
                }
                else if(selectedStudentIds2PostGrad!=null&&resultEducationalDetails.containsKey(Enrollment_Number))
                {                    
                    PostGradPOJO postGrad = resultPostGradDetails.get(Enrollment_Number);
                    for(String col: selectedStudentIds2PostGrad)
                    {
                        cellAfter = IteratePostGradStudentPOJO(postGrad, row, cellAfter, col);
                    }
                }
                else if(selectedStudentIds2UnderGrad!=null)
                    cellAfter+=skipUnderGrad;
                else
                    cellAfter+=skipPostGrad;
                
                if(selectedStudentIds3!=null&&resultEducationalDetails.containsKey(Enrollment_Number))
                {                    
                    EducationalPOJO edu = resultEducationalDetails.get(Enrollment_Number);
                    for(String col: selectedStudentIds3)
                    {
                        cellAfter = IterateEDUStudentPOJO(edu, row, cellAfter, col);
                    }
                }     
                
                sno++;
                System.out.println(sno+" "+us.getFirst_Name()+" "+us.getEnrollment_Number()+" "+cellAfter);
            }
        
            //Write the workbook in file system
            response.reset();
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment; filename="+fileName);
            workbook.write(response.getOutputStream()); 
        }
    }
    
    private int IterateEDUStudentPOJO(EducationalPOJO edu, Row row, int cellnum, String col) 
    {            
        Cell cell;
        if(col.equals("Total_Marks_Sem_1"))
        {
            int Total_Marks_Sem_1 = edu.getTotal_Marks_Sem_1();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_Sem_1);
            return cellnum;
        }
        else if(col.equals("Total_Marks_With_Credit_Sem_1"))
        {
            int Total_Marks_With_Credit_Sem_1 = edu.getTotal_Marks_With_Credit_Sem_1();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_With_Credit_Sem_1);
            return cellnum;
        }
        else if(col.equals("Credits_Obtained_Sem_1"))
        {
            int Credits_Obtained_Sem_1 = edu.getCredits_Obtained_Sem_1();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Credits_Obtained_Sem_1);
            return cellnum;
        }
        else if(col.equals("Percentage_Sem_1"))
        {
            float Percentage_Sem_1 = edu.getPercentage_Sem_1();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percentage_Sem_1);
            return cellnum;
        }
        else if(col.equals("Percenatge_With_Credit_Sem_1"))
        {
            float Percenatge_With_Credit_Sem_1 = edu.getPercenatge_With_Credit_Sem_1();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percenatge_With_Credit_Sem_1);
            return cellnum;
        }
        else if(col.equals("Total_Marks_Sem_2"))
        {
            int Total_Marks_Sem_2 = edu.getTotal_Marks_Sem_2();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_Sem_2);
            return cellnum;
        }
        else if(col.equals("Total_Marks_With_Credit_Sem_2"))
        {
            int Total_Marks_With_Credit_Sem_2 = edu.getTotal_Marks_With_Credit_Sem_2();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_With_Credit_Sem_2);
            return cellnum;
        }
        else if(col.equals("Credits_Obtained_Sem_2"))
        {
            int Credits_Obtained_Sem_2 = edu.getCredits_Obtained_Sem_2();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Credits_Obtained_Sem_2);
            return cellnum;
        }
        else if(col.equals("Percentage_Sem_2"))
        {
            float Percentage_Sem_2 = edu.getPercentage_Sem_2();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percentage_Sem_2);
            return cellnum;
        }
        else if(col.equals("Percenatge_With_Credit_Sem_2"))
        {
            float Percenatge_With_Credit_Sem_2 = edu.getPercenatge_With_Credit_Sem_2();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percenatge_With_Credit_Sem_2);
            return cellnum;
        }
        else if(col.equals("Total_Marks_Sem_3"))
        {
            int Total_Marks_Sem_3 = edu.getTotal_Marks_Sem_3();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_Sem_3);
            return cellnum;
        }
        else if(col.equals("Total_Marks_With_Credit_Sem_3"))
        {
            int Total_Marks_With_Credit_Sem_3 = edu.getTotal_Marks_With_Credit_Sem_3();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_With_Credit_Sem_3);
            return cellnum;
        }
        else if(col.equals("Credits_Obtained_Sem_3"))
        {
            int Credits_Obtained_Sem_3 = edu.getCredits_Obtained_Sem_3();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Credits_Obtained_Sem_3);
            return cellnum;
        }
        else if(col.equals("Percentage_Sem_3"))
        {
            float Percentage_Sem_3 = edu.getPercentage_Sem_3();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percentage_Sem_3);
            return cellnum;
        }
        else if(col.equals("Percenatge_With_Credit_Sem_3"))
        {
            float Percenatge_With_Credit_Sem_3 = edu.getPercenatge_With_Credit_Sem_3();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percenatge_With_Credit_Sem_3);
            return cellnum;
        }
        else if(col.equals("Total_Marks_Sem_4"))
        {
            int Total_Marks_Sem_4 = edu.getTotal_Marks_Sem_4();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_Sem_4);
            return cellnum;
        }
        else if(col.equals("Total_Marks_With_Credit_Sem_4"))
        {
            int Total_Marks_With_Credit_Sem_4 = edu.getTotal_Marks_With_Credit_Sem_4();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_With_Credit_Sem_4);
            return cellnum;
        }
        else if(col.equals("Credits_Obtained_Sem_4"))
        {
            int Credits_Obtained_Sem_4 = edu.getCredits_Obtained_Sem_4();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Credits_Obtained_Sem_4);
            return cellnum;
        }
        else if(col.equals("Percentage_Sem_4"))
        {
            float Percentage_Sem_4 = edu.getPercentage_Sem_4();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percentage_Sem_4);
            return cellnum;
        }
        else if(col.equals("Percenatge_With_Credit_Sem_4"))
        {
            float Percenatge_With_Credit_Sem_4 = edu.getPercenatge_With_Credit_Sem_4();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percenatge_With_Credit_Sem_4);
            return cellnum;
        }
        else if(col.equals("Total_Marks_Sem_5"))
        {
            int Total_Marks_Sem_5 = edu.getTotal_Marks_Sem_5();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_Sem_5);
            return cellnum;
        }
        else if(col.equals("Total_Marks_With_Credit_Sem_5"))
        {
            int Total_Marks_With_Credit_Sem_5 = edu.getTotal_Marks_With_Credit_Sem_5();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_With_Credit_Sem_5);
            return cellnum;
        }
        else if(col.equals("Credits_Obtained_Sem_5"))
        {
            int Credits_Obtained_Sem_5 = edu.getCredits_Obtained_Sem_5();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Credits_Obtained_Sem_5);
            return cellnum;
        }
        else if(col.equals("Percentage_Sem_5"))
        {
            float Percentage_Sem_5 = edu.getPercentage_Sem_5();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percentage_Sem_5);
            return cellnum;
        }
        else if(col.equals("Percenatge_With_Credit_Sem_5"))
        {
            float Percenatge_With_Credit_Sem_5 = edu.getPercenatge_With_Credit_Sem_5();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percenatge_With_Credit_Sem_5);
            return cellnum;
        }
        else if(col.equals("Total_Marks_Sem_6"))
        {
            int Total_Marks_Sem_6 = edu.getTotal_Marks_Sem_6();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_Sem_6);
            return cellnum;
        }
        else if(col.equals("Total_Marks_With_Credit_Sem_6"))
        {
            int Total_Marks_With_Credit_Sem_6 = edu.getTotal_Marks_With_Credit_Sem_6();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_With_Credit_Sem_6);
            return cellnum;
        }
        else if(col.equals("Credits_Obtained_Sem_6"))
        {
            int Credits_Obtained_Sem_6 = edu.getCredits_Obtained_Sem_6();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Credits_Obtained_Sem_6);
            return cellnum;
        }
        else if(col.equals("Percentage_Sem_6"))
        {
            float Percentage_Sem_6 = edu.getPercentage_Sem_6();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percentage_Sem_6);
            return cellnum;
        }
        else if(col.equals("Percenatge_With_Credit_Sem_6"))
        {
            float Percenatge_With_Credit_Sem_6 = edu.getPercenatge_With_Credit_Sem_6();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percenatge_With_Credit_Sem_6);
            return cellnum;
        }
        else if(col.equals("Total_Marks_Sem_7"))
        {
            int Total_Marks_Sem_7 = edu.getTotal_Marks_Sem_7();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_Sem_7);
            return cellnum;
        }
        else if(col.equals("Total_Marks_With_Credit_Sem_7"))
        {
            int Total_Marks_With_Credit_Sem_7 = edu.getTotal_Marks_With_Credit_Sem_7();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_With_Credit_Sem_7);
            return cellnum;
        }
        else if(col.equals("Credits_Obtained_Sem_7"))
        {
            int Credits_Obtained_Sem_7 = edu.getCredits_Obtained_Sem_7();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Credits_Obtained_Sem_7);
            return cellnum;
        }
        else if(col.equals("Percentage_Sem_7"))
        {
            float Percentage_Sem_7 = edu.getPercentage_Sem_7();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percentage_Sem_7);
            return cellnum;
        }
        else if(col.equals("Percenatge_With_Credit_Sem_7"))
        {
            float Percenatge_With_Credit_Sem_7 = edu.getPercenatge_With_Credit_Sem_7();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percenatge_With_Credit_Sem_7);
            return cellnum;
        }
        else if(col.equals("Total_Marks_Sem_8"))
        {
            int Total_Marks_Sem_8 = edu.getTotal_Marks_Sem_8();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_Sem_8);
            return cellnum;
        }
        else if(col.equals("Total_Marks_With_Credit_Sem_8"))
        {
            int Total_Marks_With_Credit_Sem_8 = edu.getTotal_Marks_With_Credit_Sem_8();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_With_Credit_Sem_8);
            return cellnum;
        }
        else if(col.equals("Credits_Obtained_Sem_8"))
        {
            int Credits_Obtained_Sem_8 = edu.getCredits_Obtained_Sem_8();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Credits_Obtained_Sem_8);
            return cellnum;
        }
        else if(col.equals("Percentage_Sem_8"))
        {
            float Percentage_Sem_8 = edu.getPercentage_Sem_8();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percentage_Sem_8);
            return cellnum;
        }
        else if(col.equals("Percenatge_With_Credit_Sem_8"))
        {
            float Percenatge_With_Credit_Sem_8 = edu.getPercenatge_With_Credit_Sem_8();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percenatge_With_Credit_Sem_8);
            return cellnum;
        }
        else if(col.equals("Total_Marks_Sem_9"))
        {
            int Total_Marks_Sem_9 = edu.getTotal_Marks_Sem_9();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_Sem_9);
            return cellnum;
        }
        else if(col.equals("Total_Marks_With_Credit_Sem_9"))
        {
            int Total_Marks_With_Credit_Sem_9 = edu.getTotal_Marks_With_Credit_Sem_9();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_With_Credit_Sem_9);
            return cellnum;
        }
        else if(col.equals("Credits_Obtained_Sem_9"))
        {
            int Credits_Obtained_Sem_9 = edu.getCredits_Obtained_Sem_9();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Credits_Obtained_Sem_9);
            return cellnum;
        }
        else if(col.equals("Percentage_Sem_9"))
        {
            float Percentage_Sem_9 = edu.getPercentage_Sem_9();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percentage_Sem_9);
            return cellnum;
        }
        else if(col.equals("Percenatge_With_Credit_Sem_9"))
        {
            float Percenatge_With_Credit_Sem_9 = edu.getPercenatge_With_Credit_Sem_9();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percenatge_With_Credit_Sem_9);
            return cellnum;
        }
        else if(col.equals("Total_Marks_Sem_10"))
        {
            int Total_Marks_Sem_10 = edu.getTotal_Marks_Sem_10();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_Sem_10);
            return cellnum;
        }
        else if(col.equals("Total_Marks_With_Credit_Sem_10"))
        {
            int Total_Marks_With_Credit_Sem_10 = edu.getTotal_Marks_With_Credit_Sem_10();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_With_Credit_Sem_10);
            return cellnum;
        }
        else if(col.equals("Credits_Obtained_Sem_10"))
        {
            int Credits_Obtained_Sem_10 = edu.getCredits_Obtained_Sem_10();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Credits_Obtained_Sem_10);
            return cellnum;
        }
        else if(col.equals("Percentage_Sem_10"))
        {
            float Percentage_Sem_10 = edu.getPercentage_Sem_10();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percentage_Sem_10);
            return cellnum;
        }
        else if(col.equals("Percenatge_With_Credit_Sem_10"))
        {
            float Percenatge_With_Credit_Sem_10 = edu.getPercenatge_With_Credit_Sem_10();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percenatge_With_Credit_Sem_10);
            return cellnum;
        }
        else if(col.equals("Total_Marks_Sem_11"))
        {
            int Total_Marks_Sem_11 = edu.getTotal_Marks_Sem_11();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_Sem_11);
            return cellnum;
        }
        else if(col.equals("Total_Marks_With_Credit_Sem_11"))
        {
            int Total_Marks_With_Credit_Sem_11 = edu.getTotal_Marks_With_Credit_Sem_11();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_With_Credit_Sem_11);
            return cellnum;
        }
        else if(col.equals("Credits_Obtained_Sem_11"))
        {
            int Credits_Obtained_Sem_11 = edu.getCredits_Obtained_Sem_11();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Credits_Obtained_Sem_11);
            return cellnum;
        }
        else if(col.equals("Percentage_Sem_11"))
        {
            float Percentage_Sem_11 = edu.getPercentage_Sem_11();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percentage_Sem_11);
            return cellnum;
        }
        else if(col.equals("Percenatge_With_Credit_Sem_11"))
        {
            float Percenatge_With_Credit_Sem_11 = edu.getPercenatge_With_Credit_Sem_11();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percenatge_With_Credit_Sem_11);
            return cellnum;
        }
        else if(col.equals("Total_Marks_Sem_12"))
        {
            int Total_Marks_Sem_12 = edu.getTotal_Marks_Sem_12();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_Sem_12);
            return cellnum;
        }
        else if(col.equals("Total_Marks_With_Credit_Sem_12"))
        {
            int Total_Marks_With_Credit_Sem_12 = edu.getTotal_Marks_With_Credit_Sem_12();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Total_Marks_With_Credit_Sem_12);
            return cellnum;
        }
        else if(col.equals("Credits_Obtained_Sem_12"))
        {
            int Credits_Obtained_Sem_12 = edu.getCredits_Obtained_Sem_12();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Credits_Obtained_Sem_12);
            return cellnum;
        }
        else if(col.equals("Percentage_Sem_12"))
        {
            float Percentage_Sem_12 = edu.getPercentage_Sem_12();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percentage_Sem_12);
            return cellnum;
        }
        else if(col.equals("Percenatge_With_Credit_Sem_12"))
        {
            float Percenatge_With_Credit_Sem_12 = edu.getPercenatge_With_Credit_Sem_12();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Percenatge_With_Credit_Sem_12);
            return cellnum;
        }
        else 
            return cellnum; 
    }
    
    private int IterateUStudentPOJO(PersonalDetailsPOJO objArr, Row row, int cellnum, String col) 
    {
        Cell cell;
        if(col.equals("Enrollment_Number"))
        {
            String Enrollment_Number = objArr.getEnrollment_Number();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Enrollment_Number);
            return cellnum;
        }
        else if(col.equals("First_Name"))
        {
            String First_Name = objArr.getFirst_Name();
            cell = row.createCell(cellnum++);
            cell.setCellValue(First_Name);
            return cellnum;
        }
        else if(col.equals("Last_Name"))
        {
            String Last_Name = objArr.getLast_Name();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Last_Name);
            return cellnum;
        }
        else if(col.equals("Aadhar_Number"))
        {
            long Aadhar_Number = objArr.getAadhar_Number();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Aadhar_Number);
            return cellnum;
        }
        else if(col.equals("Category"))
        {
            String Category = objArr.getCategory();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Category);
            return cellnum;
        }
        else if(col.equals("Temp_Address"))
        {
            String Temp_Address = objArr.getTemp_Address();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Temp_Address);
            return cellnum;
        }
        else if(col.equals("Permanent_Address"))
        {
            String Permanent_Address = objArr.getPermanent_Address();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Permanent_Address);
            return cellnum;
        }
        else if(col.equals("Alt_Email_Id"))
        {
            String Alt_Email_Id = objArr.getAlt_Email_Id();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Alt_Email_Id);
            return cellnum;
        }
        else if(col.equals("Father_Name"))
        {
            String Father_Name = objArr.getFather_Name();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Father_Name);
            return cellnum;
        }
        else if(col.equals("Father_Occupation"))
        {
            String Father_Occupation = objArr.getFather_Occupation();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Father_Occupation);
            return cellnum;
        }
        else if(col.equals("Father_Office_Address"))
        {
            String Father_Office_Address = objArr.getFather_Office_Address();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Father_Office_Address);
            return cellnum;
        }
        else if(col.equals("Father_Contact_Number"))
        {
            String Father_Contact_Number = objArr.getFather_Contact_Number();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Father_Contact_Number);
            return cellnum;
        }
        else if(col.equals("Mother_Name"))
        {
            String Mother_Name = objArr.getMother_Name();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Mother_Name);
            return cellnum;
        }
        else if(col.equals("Mother_Occupation"))
        {
            String Mother_Occupation = objArr.getMother_Occupation();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Mother_Occupation);
            return cellnum;
        }
        else if(col.equals("Mother_Office_Address"))
        {
            String Mother_Office_Address = objArr.getMother_Office_Address();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Mother_Office_Address);
            return cellnum;
        }
        else if(col.equals("Mother_Contact_Number"))
        {
            String Mother_Contact_Number = objArr.getMother_Contact_Number();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Mother_Contact_Number);
            return cellnum;
        }
        else if(col.equals("Class_X_School"))
        {
            String Class_X_School = objArr.getClass_X_School();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_X_School);
            return cellnum;
        }
        else if(col.equals("Class_X_Passing_Year"))
        {
            int Class_X_Passing_Year = objArr.getClass_X_Passing_Year();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_X_Passing_Year);
            return cellnum;
        }
        else if(col.equals("Class_XII_or_Diploma"))
        {
            String Class_XII_or_Diploma = objArr.getClass_XII_or_Diploma();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_XII_or_Diploma);
            return cellnum;
        }
        else if(col.equals("Class_XII_Board"))
        {
            String Class_XII_Board = objArr.getClass_XII_Board();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_XII_Board);
            return cellnum;
        }
        else if(col.equals("Class_XII_School"))
        {
            String Class_XII_School = objArr.getClass_XII_School();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_XII_School);
            return cellnum;
        }
        else
            return cellnum;
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(exportServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(exportServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(exportServlet.class.getName()).log(Level.SEVERE, null, ex);
        }catch (IllegalAccessException ex) {
            Logger.getLogger(exportServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private int IterateUnderGradStudentPOJO(UnderGradPOJO underGrad, Row row, int cellnum, String col) 
    {
        Cell cell;
        if(col.equals("Enrollment_Number"))
        {
            String Enrollment_Number = underGrad.getEnrollment_Number();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Enrollment_Number);
            return cellnum;
        }
        else if(col.equals("Department"))
        {
            String Department = underGrad.getDepartment();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Department);
            return cellnum;
        }
        else if(col.equals("Course"))
        {
            String Course = underGrad.getCourse();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Course);
            return cellnum;
        }
        else if(col.equals("Institute_Name"))
        {
            String Institute_Name = underGrad.getInstitute_Name();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Institute_Name);
            return cellnum;
        }
        else if(col.equals("Gender"))
        {
            String Gender = underGrad.getGender();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Gender);
            return cellnum;
        }
        else if(col.equals("DOB"))
        {
            Date DOB = underGrad.getDOB();
            cell = row.createCell(cellnum++);
            cell.setCellValue(DOB);
            return cellnum;
        }
        else if(col.equals("Contact_Number"))
        {
            String Contact_Number = underGrad.getContact_Number();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Contact_Number);
            return cellnum;
        }
        else if(col.equals("Alt_Contact_Number"))
        {
            String Alt_Contact_Number = underGrad.getAlt_Contact_Number();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Alt_Contact_Number);
            return cellnum;
        }
        else if(col.equals("EmailId"))
        {
            String EmailId = underGrad.getEmailId();
            cell = row.createCell(cellnum++);
            cell.setCellValue(EmailId);
            return cellnum;
        }
        else if(col.equals("Class_X_Board"))
        {
            String Class_X_Board = underGrad.getClass_X_Board();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_X_Board);
            return cellnum;
        }
        else if(col.equals("Class_X_Percentage"))
        {
            Double Class_X_Percentage = underGrad.getClass_X_Percentage();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_X_Percentage);
            return cellnum;
        }
        else if(col.equals("Class_XII_or_Diploma_Percentage"))
        {
            Double Class_XII_or_Diploma_Percentage = underGrad.getClass_XII_or_Diploma_Percentage();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_XII_or_Diploma_Percentage);
            return cellnum;
        }
        else if(col.equals("Class_XII_or_Diploma_Passing_Year"))
        {
            int Class_XII_or_Diploma_Passing_Year = underGrad.getClass_XII_or_Diploma_Passing_Year();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_XII_or_Diploma_Passing_Year);
            return cellnum;
        }
        else
            return cellnum;
    }

    private int IteratePostGradStudentPOJO(PostGradPOJO postGrad, Row row, int cellnum, String col) 
    {
        Cell cell;
        if(col.equals("Enrollment_Number"))
        {
            String Enrollment_Number = postGrad.getEnrollment_Number();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Enrollment_Number);
            return cellnum;
        }
        else if(col.equals("Department"))
        {
            String Department = postGrad.getDepartment();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Department);
            return cellnum;
        }
        else if(col.equals("Course"))
        {
            String Course = postGrad.getCourse();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Course);
            return cellnum;
        }
        else if(col.equals("Institute_Name"))
        {
            String Institute_Name = postGrad.getInstitute_Name();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Institute_Name);
            return cellnum;
        }
        else if(col.equals("Gender"))
        {
            String Gender = postGrad.getGender();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Gender);
            return cellnum;
        }
        else if(col.equals("DOB"))
        {
            Date DOB = postGrad.getDOB();
            cell = row.createCell(cellnum++);
            cell.setCellValue(DOB);
            return cellnum;
        }
        else if(col.equals("Contact_Number"))
        {
            String Contact_Number = postGrad.getContact_Number();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Contact_Number);
            return cellnum;
        }
        else if(col.equals("Alt_Contact_Number"))
        {
            String Alt_Contact_Number = postGrad.getAlt_Contact_Number();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Alt_Contact_Number);
            return cellnum;
        }
        else if(col.equals("EmailId"))
        {
            String EmailId = postGrad.getEmailId();
            cell = row.createCell(cellnum++);
            cell.setCellValue(EmailId);
            return cellnum;
        }
        else if(col.equals("Class_X_Board"))
        {
            String Class_X_Board = postGrad.getClass_X_Board();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_X_Board);
            return cellnum;
        }
        else if(col.equals("Class_X_Percentage"))
        {
            Double Class_X_Percentage = postGrad.getClass_X_Percentage();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_X_Percentage);
            return cellnum;
        }
        else if(col.equals("Class_XII_or_Diploma_Percentage"))
        {
            Double Class_XII_or_Diploma_Percentage = postGrad.getClass_XII_or_Diploma_Percentage();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_XII_or_Diploma_Percentage);
            return cellnum;
        }
        else if(col.equals("Class_XII_or_Diploma_Passing_Year"))
        {
            int Class_XII_or_Diploma_Passing_Year = postGrad.getClass_XII_or_Diploma_Passing_Year();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Class_XII_or_Diploma_Passing_Year);
            return cellnum;
        }
        else if(col.equals("GraduationUniversity"))
        {
            String GraduationUniversity = postGrad.getGraduationUniversity();
            cell = row.createCell(cellnum++);
            cell.setCellValue(GraduationUniversity);
            return cellnum;
        }
        else if(col.equals("GraduationCollege"))
        {
            String GraduationCollege = postGrad.getGraduationCollege();
            cell = row.createCell(cellnum++);
            cell.setCellValue(GraduationCollege);
            return cellnum;
        }
        else if(col.equals("Graduation_Stream"))
        {
            String Graduation_Stream = postGrad.getGraduation_Stream();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Graduation_Stream);
            return cellnum;
        }
        else if(col.equals("Graduation_Percentage"))
        {
            Double Graduation_Percentage = postGrad.getGraduation_Percentage();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Graduation_Percentage);
            return cellnum;
        }
        else if(col.equals("Graduation_Year"))
        {
            int Graduation_Year = postGrad.getGraduation_Year();
            cell = row.createCell(cellnum++);
            cell.setCellValue(Graduation_Year);
            return cellnum;
        }
        else
            return cellnum;        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}