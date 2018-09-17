$(document).ready(function() 
{
    $('#containeryear').change(function ()
     {
         //Get Text box values
          var yearVal = $('#containeryear').val();
          if(yearVal===null||yearVal==="")
          {
              $("#error-msg").text("Enter a valid year"); 
              $('#dept').children('option:not(:first)').remove();
              $("div.containerCourse").children().hide();
              $("div.containerCompany").children().hide(); 
              return false;
          }
          
          var datemonthYear = $('#datemonthYear').text();
          var username = $('#username').text();
         
         $.ajax({
             url : './CheckDataBase?yearVal='+yearVal,
             dataType : "json",
             type : "Post",
             success : function(resultans) 
             {  
                 if(resultans==='Success')
                 {
                     window.location="calendarMonthPrintView.jsp?containeryearDB="+yearVal+"&datemonthYear="+datemonthYear+"&username="+username; 
                 }
                 else
                 {
                     $("#error-msg").text("Such Batch of students does not exists.");  
                     $('#dept').children('option:not(:first)').remove();
                     $("div.containerCourse").children().hide();
                     $("div.containerCompany").children().hide();
                 }
                     
             },
             error : function(responseText) 
             {
                alert(" Error finding the DataBase ! ");
             }
         });
    });
});

$(document).ready(function() 
{
     //On Button Click
     $("#addEventcompany").click(function() 
     {
         //Get Text box values
         var dept = $("#dept").val().split('-')[1];
         var course = $(".course").val().split('-')[3];
         var yearOfDegree = $(".year").val();
         var compName = $(".companyName-"+$(".course").val()).val(); 
         var EventInfo = $(".EventInfoDD").val();
         if(EventInfo==="Others")
         {
             EventInfo = $("#EventInfo").val();
         }
         var username = $("#username").text();
         var currentdate= $("#datemonthYear").text();
         var date = currentdate.split('-')[0];
         var month = currentdate.split('-')[1];
         var year = currentdate.split('-')[2];
         var textV;
         
    if (yearOfDegree===null||yearOfDegree===""||isNaN(yearOfDegree)) 
    {
        textV = "Enter a valid year";
        $("#error-msg").text(textV);
        $('.year').focus();
        
        $("#error-msg-e").hide();   
        $("#error-msg-p").hide();   
        $("#error-msg-b").hide();   
        $("#error-msg-c").hide();    
        return false;
    } 
    
    if($("#dept").val() === "default")
    {
        textV = "Select a valid Programme";
        $("#error-msg-p").text(textV);
        $('#dept').focus();
        
        $("#error-msg").hide();   
        $("#error-msg-e").hide();   
        $("#error-msg-b").hide();   
        $("#error-msg-c").hide();    
        return false;
    }
    
    if($(".course").val() === "default")
    {
        textV = "Select a valid Branch";
        $("#error-msg").hide();   
        $("#error-msg-p").hide();   
        $("#error-msg-e").hide();   
        $("#error-msg-c").hide();    
        
        $("#error-msg-b").text(textV);
        $('.course').focus();
        
        return false;
    }
    
    if(compName === "default")
    {
        textV = "Select a valid Company";
        $("#error-msg").hide();   
        $("#error-msg-p").hide();   
        $("#error-msg-b").hide();   
        $("#error-msg-e").hide();    
        $("#error-msg-c").text(textV);
        $(".companyName-"+$(".course").val()).focus();
        
        return false;
    }
    
    if(EventInfo === "")
    {
        textV = "Enter a valid Event";
        $("#error-msg").hide();   
        $("#error-msg-p").hide();   
        $("#error-msg-b").hide();   
        $("#error-msg-c").hide();    
        $("#error-msg-e").text(textV);
        $('#EventInfo').focus();
        
        return false;
    }
         
         $.ajax({
             url : './AddRecordHandler?operation=insert&date='+date+"&month="+month+"&year="+year+"&dept="+dept+"&course="+course+"&yearOfDegree="+yearOfDegree+"&compName="+compName+"&EventInfo="+EventInfo+"&username="+username,
             dataType : "json",
             type : "Post",
             success : function(resultans) 
             {
                 var result = resultans.split('-')[0];
                 $("#message").text(result).delay(1000).fadeOut('slow');                 
                 
                 if(result==='Record Inserted Successfully.')
                 {
                     //Clear Textbox data
                     $(".year").val("");
                     $('#dept').children('option:not(:first)').remove();
                     $("div.containerCourse").children().hide();
                     $("div.containerCompany").children().hide();
                     $("#EventInfo").val('');
                 }
             },
             error : function(responseText) 
             {
                alert(" Error inserting the data ! ");
             }
         });
    });
});

$(document).ready(function() 
{
     //On Button Click
     $("#addEventtnp").click(function() 
     {
         //Get Text box values
         var eventtype = $('#eventtype:checked').val();
         var EventInfo = $("#EventInfoTnp").val();
         var currentdate= $("#datemonthYear").text();
         var username = $("#username").text();
         var date = currentdate.split('-')[0];
         var month = currentdate.split('-')[1];
         var year = currentdate.split('-')[2];
         
         $.ajax({
             url : './AddRecordTnpHandler?operation=insert&date='+date+"&month="+month+"&year="+year+"&eventtype="+eventtype+"&EventInfo="+EventInfo+"&username="+username,
             dataType : "json",
             type : "Post",
             success : function(resultans) 
             {
                 var result = resultans.split('-')[0];
                 $("#message").text(result).delay(1000).fadeOut('slow');                 
                 
                 if(result==='Record Inserted Successfully.')
                 {
                     //Clear Textbox data
                     //$('#eventtype:checked').val('');
                     $("#EventInfoTnp").val('');
                 }
                 
             },
             error : function(responseText) 
             {
                alert(" Error inserting the data ! ");
             }
         });
    });
});


$(document).ready(function() 
{
     //On Button Click
     $("#delete-row").click(function() 
     {
         //Get Text box values
         var infoMetaData = $('#infoMetaData:checked').val();
         var currentdate= $("#datemonthYear").text();
         var username = $("#username").text();
         var date = currentdate.split('-')[0];
         var month = currentdate.split('-')[1];
         var year = currentdate.split('-')[2];
         
         $.ajax({
             url : './DeleteRecordHandler?operation=delete&date='+date+"&month="+month+"&year="+year+"&infoMetaData="+infoMetaData+"&username="+username,
             dataType : "json",
             type : "Post",
             success : function(result) 
             {
                 $("#message").text(result).delay(1000).fadeOut('slow');                 
                 
                 if(result==='Record Deleted Successfully.')
                 {
                     $('#infoMetaData:checked').parents("tr").remove();
                 }
//                 else
//                    $('#infoMetaData:checked').val('');
             },
             error : function(responseText) 
             {
                alert(" Error inserting the data ! ");
             }
         });
    });
});