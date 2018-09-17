<%@page import="java.util.Map"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@include file="connection.jsp" %>
<%@include file="common_header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/t1.js"></script>
<link rel="stylesheet" type="text/css" href="css/commonCSS.css">
  
<title>Training and Placement Cell, IGDTUW</title>

<%! String year = "null", dbname="", SQLQuery="";
    PreparedStatement pst=null;
    Enumeration parameter = null;
    Map<String, String> Programs = null;
;%>
<%
 Programs = new HashMap<String, String>();
 parameter = request.getParameterNames();
 int count = 0;
   while(parameter.hasMoreElements())
   {
		parameter.nextElement();
		count++;
   }
   
   if(count>0)
       year = (String)request.getParameter("yearDB");
   System.out.println(year);
%>
<style>
    table, tr, td, td>div, td>p, td>div>div{
        text-align: left;
        background-color: white;
        cursor: default;
    }
    
    hr
    { 
        margin-top: 0.2em;
        margin-bottom: 0.2em;
    } 

    </style>
    
<script>
function getParameterByName(name, url) 
{
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}     
    
   $(document).ready(function () {       
       $('#year').change(function () 
       { 
            var yearVal = $('#year').val();
            if(yearVal===null||yearVal==="")
            {
              $("#error-msg").text("Enter a valid year");
              return false;
            }
          
            $.ajax({
             url : './CheckDataBase?yearVal='+yearVal,
             dataType : "json",
             type : "Post",
             success : function(resultans) 
             {  
                 if(resultans==='Success')
                 {
                     window.location="screen_admin_database.jsp?yearDB="+yearVal; 
                 }
                 else
                 {
                     $("#error-msg").text("Such Batch of students does not exists.");  
                     $('#programmes').children('option:not(:first)').remove();
                     $('div.containerBranch').children().hide(); 
                 }
                     
             },
             error : function(responseText) 
             {
                alert(" Error finding the DataBase ! ");
             }
         });
       });
       
       var yearVal = getParameterByName('yearDB');       
       if(yearVal!==null&&yearVal!=="")
       {
           $("#year").val(yearVal);  
       }
       
   });
    
$(document).ready(function() 
{
    $('#programmes').bind('change', function() {
        var elements = $('div.containerBranch').children().hide(); // hide all the elements
        
        $('table tbody tr#UnderGrad').hide(); 
        $('table tbody tr#PostGrad').hide(); 
        
        var value = $(this).val();        
        var Programme_Code = value.split('-')[0];
        var Programme_Name = value.split('-')[1];
        var Programme_Duration = value.split('-')[2];
        var Programme_Type = value.split('-')[3];
        
        if(Programme_Type==="UNDERGRADUATE")
        {
            $('table tbody tr#UnderGrad').show(); 
             var cbs = document.getElementsByClassName("cbinner1i"); 
             for (var i = 0; i < cbs.length; i++) 
             {
                 cbs[i].checked = true;
             }
             $('#mainopt1i').prop('checked', true);
             
             var cbs = document.getElementsByClassName("cbinner1ii"); 
             for (var i = 0; i < cbs.length; i++) 
             {
                 cbs[i].checked = false;
             }
             $('#mainopt1ii').prop('checked', false);
             
        }
        else if(Programme_Type==="POSTGRADUATE")
        {
            $('table tbody tr#PostGrad').show(); 
             var cbs = document.getElementsByClassName("cbinner1ii"); 
             for (var i = 0; i < cbs.length; i++) 
             {
                 cbs[i].checked = true;
             }
             $('#mainopt1ii').prop('checked', true);
             
             var cbs = document.getElementsByClassName("cbinner1i"); 
             for (var i = 0; i < cbs.length; i++) 
             {
                 cbs[i].checked = false;
             }
             $('#mainopt1i').prop('checked', false);
        }
        
        var valueBranch = Programme_Code+"-"+Programme_Name; 
        var val = ((parseInt(Programme_Duration, 10))*10);
        for(x = val+1; x<=60; x++)
        {
            document.getElementById("cb2opt"+x).checked=false;
            $('#cb2opt'+x+'text').hide();
        }
        for(y = 1; y<=val; y++)
        {
            document.getElementById("cb2opt"+y).checked=true;
            $('#cb2opt'+y+'text').show();
        }        
        
        if (value.length) { // if somethings' selected
            elements.filter('.' + valueBranch).show(); // show the ones we want      
        }         
    }).trigger('change');
});
</script>

<script type='text/javascript'>//<![CDATA[
function cbChange1(obj) 
{
    var cbs = document.getElementsByClassName("cbinner1");
    if(obj.checked===false)
    { 
        for (var i = 1; i < cbs.length; i++) 
        {
            cbs[i].checked = false;
        }
        obj.checked = false;
    }
    else 
    {
        for (var i = 0; i < cbs.length; i++) 
        {
            cbs[i].checked = true;
        }
        obj.checked = true;        
    }
};

function cbChangeInner1(obj)
{
    var cbs = document.getElementById("mainopt1");
    if(obj.checked===false)
    {
        cbs.checked=false;
        obj.checked=false;
    }
    else  
        obj.checked=true;
};

function cbChange1i(obj) 
{
    var cbs = document.getElementsByClassName("cbinner1i");
    if(obj.checked===false)
    { 
        for (var i = 0; i < cbs.length; i++) 
        {
            cbs[i].checked = false;
        }
        obj.checked = false;
    }
    else 
    {
        for (var i = 0; i < cbs.length; i++) 
        {
            cbs[i].checked = true;
        }
        obj.checked = true;        
    }
};

function cbChangeInner1i(obj)
{
    var cbs = document.getElementById("mainopt1i");
    if(obj.checked===false)
    {
        cbs.checked=false;
        obj.checked=false;
    }
    else  
        obj.checked=true;
};

function cbChange1ii(obj) 
{
    var cbs = document.getElementsByClassName("cbinner1ii");
    if(obj.checked===false)
    { 
        for (var i = 0; i < cbs.length; i++) 
        {
            cbs[i].checked = false;
        }
        obj.checked = false;
    }
    else 
    {
        for (var i = 0; i < cbs.length; i++) 
        {
            cbs[i].checked = true;
        }
        obj.checked = true;        
    }
};

function cbChangeInner1ii(obj)
{
    var cbs = document.getElementById("mainopt1ii");
    if(obj.checked===false)
    {
        cbs.checked=false;
        obj.checked=false;
    }
    else  
        obj.checked=true;
};

function cbChange2(obj) 
{
    var cbs = document.getElementsByClassName("cbinner2");
    if(obj.checked===false)
    { 
        for (var i = 0; i < cbs.length; i++) 
        {
            cbs[i].checked = false;
        }
        obj.checked = false;
//        document.getElementById("demo").innerHTML="false";
    }
    else 
    {
        for (var i = 0; i < cbs.length; i++) 
        {
            cbs[i].checked = true;
        }
        obj.checked = true;        
//        document.getElementById("demo").innerHTML="true";
    }
};

function cbChangeInner2(obj)
{
    var cbs = document.getElementById("mainopt2");
    if(obj.checked===false)
    {
        cbs.checked=false;
        obj.checked=false;
    }
    else 
        obj.checked=true;
};

//]]> 
</script>

<script>
function formValidate(e) 
{    
    var year = document.getElementById("year").value,
        programmes = document.getElementById("programmes"),
        branches = document.getElementById("branches");

    if (year===null||year===""||isNaN(year)) 
    {
        text = "Enter a valid year";
        document.getElementById("error-msg").innerHTML = text;
        
            $('html,body').animate({
                scrollTop: $('#dbForm').offset().top
            }, 1000);
            
		e.preventDefault();
                return false;
    } 
    
    if(programmes.selectedIndex === 0)
    {
        text = "Select a valid Programme";
        document.getElementById("error-msg-p").innerHTML = text;
        
            $('html,body').animate({
                scrollTop: $('#dbForm').offset().top
            }, 1000);
            
		e.preventDefault();
                return false;
    }
    
    if(branches.selectedIndex === 0)
    {
        text = "Select a valid Branch";
        document.getElementById("error-msg-b").innerHTML = text;
        
            $('html,body').animate({
                scrollTop: $('#dbForm').offset().top
            }, 1000);
            
		e.preventDefault();
                return false;
    }
//    document.body.style.cursor='wait';
    return true;
}   

window.onload = function() {
	document.getElementById("dbForm").addEventListener("submit", function(e){
    	formValidate(e);
	});
};
</script>

</head>

<body>
    <br><br>
    
<div class="clear"> </div>
<section>
    <article class="box_database">
        <a href="screen_admin_database.jsp" ><h1 class="heading tnpheading" style="text-align:center;">DATABASE</h1></a>
        <form method="post" action="exportServlet" id="dbForm">
	<div class="left">
            <table class="table table-condensed" border="0"><tbody>   
            <tr><td> JOINING YEAR OF THE BATCH </td>
                <td>
                    
            <input type="text" id="year" name="year" maxlength="4" placeholder=" Example : 2014" style="height: 24px;width: 80%;text-align:left;"/>
            <div id="error-msg" style="color: red"></div>
            
                </td>
            </tr>        
                    
            <tr><td> PROGRAMME/COURSE </td>
            <td>
                <select required size="1" id="programmes" name="programmes" style="height: 23px;width: 80%;">
                <option value="default">-Select Programme-</option>
                
                <%
                    if(!year.isEmpty()&&year!="null")
                    {
                    dbname="db_"+year;
                    System.out.println(dbname);
                    SQLQuery = "select * from "+dbname+".programme_codes";
                    pst = con.prepareStatement(SQLQuery); 
                    
                    ResultSet rs = pst.executeQuery();
                    while (rs.next())
                    {
                    String Programme_Code = rs.getString("Programme_Code"), 
                            Programme_Name = rs.getString("Programme_Name"),
                            Programme_Type = rs.getString("Programme_Type"),
                            Programme_Duration = rs.getString("Programme_Duration");
                    Programs.put(Programme_Code, Programme_Name);
                %>
                <option value="<%=Programme_Code%>-<%=Programme_Name%>-<%=Programme_Duration%>-<%=Programme_Type%>"><%=Programme_Name%></option>
                <%
            }
            rs.close();
            pst.close();
                    }
                %>
            </select>
            <br>                 
            <div id="error-msg-p" style="color: red"></div>
             
            <div class="containerBranch">
                <%
                    for(Map.Entry<String, String> m : Programs.entrySet())
                    {
                        String Programme_Code = m.getKey();
                        String Programme_Name = m.getValue();
                        System.out.println(Programme_Code+"-"+Programme_Name);
                %>
                <div class="<%=Programme_Code%>-<%=Programme_Name%>">
                    <br>
                    <select required class="branches" id="branches" name="branches" style="height: 23px;width: 80%;">
                        <option value="default">-Select Branch-</option>                       
                                   
                <%
                    if(!year.isEmpty()&&year!="null")
                    {
                    dbname="db_"+year;
                    System.out.println(dbname);
            SQLQuery = "select Branch_Code, Branch_Name from "+dbname+".branch_codes where programme_name = '"+Programme_Name+"'";
            pst = con.prepareStatement(SQLQuery); 
                    
                    ResultSet rs = pst.executeQuery();
                    while (rs.next())
                    {
                    String Branch_Code = rs.getString("branch_code"), 
                            Branch_Name = rs.getString("branch_Name");
                %>
                        
                        <option value="<%=Branch_Code%>-<%=Branch_Name%>"><%=Branch_Name%></option>
                          <%
            }
            rs.close();
            pst.close();
                    }
                %>
                    </select> 
                <br>
                </div>
                <%}%>
                <br>
            </div>
                <div id="error-msg-b" style="color: red"></div>
            
            </td></tr>
						
            <br>
            <tr><td> FORMAT : </td>
                <td>
                    <input type="text" readonly name="format" id="format" value="Excel sheet" style="height: 24px;width: 80%;text-align: left"/>
<!--                    <select name="format" style="height: 20px;">
                        <option value="excel">Excel sheet</option>
                        <option value="pdf">PDF document</option>
                    </select>--> <br>
                </td>
            </tr>
            
            <tr>
                <td>
                   <input class="cb1" checked value="Personal Information" type="checkbox" id="mainopt1" onchange="cbChange1(this)"/> Personal Information
                </td>
                <td>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Enrollment_Number" id="cb1opt1" onclick="return false;"/> Enrollment Number<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="First_Name" id="cb1opt2" onchange="cbChangeInner1(this)"/> First Name<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Last_Name" id="cb1opt3" onchange="cbChangeInner1(this)"/> Last Name<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Aadhar_Number" id="cb1opt4" onchange="cbChangeInner1(this)"/> Aadhar Number<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Category" id="cb1opt5" onchange="cbChangeInner1(this)"/> Category<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Temp_Address" id="cb1opt6" onchange="cbChangeInner1(this)"/> Temporary Address<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Permanent_Address" id="cb1opt7" onchange="cbChangeInner1(this)"/> Permanent Address<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Alt_Email_Id" id="cb1opt8" onchange="cbChangeInner1(this)"/> Alternate Email Id<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Father_Name" id="cb1opt9" onchange="cbChangeInner1(this)"/> Father Name<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Father_Occupation" id="cb1opt10" onchange="cbChangeInner1(this)"/> Father Occupation<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Father_Office_Address" id="cb1opt11" onchange="cbChangeInner1(this)"/> Father Office Address<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Father_Contact_Number" id="cb1opt12" onchange="cbChangeInner1(this)"/> Father Contact Number<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Mother_Name" id="cb1opt13" onchange="cbChangeInner1(this)"/> Mother Name<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Mother_Occupation" id="cb1opt14" onchange="cbChangeInner1(this)"/> Mother Occupation<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Mother_Office_Address" id="cb1opt15" onchange="cbChangeInner1(this)"/> Mother Office Address<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Mother_Contact_Number" id="cb1opt16" onchange="cbChangeInner1(this)"/> Mother Contact Number<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Class_X_School" id="cb1opt17" onchange="cbChangeInner1(this)"/> Class X School<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Class_X_Passing_Year" id="cb1opt18" onchange="cbChangeInner1(this)"/> Class X Passing Year<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Class_XII_or_Diploma" id="cb1opt19" onchange="cbChangeInner1(this)"/> Class XII or Diploma<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Class_XII_Board" id="cb1opt20" onchange="cbChangeInner1(this)"/> Class XII Board<br>
                    <input class="cbinner1" name="cbinner1" checked type="checkbox" value="Class_XII_School" id="cb1opt21" onchange="cbChangeInner1(this)"/> Class XII School<br>
                </td>
            </tr>
            
                <tr id="UnderGrad">
                    <td>
                       <input class="cb1i" value="Undergraduate Information" type="checkbox" id="mainopt1i" onchange="cbChange1i(this)"/> Undergraduate Information
                    </td>
                    <td>
                        <input class="cbinner1i" name="cbinner1i" type="checkbox" value="Department" id="cb1opt1i" onclick="cbChangeInner1i(this)"/> Department<br>
                        <input class="cbinner1i" name="cbinner1i" type="checkbox" value="Course" id="cb1opt2i" onchange="cbChangeInner1i(this)"/> Course<br>
                        <input class="cbinner1i" name="cbinner1i" type="checkbox" value="Institute_Name" id="cb1opt3i" onchange="cbChangeInner1i(this)"/> Institute Name<br>
                        <input class="cbinner1i" name="cbinner1i" type="checkbox" value="Gender" id="cb1opt4i" onchange="cbChangeInner1i(this)"/> Gender<br>
                        <input class="cbinner1i" name="cbinner1i" type="checkbox" value="DOB" id="cb1opt5i" onchange="cbChangeInner1i(this)"/> DOB<br>
                        <input class="cbinner1i" name="cbinner1i" type="checkbox" value="Contact_Number" id="cb1opt6i" onchange="cbChangeInner1i(this)"/> Contact Number<br>
                        <input class="cbinner1i" name="cbinner1i" type="checkbox" value="Alt_Contact_Number" id="cb1opt7i" onchange="cbChangeInner1i(this)"/> Alternate Contact Number<br>
                        <input class="cbinner1i" name="cbinner1i" type="checkbox" value="EmailId" id="cb1opt8i" onchange="cbChangeInner1i(this)"/> Email Id<br>
                        <input class="cbinner1i" name="cbinner1i" type="checkbox" value="Class_X_Board" id="cb1opt9i" onchange="cbChangeInner1i(this)"/> Class X Board<br>
                        <input class="cbinner1i" name="cbinner1i" type="checkbox" value="Class_X_Percentage" id="cb1opt10i" onchange="cbChangeInner1i(this)"/> Class X Percentage<br>
                        <input class="cbinner1i" name="cbinner1i" type="checkbox" value="Class_XII_or_Diploma_Percentage" id="cb1opt11i" onchange="cbChangeInner1i(this)"/> Class XII or Diploma Percentage<br>
                        <input class="cbinner1i" name="cbinner1i" type="checkbox" value="Class_XII_or_Diploma_Passing_Year" id="cb1opt12i" onchange="cbChangeInner1i(this)"/> Class XII or Diploma Passing Year<br>
                    </td>
                </tr>
            
                 <tr id="PostGrad">
                    <td>
                       <input class="cb1ii" value="Postgraduate Information" type="checkbox" id="mainopt1ii" onchange="cbChange1ii(this)"/> Postgraduate Information
                    </td>
                    <td>
                        <input class="cbinner1ii" name="cbinner1ii" type="checkbox" value="Department" id="cb1opt1ii" onclick="cbChangeInner1ii(this)"/> Department<br>
                        <input class="cbinner1ii" name="cbinner1ii" type="checkbox" value="Course" id="cb1opt2ii" onchange="cbChangeInner1ii(this)"/> Course<br>
                        <input class="cbinner1ii" name="cbinner1ii" type="checkbox" value="Institute_Name" id="cb1opt3ii" onchange="cbChangeInner1ii(this)"/> Institute Name<br>
                        <input class="cbinner1ii" name="cbinner1ii" type="checkbox" value="Gender" id="cb1opt4ii" onchange="cbChangeInner1ii(this)"/> Gender<br>
                        <input class="cbinner1ii" name="cbinner1ii" type="checkbox" value="DOB" id="cb1opt5ii" onchange="cbChangeInner1ii(this)"/> DOB<br>
                        <input class="cbinner1ii" name="cbinner1ii" type="checkbox" value="Contact_Number" id="cb1opt6ii" onchange="cbChangeInner1ii(this)"/> Contact Number<br>
                        <input class="cbinner1ii" name="cbinner1ii" type="checkbox" value="Alt_Contact_Number" id="cb1opt7ii" onchange="cbChangeInner1ii(this)"/> Alternate Contact Number<br>
                        <input class="cbinner1ii" name="cbinner1ii" type="checkbox" value="EmailId" id="cb1opt8ii" onchange="cbChangeInner1ii(this)"/> Email Id<br>
                        <input class="cbinner1ii" name="cbinner1ii" type="checkbox" value="Class_X_Board" id="cb1opt9ii" onchange="cbChangeInner1ii(this)"/> Class X Board<br>
                        <input class="cbinner1ii" name="cbinner1ii" type="checkbox" value="Class_X_Percentage" id="cb1opt10ii" onchange="cbChangeInner1ii(this)"/> Class X Percentage<br>
                        <input class="cbinner1ii" name="cbinner1ii" type="checkbox" value="Class_XII_or_Diploma_Percentage" id="cb1opt11ii" onchange="cbChangeInner1ii(this)"/> Class XII or Diploma Percentage<br>
                        <input class="cbinner1ii" name="cbinner1ii" type="checkbox" value="Class_XII_or_Diploma_Passing_Year" id="cb1opt12ii" onchange="cbChangeInner1ii(this)"/> Class XII or Diploma Passing Year<br>
                    </td>
                </tr>                   
            
            <tr>
                <td>
                   <input class="cb2" checked value="Educational Information" type="checkbox" id="mainopt2" onchange="cbChange2(this)"/> Educational Information
                </td>                
                <td>                    
                    <div id="cb2opt1text"><input class="cbinner2" name="cbinner2" checked type="checkbox" value="Total_Marks_Sem_1" id="cb2opt1" onchange="cbChangeInner2(this)"/> Semester 1 Total marks w/o credit<br></div>
                    <div id="cb2opt2text"><input class="cbinner2" name="cbinner2" checked type="checkbox" value="Total_Marks_With_Credit_Sem_1" id="cb2opt2" onchange="cbChangeInner2(this)"/> Semester 1 marks with credit<br></div>
                    <div id="cb2opt3text"><input class="cbinner2" name="cbinner2" checked type="checkbox" value="Credits_Obtained_Sem_1" id="cb2opt3" onchange="cbChangeInner2(this)"/> Semester 1 Credits Obtained<br></div>
                    <div id="cb2opt4text"><input class="cbinner2" name="cbinner2" checked type="checkbox" value="Percentage_Sem_1" id="cb2opt4" onchange="cbChangeInner2(this)"/> Semester 1 Percentage w/o credit<br></div>
                    <div id="cb2opt5text"><input class="cbinner2" name="cbinner2" checked type="checkbox" value="Percenatge_With_Credit_Sem_1" id="cb2opt5" onchange="cbChangeInner2(this)"/> Semester 1 Percentage with credit<br></div>
                    
                    <%
                    int j=2;
                        for(int i=6;i<=60;j++)
                        {
    %>
                        
                    <div id="cb2opt<%=i%>text"><hr><input class="cbinner2" name="cbinner2" checked type="checkbox" value="Total_Marks_Sem_<%=j%>" id="cb2opt<%=i%>" onchange="cbChangeInner2(this)"/> Semester <%=j%> Total marks w/o credit<br></div><%i++;%>
                    <div id="cb2opt<%=i%>text"><input class="cbinner2" name="cbinner2" checked type="checkbox" value="Total_Marks_With_Credit_Sem_<%=j%>" id="cb2opt<%=i%>" onchange="cbChangeInner2(this)"/> Semester <%=j%> marks with credit<br></div><%i++;%>
                    <div id="cb2opt<%=i%>text"><input class="cbinner2" name="cbinner2" checked type="checkbox" value="Credits_Obtained_Sem_<%=j%>" id="cb2opt<%=i%>" onchange="cbChangeInner2(this)"/> Semester <%=j%> Credits Obtained<br></div><%i++;%>
                    <div id="cb2opt<%=i%>text"><input class="cbinner2" name="cbinner2" checked type="checkbox" value="Percentage_Sem_<%=j%>" id="cb2opt<%=i%>" onchange="cbChangeInner2(this)"/> Semester <%=j%> Percentage w/o credit<br></div><%i++;%>
                    <div id="cb2opt<%=i%>text"><input class="cbinner2" name="cbinner2" checked type="checkbox" value="Percenatge_With_Credit_Sem_<%=j%>" id="cb2opt<%=i%>" onchange="cbChangeInner2(this)"/> Semester <%=j%> Percentage with credit<br></div><%i++;%>      
                    
                    <%}%>
                </td>
            </tr>
            
            </tbody>
            </table>
        </div>
        <div>
            <center><input class="button submit tnpbtn" type="submit" value="Get information"></center>
	</div>
    </form>		
    </article>
                    
</section>		
</body>

  <script>
  // tell the embed parent frame the height of the content
  if(window.parent && window.parent.parent) {
    window.parent.parent.postMessage(["resultsFrame", {
      height: document.body.getBoundingClientRect().height,
      slug: "3UWk2"
    }], "*");
  }
</script>
<br><br><br>
</html>
<footer><%@include file="footer2.jsp" %></footer>