/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var oname;
var ocode;
var xmlHttp;
function edit_row(no)
{
 document.getElementById("edit_button"+no).style.display="none";
 document.getElementById("save_button"+no).style.display="inline";
 var name=document.getElementById("name_row"+no);
 var country=document.getElementById("code_row"+no);
 var age=document.getElementById("credit_row"+no);
 var name_data=name.innerHTML;
 var country_data=country.innerHTML;
 var age_data=age.innerHTML;
        oname="";
        oname=name_data;
        ocode=country_data;

 name.innerHTML="<input type='text' id='name_text"+no+"' value='"+name_data+"'>";
 country.innerHTML="<input type='text' id='country_text"+no+"' value='"+country_data+"'>";
 age.innerHTML="<input type='text' id='age_text"+no+"' value='"+age_data+"'>";

}

function save_row(no)
{
    document.getElementById("save_button"+no).style.display="none";
     document.getElementById("edit_button"+no).style.display="inline";
 var name_val=document.getElementById("name_text"+no).value;
 var country_val=document.getElementById("country_text"+no).value;
 var age_val=document.getElementById("age_text"+no).value;
 var table=document.getElementById("DynamicTable");
 var table_len=(table.rows.length)-1;
 if(ocode!=country_val)
 {
    var flag=0;
 for(var i=1;i<table_len;i++)
 {
 var ocode1=document.getElementById("code_row"+i).innerHTML;
    if(ocode==new_country)
    {
        alert("same subject_code already exist");
        flag=1;
        break;
    }
 }
 if(flag==0)
 {
     document.getElementById("name_row"+no).innerHTML=name_val;
 document.getElementById("code_row"+no).innerHTML=country_val;
 document.getElementById("credit_row"+no).innerHTML=age_val;
     var xmlHttp
if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request");
      return;
      }
      var year=document.getElementById("year2").value;
      var sem=document.getElementById("sem2").value;
      var course=document.getElementById("course").value;
      var branch="null";
      if ($('#branch').length > 0)
        {
                   branch=document.getElementById("branch").value;
        }
      var url="./insert_data.jsp";
      url +="?year=" +year+"&sem="+sem+"&nname="+name_val+"&ncredit="+age_val+"&ncode="+country_val+"&course="+course+"&branch="+branch;
      var url1="./delete_data.jsp";
      url1 +="?year=" +year+"&sem="+sem+"&oname="+oname+"&ocode="+ocode+"&course="+course+"&branch="+branch;
            try
      {
          xmlHttp.open("GET", url, true);
      xmlHttp.send(url);
      xmlHttp.open("GET", url1, true);
      xmlHttp.send(url1);
      }
      catch(e)
      {
          console.log(e);
      }
 }
 }
 else
 {
      document.getElementById("name_row"+no).innerHTML=name_val;
 document.getElementById("code_row"+no).innerHTML=country_val;
 document.getElementById("credit_row"+no).innerHTML=age_val;
  var course=document.getElementById("course").value;
   var branch="null";
      if ($('#branch').length > 0)
        {
                   branch=document.getElementById("branch").value;
        }
 var xmlHttp;
if (typeof XMLHttpRequest !== "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp===null){
      alert("Browser does not support XMLHTTP Request");
      return;
      }
      var year=document.getElementById("year2").value;
      var sem=document.getElementById("sem2").value;
      var url="./update_data.jsp";
      url +="?year=" +year+"&sem="+sem+"&name="+name_val+"&code="+country_val+"&credits="+age_val+"&oname="+oname+"&ocode="+ocode+"&branch="+branch+"&course="+course+"&no="+no;
      try
      {
          xmlHttp.open("GET", url, true);
      xmlHttp.send(url);
      }
      catch(e)
      {
          console.log(e);
      }
 }
  }

function delete_row(no)
{
    if(confirm("Are you sure you want to delete"))
    {
        var name=document.getElementById("name_row"+no);
 var country=document.getElementById("code_row"+no);
 var age=document.getElementById("credit_row"+no);
 var name_data=name.innerHTML;
 var country_data=country.innerHTML;
 var age_data=age.innerHTML;
 var course=document.getElementById("course").value;
 program=course;
 var credit=age.value;
        oname="";
        oname=name_data;
        ocode=country_data;
         var branch="null";
      if ($('#branch').length > 0)
        {
                   branch=document.getElementById("branch").value;
        }
 document.getElementById("row"+no+"").outerHTML="";
 var xmlHttp  ;
if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request");
      return;
      }
      var year=document.getElementById("year2").value;
      var sem=document.getElementById("sem2").value;
      var url="./delete_data.jsp";
      url +="?year=" +year+"&sem="+sem+"&oname="+oname+"&ocode="+ocode+"&course="+course+"&branch="+branch;
      try
      {
          xmlHttp.open("GET", url, true);
      xmlHttp.send(url);

      }
      catch(e)
      {
          console.log(e);
      }
    }
}

function add_row()
{
   //alert("add");
 var new_name=document.getElementById("new_name").value;
 var new_country=document.getElementById("new_country").value;
 var new_age=document.getElementById("new_age").value;
 var table=document.getElementById("DynamicTable");
 var table_len=(table.rows.length)-1;
  var flag=0;
 for(var i=1;i<table_len;i++)
 {//alert(i);
     var oname1=document.getElementById("name_row"+i).innerHTML;
 var ocode1=document.getElementById("code_row"+i).innerHTML;
var ocredit1=document.getElementById("credit_row"+i).innerHTML;

    if((ocode==new_country&&oname1==new_name)||oname1==new_name)
    {
        alert("same subject");
        flag=1;
        break;
    }
    else if(ocode1==new_country)
    {
        alert("same subject_code");
        flag=1;
        break;
    }
 }
 if(flag==0)
 {
     var row = table.insertRow(table_len).outerHTML="<tr id='row"+table_len+"'><td id='code_row"+table_len+"'>"+new_country+"</td><td id='name_row"+table_len+"'>"+new_name+"</td><td id='credit_row"+table_len+"'>"+new_age+"</td><td id='icon"+table_len+"'> <a style='border-bottom: none;' onclick='edit_row("+table_len+")'><span id='edit_button"+table_len+"' class='glyphicon glyphicon-edit' style='color:#6c9dc6;;font-size: 20px;'></span> </a><a style='border-bottom: none;' onclick='save_row("+table_len+")'><span id='save_button"+table_len+"' class='glyphicon glyphicon-save-file' style='color:green;font-size: 20px;display:none;'></span></a>&nbsp;&nbsp;<a style='border-bottom: none;' onclick='delete_row("+table_len+")'><span  class='glyphicon glyphicon-trash' style='color:#A0522D;font-size: 20px;'></span></a> </td></tr>";

 document.getElementById("new_name").value="";
 document.getElementById("new_country").value="";
 document.getElementById("new_age").value="";
 var xmlHttp
if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request");
      return;
      }
      if ($('#year2').length ==0)
        {
            alert("no");
        }
      var year=document.getElementById("year2").value;
      var sem=document.getElementById("sem2").value;
      var course=document.getElementById("course").value;
         var branch="null";
      if ($('#branch').length > 0)
        {
                   branch=document.getElementById("branch").value;
        }
      var url="./insert_data.jsp";
      url +="?year=" +year+"&sem="+sem+"&nname="+new_name+"&ncredit="+new_age+"&ncode="+new_country+"&course="+course+"&branch="+branch;
      try
      {
          xmlHttp.open("GET", url, true);
      xmlHttp.send(url);
      }
      catch(e)
      {
          console.log(e);
      }
 }
 else
 {
    document.getElementById("new_name").value="";
 document.getElementById("new_country").value="";
 document.getElementById("new_age").value="";
 }
}

function stateChange1(){
if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){
document.getElementById("t_branch").innerHTML=xmlHttp.responseText;
}
}


function selectBranch(str){
      if (typeof XMLHttpRequest !== "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp===null){
      alert("Browser does not support XMLHTTP Request");
      return;
      }
      var year=document.getElementById("year").value;
      var course=document.getElementById("course").value;
          var sem=document.getElementById("sem").value;
       var branch="null";
      if ($('#branch').length > 0)
        {
                   branch=document.getElementById("branch").value;
        }
      var url="./select_branch.jsp";
      url +="?course=" +str+"&year="+year+"&course="+course+"&sem="+sem+"&branch="+branch;
      xmlHttp.onreadystatechange = stateChange1;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }



function selectCourse(str){
      if (typeof XMLHttpRequest !== "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp===null){
      alert("Browser does not support XMLHTTP Request");
      return;
      }
      var year=document.getElementById("year").value;
      var url="./select_course.jsp";
      var program=document.getElementById("course").value;
      var sems=document.getElementById("sem").value;

             var branch="null";
      if ($('#branch').length > 0)
        {
                   branch=document.getElementById("branch").value;
        }
      url +="?year="+year+"&course="+program+"&sem="+sems+"&branch="+branch;
      xmlHttp.onreadystatechange = stateChange4;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

function stateChange4(){
if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){
document.getElementById("t_course").innerHTML=xmlHttp.responseText;
}
}