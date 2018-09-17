<header><%@include file="dash.jsp" %></header>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page errorPage="ErrorPage.jsp"%>
<%
    if(eno == null)
        response.sendRedirect("student_login.jsp");
    else{
        ResultSet rs = null;
        String year = eno.substring(7, 11);
        String db = "db_"+year;
        String driver = "com.mysql.jdbc.Driver";
        try{
            Class.forName(driver);
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, "root", "");
            Statement st = con.createStatement();
            con.setCatalog(db);
            String q = "SELECT Enrollment_Number FROM  " +db+  "."+"personal_details WHERE Enrollment_Number="+eno;
            rs = st.executeQuery(q);
            if(rs!=null && rs.isBeforeFirst())
                response.sendRedirect("UpdateProfileStudent.jsp");
        } 
        catch (Exception e) {
            e.printStackTrace();
        } 
    }
%>
<html>
    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
 
      <style>                
        body{
            font-family: 'Helvetica', 'Arial', sans-serif;
        }
        
        .container{
            width: auto;
        }
        
        .stages {
            text-align: justify;
        }

        .stages:after {
            content: "";
            display: inline-block;
            width: 100%;
        }

        .rdbtn {
           display: none;
        }

        .stages label {
            padding-top: 0.6%;
            margin-bottom: 0px;
            background: #ffffff;
            border: solid 5px #c0c0c0;
            border-radius: 50%;
            cursor: pointer;
            display: inline-block;
            font-weight: 700;
            line-height: 50px;
            position: relative;
            text-align: center;
            vertical-align: top;
            min-height: 70px;
            min-width: 70px;
            width:auto;
            height: auto;
            z-index: 1;
            font-size:0;
        }

        .stages label:after {
            content: "\2713";
            color: #39843c;
            display: inline-block;
            text-align: center;
            font-size: 25px;
        }

        #one:checked ~ .stages label[for="one"],
        #two:checked ~ .stages label[for="two"],
        #three:checked ~ .stages label[for="three"] {
                border-color: #39843c;
        }

        #one:checked ~ .stages label,
        #two:checked ~ .stages label[for="one"] ~ label,
        #three:checked ~ .stages label[for="two"] ~ label {
            font-size: 1.7em;
        }

        #one:checked ~ .stages label:after,
        #two:checked ~ .stages label[for="one"] ~ label:after,
        #three:checked ~ .stages label[for="two"] ~ label:after {
            display: none;
        }

        .completion > span {
            background: #c0c0c0;
            display: inline-block;
            height: 5px;
            transform: translateY(-2.75em);
            transition: 0.3s;
            width: 0;
        }

        #two:checked ~ .completion span {
           width: calc(100% / 2 * 1);
        }

        #three:checked ~ .completion span {
            width: calc(100% / 2 * 2);
        }

        #studentform > .panels div {
            display: none;
        }

        #one:checked ~ #studentform > .panels [data-panel="one"],
        #two:checked ~ #studentform > .panels [data-panel="two"],
        #three:checked ~ #studentform > .panels [data-panel="three"] {
            display: block;
        }
        
        .register {
            background: #ffffff;
            box-shadow: 0 5px 10px rgba(0, 0, 0, .4);
            padding: 5%;
            margin: 4em;
            margin-top: 0.1em;
        }

        #studentform > .panels div {
            border-top: solid 1px #c0c0c0;
        }
        
        .form1_item{
            float:left;
            width:100%;	
        }
        
        .form1_col1{
            float:left;
            width:49%;
            margin-left:0;
            margin-right:0;
        }

        .form1_col2{
            float:right;
            width:49%;
            margin-left:0;	
            margin-right:0;
        }
        
        .sbutton{
            border-radius: 0 !important;
            background-color: #39843c;
            border: none;
            margin-left:85%;
            width:15%;
            color:white;
            min-height:7%;
            font-size:1.2em;
            text-align:center;
        }
        
        input[type=date]::-webkit-inner-spin-button, 
        input[type=date]::-webkit-outer-spin-button { 
          -webkit-appearance: none; 
          margin: 0; 
        }
        
        /*
        Starting styles for each field
      */
        .field {
            display: block;
            position: relative;
            height: 50px;
            font-family: 'Helvetica', 'Arial', sans-serif;
        }

        .field label {
            max-height: 3px;
            overflow: hidden;
            position: absolute;
            font-weight: normal;
            left: 0; 
            right: 0;
            padding: 0 3px 0 10px;
            font-size: 13px;
            background-color: #39843c;
        }

        .field input, .field select {
            border: none;
            width: 100%;
            height: 50px;
            padding: 0 9px;
            font-size: 15px; 
            box-sizing: border-box;
            background-color: #EEFAD7;
        }
        
        /*
            Show label instead of placeholder
        */
        .field input:focus,
        .field select:focus { 
            height: 40px
        }

        .field input:focus ~ label,
        .field select:focus ~ label {
            color: #fff;
            max-height: 15px;
        }

        /* Hide placeholder onfocus for safari */
        .field input:focus[placeholder]::-webkit-input-placeholder {
          opacity: 0;
        }

        /*
          Animations
        */
        .field {
                    transition-property: height, border-width;
            -webkit-transition-property: height, border-width;
               -moz-transition-property: height, border-width;

                    transition-duration: 0.3s;
            -webkit-transition-duration: 0.3s;
               -moz-transition-duration: 0.3s;

                    transition-timing-function: ease-in;
            -webkit-transition-timing-function: ease-in;
               -moz-transition-timing-function: ease-in;
        }

        .field input,
        .field select {
                    transition: height 0.3s ease-in;
            -webkit-transition: height 0.3s ease-in;
               -moz-transition: height 0.3s ease-in;
        }

        .field label {
                    transition-property: max-height, color;
            -webkit-transition-property: max-height, color;
               -moz-transition-property: max-height, color;

                    transition-duration: 0.3s;
            -webkit-transition-duration: 0.3s;
               -moz-transition-duration: 0.3s;

                    transition-timing-function: ease-in;
            -webkit-transition-timing-function: ease-in;
               -moz-transition-timing-function: ease-in;
        }

        .field input[placeholder]::-webkit-input-placeholder {
                    transition: opacity 0.3s ease-in;
            -webkit-transition: opacity 0.3s ease-in;
               -moz-transition: opacity 0.3s ease-in;
        }
      </style>
      <script type="text/javascript">      
        $(document).ready(function () {
            document.getElementById("one").checked = true;
            resetForms();
            window.scrollTo(0, 0);
        });

        function resetForms() {
            document.forms['studentform'].reset();
        }
        
        function isFloat(n) {
            var i = parseInt(n);
            var f = parseFloat(n);

            if(isInteger(i) && i>=0 && i<=100)
                return true;
            else if((f === +f && f !== (f|0)) && f>=0 && f<=100)
                return true;
            else
                return false;
        }
        
        function isInteger(n) {
            var i = parseFloat(n);
            return i === +i && i === (i|0);
        }

        
        function validationPart1(){
            var fname = document.getElementById("fname");
            var lname = document.getElementById("lname");
            var dob = document.getElementById("dob");
            var aadharnum = document.getElementById("aadharnum");
            var permaddr = document.getElementById("permaddr");
            var tempaddr = document.getElementById("tempaddr");
            var contact = document.getElementById("contact");
            var altcontact = document.getElementById("altcontact");
            var email = document.getElementById("email");
            var altemail = document.getElementById("altemail");
            
            var emptyFields = "";
            var strFields = "";
            
            if(!fname.value)
                emptyFields += fname.placeholder + ", ";
            else if(!fname.checkValidity())
                strFields += fname.title + " in " + fname.placeholder + ".\n";
            
            if(!lname.value)
                emptyFields += lname.placeholder + ", ";
            else if(!lname.checkValidity())
                strFields += lname.title + " in " + lname.placeholder + ".\n";
            
            if(!dob.value)
                emptyFields += dob.placeholder + ", ";
            
            if(!aadharnum.value)
                emptyFields += aadharnum.placeholder + ", ";
            else if(aadharnum.value.length != 12)
                strFields += "Invalid Aadhar Number entered. \n";
            else if(!aadharnum.checkValidity())
                strFields += aadharnum.title + " in " + aadharnum.placeholder + ".\n";
            
            if(!permaddr.value)
                emptyFields += permaddr.placeholder + ", ";
            
            if(!email.value)
                emptyFields += email.placeholder + ", ";
            else if(!email.checkValidity())
                strFields += email.validationMessage + "(" + email.placeholder + ")\n";
            
            if(!altemail.checkValidity())
                strFields += altemail.validationMessage + "(" + altemail.placeholder + ")\n";
            
            if(altemail.value && email.value && altemail.value == email.value)
                strFields += "Value of Email ID and Alternate Email ID cannot be same. \n";
            
            if(!contact.value)
                emptyFields += contact.placeholder + ", ";
            else if(!contact.checkValidity())
                strFields += contact.title + " in " + contact.placeholder + ".\n";
            
            if(!altcontact.checkValidity())
                strFields += altcontact.title + " in " + altcontact.placeholder + ".\n";
            
            if(altcontact.value && contact.value && altcontact.value == contact.value)
                strFields += "Value of Contact Number and Alternate Contact Number cannot be same. \n";
            
            if(emptyFields != "" && strFields != "")
                alert(emptyFields + "cannot be empty!\n" + strFields);
            else if(strFields != "")
                alert(strFields);
            else if(emptyFields != "")
                alert(emptyFields + "cannot be empty!\n");
            
            if(emptyFields != "" || strFields != "")
                return false;
            else
                return true;
        }
        
        function validationPart2(){
            var fathname = document.getElementById("fathname");
            var fathoccptn = document.getElementById("fathoccptn");
            var fathcntct = document.getElementById("fathcntct");
            var mothname = document.getElementById("mothname");
            var mothoccptn = document.getElementById("mothoccptn");
            var mothcntct = document.getElementById("mothcntct");
            var contact = document.getElementById("contact");
            
            var emptyFields = "";
            var strFields = "";
            
            if(!fathname.value)
                emptyFields += fathname.placeholder + ", ";
            else if(!fathname.checkValidity())
                strFields += fathname.title + " in " + fathname.placeholder + ".\n";
            
            if(!fathoccptn.checkValidity())
                strFields += fathoccptn.title + " in " + fathoccptn.placeholder + ".\n";
            
            if(!fathcntct.value)
                emptyFields += fathcntct.placeholder + ", ";
            else if(!fathcntct.checkValidity())
                strFields += fathcntct.title + " in " + fathcntct.placeholder + ".\n";
            
            if(fathcntct.value && contact.value && fathcntct.value == contact.value)
                strFields += "Value of your Contact Number and Father's Contact Number cannot be same. \n";
            
            if(!mothname.value)
                emptyFields += mothname.placeholder + ", ";
            
            else if(!mothname.checkValidity())
                strFields += mothname.title + " in " + mothname.placeholder + ".\n";
                                                
            if(!mothoccptn.checkValidity())
                strFields += mothoccptn.title + " in " + mothoccptn.placeholder + ".\n";
            
            if(!mothcntct.checkValidity())
                strFields += mothcntct.title + " in " + mothcntct.placeholder + ".\n";
            
            if(mothcntct.value && contact.value && mothcntct.value == contact.value)
                strFields += "Value of your Contact Number and Mother's Contact Number cannot be same. \n";
            
            if(emptyFields != "" && strFields != "")
                alert(emptyFields + "cannot be empty!\n" + strFields);
            else if(strFields != "")
                alert(strFields);
            else if(emptyFields != "")
                alert(emptyFields + "cannot be empty!\n");
            
            if(emptyFields != "" || strFields != "")
                return false;
            else
                return true;
        }
        
        function validationPart3(){
            var xboard = document.getElementById("xboard");
            var xpercentage = document.getElementById("xpercentage");
            var xpassyr = document.getElementById("xpassyr");
            var xschlname = document.getElementById("xschlname");
            var xiidiploma = document.getElementById("xiidiploma");
            var xiiboard = document.getElementById("xiiboard");
            var xiipercentage = document.getElementById("xiipercentage");
            var xiipassyr = document.getElementById("xiipassyr");
            var xiischlname = document.getElementById("xiischlname");
            
            var emptyFields = "";
            var strFields = "";
            
            if(!xboard.value)
                emptyFields += xboard.placeholder + "(Class X), ";
            else if(!xboard.checkValidity())
                strFields += xboard.title + " in " + xboard.placeholder + "(Class X).\n";
            
            if(!xpercentage.value)
                emptyFields += xpercentage.placeholder + "(Class X), ";
            else if(!xpercentage.checkValidity())
                strFields += xpercentage.title + " in " + xpercentage.placeholder + "(Class X).\n";
            else if(!isFloat(xpercentage.value))
                strFields += "Enter a valid Percentage(Class X)" + ".\n";
            
            if(!xpassyr.value)
                emptyFields += xpassyr.placeholder + "(Class X), ";
            else if(!xpassyr.checkValidity())
                strFields += xpassyr.title + " in " + xpassyr.placeholder + "(Class X).\n";
 
            if(!xschlname.value)
                emptyFields += xschlname.placeholder + "(Class X), ";
            else if(!xschlname.checkValidity())
                strFields += xschlname.title + " in " + xschlname.placeholder + "(Class X).\n";
            
            if(!xiidiploma.value)
                emptyFields += xiidiploma.placeholder + ", ";
            else if(!xiidiploma.checkValidity())
                strFields += xiidiploma.title + " in " + xiidiploma.placeholder + "field.\n";
            
            if(!xiiboard.value)
                emptyFields += xiiboard.placeholder + "(Class XII), ";
            else if(!xiiboard.checkValidity())
                strFields += xiiboard.title + " in " + xiiboard.placeholder + "(Class XII).\n";
            
            if(!xiipercentage.value)
                emptyFields += xiipercentage.placeholder + "(Class XII), ";
            else if(!xiipercentage.checkValidity())
                strFields += xiipercentage.title + " in " + xiipercentage.placeholder + "(Class XII).\n";
            else if(!isFloat(xiipercentage.value))
                strFields += "Enter a valid Percentage(Class XII)" + ".\n";
            
            if(!xiipassyr.value)
                emptyFields += xiipassyr.placeholder + "(Class XII), ";
            else if(!xiipassyr.checkValidity())
                strFields += xiipassyr.title + " in " + xiipassyr.placeholder + "(Class XII).\n";
            
            if(!xiischlname.value)
                emptyFields += xiischlname.placeholder + "(Class XII), ";
            else if(!xiischlname.checkValidity())
                strFields += xiischlname.title + " in " + xiischlname.placeholder + "(Class XII).\n";
            
            if($('#postgrad').is(':checked')){
                if(!graduniv.value)
                    emptyFields += graduniv.placeholder + ", ";
                else if(!graduniv.checkValidity())
                    strFields += graduniv.title + " in " + graduniv.placeholder + ".\n";
                
                if(!gradclg.value)
                    emptyFields += gradclg.placeholder + ", ";
                else if(!gradclg.checkValidity())
                    strFields += gradclg.title + " in " + gradclg.placeholder + ".\n";
                
                if(!gradstream.value)
                    emptyFields += gradstream.placeholder + ", ";
                else if(!gradstream.checkValidity())
                    strFields += gradstream.title + " in " + gradstream.placeholder + ".\n";
                
                if(!gradpercentage.value)
                    emptyFields += gradpercentage.placeholder + ", ";
                else if(!gradpercentage.checkValidity())
                    strFields += gradpercentage.title + " in " + gradpercentage.placeholder + ".\n";
                else if(!isFloat(gradpercentage.value))
                    strFields += "Enter a valid Graduation Percentage.\n";
                
                if(!gradyr.value)
                    emptyFields += gradyr.placeholder + ", ";
                else if(!gradyr.checkValidity())
                    strFields += gradyr.title + " in " + gradyr.placeholder + ".\n";
            }
    
            if(!($("input[name='postgrad']").is(":checked")))
                strFields += "Please select one of the two options!\n";
    
            if(emptyFields != "" && strFields != "")
                alert(emptyFields + "cannot be empty!\n" + strFields);
            else if(strFields != "")
                alert(strFields);
            else if(emptyFields != "")
                alert(emptyFields + "cannot be empty!\n");
            
            if(emptyFields == "" && strFields == ""){
                var r = confirm("Do you want to move to submit the form?");
                if(r){
                    $('#submit').attr("type", "submit");
                    $('#submit').attr("formaction", "InsertData.jsp");
                }
            }
        }
        
        function rdbtnvldtn(){
            var vp1, vp2, xtra;
            var selected = $('input[name=stage]:checked').attr('id');
                        
            if(selected == "two"){
                vp1 = validationPart1(); 
                xtra = false;
            }
            else if(selected == "three"){
                vp2 = validationPart2(); 
                xtra = true;
            }
                
            if(vp1){
                var r = confirm("Please verify the information entered. You cannot come back to this page again. \n Do you want to move to the section?");
                if(r){
                    $('#one').removeAttr("checked");
                    $('#two').attr("checked", "checked");
                    $('#one').prop("disabled", true);
                    $('#three').prop("disabled", false);
                     window.scrollTo(0, 0);
                }
                else
                    $('#one').prop("checked", true);
            }
            else if(!vp1 && !xtra) 
                $('#one').prop("checked", true);
            
            if(vp2){
                var r = confirm("Please verify the information entered. You cannot come back to this page again. \n Do you want to move to the section?");
                if(r){
                    $('#two').removeAttr("checked");
                    $('#three').attr("checked", "checked");
                    $('#two').prop("disabled", true);
                     window.scrollTo(0, 0);
                }
                else
                    $('#two').prop("checked", true);
            }
            else if(!vp2 && xtra){
                $('#three').prop("checked", false);
                $('#two').prop("checked", true);
            }   
            
        }
        
        $('.register .stages label').click(function() {
            var radioButtons = $('.rdbtn');
            var selectedIndex = radioButtons.index(radioButtons.filter(':checked'));
            selectedIndex = selectedIndex + 1;
        });

        function runNext(a){
            var radioButtons = $('.rdbtn');
            var selectedIndex = radioButtons.index(radioButtons.filter(':checked'));

            selectedIndex = selectedIndex + 2;

            $('.rdbtn:nth-of-type(' + selectedIndex + ')').prop('checked', true);
            
            rdbtnvldtn();
        }
        
       </script>
    </head>
    <body>
        <div class="register container">
            <input id="one" class="rdbtn" type="radio" name="stage" checked />
            <input id="two" class="rdbtn" type="radio" onchange="rdbtnvldtn()" name="stage" />
            <input id="three" class="rdbtn" type="radio" onchange="rdbtnvldtn()" name="stage" disabled/>
            
            <div class="stages">
		<label for="one">1</label>
		<label for="two">2</label>
		<label for="three">3</label>
            </div>
            
            <span class="completion"><span></span></span>
            
            <form id="studentform" name="studentform" action="InsertData.jsp" method="post">
            
                <div class="panels">

                    <div data-panel="one" style=" height:auto;">
                        <h2><center><b> Personal Information</b></center></h2><br>

                        <span class="form1_item form-group field">
                            <input type="text" id="enrollnum" value="<%=eno%>" name="enrollnum" class="form-control" placeholder="Enrollment Number" onkeydown="return false;" />
                            <label for="enrollnum">Enrollment Number</label>
                        </span>
                        <span class="form1_col1 form-group field">
                            <input type="text" id="fname" class="form-control" placeholder="First Name" maxlength="50" pattern="[A-Za-z\s]+" title="Only alphabets are allowed" name="fname"/>
                            <label for="fname">First Name</label>
                        </span>
                        <span class="form1_col2 form-group field">
                            <input type="text" id="lname" class="form-control" placeholder="Last Name" maxlength="50" pattern="[A-Za-z\s]+" title="Only alphabets are allowed" name="lname"/>
                            <label for="lname">Last Name</label>
                        </span>
                        <span class="form1_col1 form-group field ">
                            <select id="department" name="department" class="form-control">
                              <option value="CSE">CSE</option>
                              <option value="ECE">ECE</option>
                              <option value="IT">IT</option>
                              <option value="MAE">MAE</option>
                            </select>
                            <label for="department">Department</label>
                        </span>
                        <span class="form1_col2 form-group field ">
                            <select id="course" name="course" class="form-control">
                              <option value="BTech">BTech</option>
                              <option value="MTech">MTech</option>
                              <option value="MCA">MCA</option>
                            </select>
                            <label for="course">Course</label>
                        </span>
                        <span class="form1_col1 form-group field">
                            <input type="date" id="dob" class="form-control" placeholder="Date of Birth(dd/mm/yyyy)" name="dob">
                            <label for="dob">Date of Birth(dd/mm/yyyy)</label>
                        </span>
                        <span class="form1_col2 form-group field">
                            <select id="category" name="category" class="form-control">
                              <option value="General">General</option>
                              <option value="SC">SC</option>
                              <option value="ST">ST</option>
                              <option value="OBC">OBC</option>
                            </select>
                            <label for="category">Category</label>
                        </span>
                        <span class="form1_item form-group field">
                            <input type="text" id="aadharnum" class="form-control" placeholder="Aadhar Number" minlength="12" maxlength="12" pattern="[0-9]+" title="Only numeric values are allowed" name="aadharnum"/>
                            <label for="aadharnum">Aadhar Number</label>
                        </span>
                        <span class="form1_item form-group field">
                            <input type="text" id="permaddr" class="form-control" placeholder="Permanent Address" maxlength="100" name="permaddr"/>
                            <label for="permaddr">Permanent Address</label>
                        </span>
                        <span class="form1_item form-group field">
                            <input type="text" id="tempaddr" class="form-control" placeholder="Temporary Address" maxlength="100" name="tempaddr" />
                            <label for="tempaddr">Temporary Address</label>
                        </span>
                        <span class="form1_col1 form-group field">
                            <input type="text" id="contact" minlength="10" class="form-control" maxlength="10" placeholder="Contact" name="contact" pattern="[789][0-9]{9}" title="Only numeric values are allowed"/>
                            <label for="contact">Contact</label>
                        </span>
                        <span class="form1_col2 form-group field">
                            <input type="text" id="altcontact" minlength="10" maxlength="10" class="form-control" placeholder="Alternate Contact" name="altcontact" pattern="[789][0-9]{9}" title="Only numeric values are allowed" />
                            <label for="altcontact">Alternate Contact</label>
                        </span>
                        <span class="form1_col1 form-group field">
                            <input type="email" id="email" class="form-control"  placeholder="Email ID" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" maxlength="100" name="email"/>
                            <label for="email">Email ID</label>
                        </span>
                        <span class="form1_col2 form-group field">
                            <input type="email" id="altemail" placeholder="Alternate Email ID" maxlength="100" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" class="form-control" name="altemail" />
                            <label for="altemail">Alternate Email ID</label>
                        </span>
                        <button type="button" onclick="runNext(2)" class="sbutton btn">Next</button>
                    </div>
                    <div data-panel="two">
                        <center><h2><b>Parent Contact Details</b></h2><br></center>

                        <span class="form1_item form-group field">
                            <input type="text" id="fathname" class="form-control"  placeholder="Father's Name" maxlength="50" name="fathname" pattern="[A-Za-z\s]+" title="Only alphabets are allowed" />
                            <label for="fathname">Father's Name</label>
                        </span>
                        <span class="form1_item form1_col1 form-group field">
                            <input type="text" id="fathoccptn" class="form-control" placeholder="Father's Occupation" maxlength="50" name="fathoccptn" pattern="[A-Za-z\s]+" title="Only alphabets are allowed"/>
                            <label for="fathoccptn">Father's Occupation</label>
                        </span>
                        <span class="form1_item form1_col2 form-group field">
                            <input type="text" id="fathcntct" class="form-control"  placeholder="Father's Contact" name="fathcntct" minlength="10" maxlength="10" pattern="[789][0-9]{9}" title="Only numeric values are allowed" />
                            <label for="fathcntct">Father's Contact</label>
                        </span>
                        <span class="form1_item form-group field">
                            <input type="text" id="fathoffaddr" class="form-control" maxlength="100" placeholder="Father's Office Address" name="fathoffaddr"/>
                            <label for="fathoffaddr">Father's Office Address</label>
                        </span>
                        <br><br><br><br><br><br><br><br><br><br><br>
                        <span class="form1_item form-group field">
                            <input type="text" id="mothname" class="form-control" maxlength="50" placeholder="Mother's Name" name="mothname" pattern="[A-Za-z\s]+" title="Only alphabets are allowed" />
                            <label for="mothname">Mother's Name</label>
                        </span>
                        <span class="form1_item form1_col1 form-group field">
                            <input type="text" id="mothoccptn" class="form-control" maxlength="50" placeholder="Mother's Occupation" name="mothoccptn" pattern="[A-Za-z\s]+" title="Only alphabets are allowed"/>
                            <label for="mothoccptn">Mother's Occupation</label>
                        </span>
                        <span class="form1_item form1_col2 form-group field">
                            <input type="text" id="mothcntct" class="form-control"  placeholder="Mother's Contact" name="mothcntct" minlength="10" maxlength="10" pattern="[789][0-9]{9}" title="Only numeric values are allowed"/>
                            <label for="mothcntct">Mother's Contact</label>
                        </span>
                        <span class="form1_item form-group field">
                            <input type="text" id="mothoffaddr" class="form-control" maxlength="100" placeholder="Mother's Office Address" name="mothoffaddr"/>
                            <label for="mothoffaddr">Mother's Office Address</label>
                        </span>

                        <button type="button" onclick="runNext(3)" class="sbutton btn btn-default">Next</button>


                    </div>
                    <div data-panel="three">
                        <center><h2><b>Class X</b></h2></center><br>
                        <span class="form1_item form-group field">
                            <input type="text" id="xboard" class="form-control" placeholder="Board" maxlength="4" name="xboard" pattern="[A-Za-z\s]+" title="Only alphabets are allowed" />
                            <label for="xboard">Board</label>
                        </span>
                        <span class="form1_item form1_col1 form-group field">
                            <input type="value" id="xpercentage" class="form-control" maxlength="5" placeholder="Percentage" name="xpercentage" pattern="[0-9]*\.?[0-9]*" title="Only numeric values are allowed"/>
                            <label for="xpercentage">Percentage</label>
                        </span>
                        <span class="form1_item form1_col2 form-group field">
                            <input type="text" id="xpassyr" placeholder="Passing Year" class="form-control" minlength="4" maxlength="4" name="xpassyr" pattern="[0-9]+" title="Only numeric values are allowed" />
                            <label for="xpassyr">Passing Year</label>
                        </span>
                        <span class="form1_item form-group field">
                            <input type="text" id="xschlname" placeholder="School Name" class="form-control" maxlength="100" name="xschlname" pattern="[A-Za-z\s]+" title="Only alphabets are allowed" />
                            <label for="xschlname">School Name</label>
                        </span>

                         <br><br><br><br><br><br><br><br><br><br>
                         <center><h2 style="margin-left: 0px;"><b>Class XII/Diploma</b></h2><br></center>   

                        <span class="form1_item form1_col1 form-group field">
                            <input type="text" id="xiidiploma" placeholder="XII/Diploma" class="form-control" name="xiidiploma" pattern="[A-Za-z\s]+" title="Only alphabets are allowed" >
                            <label for="xiidiploma">XII/Diploma</label>
                        </span>
                        <span class="form1_item form1_col2 form-group field">
                            <input type="text" id="xiiboard" placeholder="Board" name="xiiboard" maxlength="4" class="form-control" pattern="[A-Za-z\s]+" title="Only alphabets are allowed"/>
                            <label for="xiiboard">Board</label>
                        </span>
                        <span class="form1_item form1_col1 form-group field">
                            <input type="value" id="xiipercentage" maxlength="5" placeholder="Percentage" name="xiipercentage" class="form-control" pattern="[0-9]*\.?[0-9]*" title="Only numeric values are allowed"/>
                            <label for="xiipercentage">Percentage</label>
                        </span>
                        <span class="form1_item form1_col2 form-group field">
                            <input type="text" id="xiipassyr" placeholder="Passing Year" name="xiipassyr" class="form-control" minlength="4" maxlength="4" pattern="[0-9]+" title="Only numeric values are allowed"/>
                            <label for="xiipassyr">Passing Year</label>
                        </span>
                        <span class="form1_item form-group field">
                            <input type="text" id="xiischlname" class="form-control" maxlength="100" placeholder="School Name" name="xiischlname" pattern="[A-Za-z\s]+" title="Only alphabets are allowed" >
                            <label for="xiischlname">School Name</label>
                        </span>
                        <script>
                            function func(a) {
                                var postgradDisplay  = document.getElementById("A");

                                if(a == 1)   
                                    postgradDisplay.style.display  = "block";  
                                else 
                                    postgradDisplay.style.display  = "none"; 
                            }  
                        </script>
                           <br><br><br><br>
                            <span class="form_item">
                               <br><br><br><br><br><br><br>
                                <h4 style="margin-left:0px">Are you a Postgraduate?</h4>
                                <label class="radio-inline"><input type="radio" id="postgrad" name="postgrad" onchange="func(1)" value="postgrad">&nbsp; &nbsp; &nbsp; &nbsp;  Yes</label>
                                <label class="radio-inline"><input type="radio" id="undergrad" name="postgrad" onchange="func(2)" value="undergrad"> &nbsp; &nbsp; &nbsp; &nbsp; No</label>
                            </span>

                            <span id="A" style="display:none;">
                                <center><h2 style="margin-left:0px;"><b>Undergraduate</b></h2><br></center>

                                <span class="form1_item form_col1 form-group field">
                                    <input type="text" id="graduniv" class="form-control" placeholder="Graduation University" maxlength="50" name="graduniv" pattern="[A-Za-z\s]+" title="Only alphabets are allowed" />
                                    <label for="graduniv">Graduation University</label>
                                </span>
                                <span class="form1_item form_col2 form-group field">
                                    <input type="text" id="gradclg" class="form-control"  placeholder="Graduation College" maxlength="50" name="gradclg" pattern="[A-Za-z\s]+" title="Only alphabets are allowed" />
                                    <label for="gradclg">Graduation College</label>
                                </span>
                                <span class="form1_item form-group field">
                                    <input type="text" id="gradstream" class="form-control" placeholder="Graduation Stream" maxlength="50" name="gradstream" pattern="[A-Za-z\s]+" title="Only alphabets are allowed"/>
                                    <label for="gradstream">Graduation Stream</label>
                                </span>
                                <span class="form1_item form_col1 form-group field">
                                    <input type="value" id ="gradpercentage" maxlength="5" class="form-control" placeholder="Graduation Percentage" name="gradpercentage" pattern="[0-9]*\.?[0-9]*" title="Only numeric values are allowed"/>
                                    <label for="gradpercentage">Graduation Percentage</label>
                                </span>
                                <span class="form1_item form_col2 form-group field">
                                    <input type="text" id="gradyr" class="form-control" placeholder="Graduation Year" minlength="4" maxlength="4" pattern="[0-9]{4}" title="Only numeric values are allowed"  name="gradyr" />
                                    <label for="gradyr">Graduation Year</label>
                                </span>
                        </span>
                        <button type="button" onclick="validationPart3()" id="submit" class="sbutton btn btn-default">Submit</button>
                    </div>
                </div>
            </form>
            <!-- Modal -->
            <div class="modal fade" id="AlertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="exampleModalLabel"> </h3>
                            <br><br>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Okay</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--End of Modal -->
            <!-- Modal -->
            <div class="modal fade" id="ConfirmModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="ModalLabel"> </h3>
                            <br><br>
                            <button type="button" class="btn btn-secondary" id="modal-close" data-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-primary" id="modal-continue">Yes, Continue</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--End of Modal -->
        </div>
    </body>
</html>