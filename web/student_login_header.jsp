<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/header.css">
  <script>
    $(document).ready(function() {
      var url = window.location;
      // Will only work if string in href matches with location
      $('ul.nav a[href="' + url + '"]').parent().addClass('active');
      // Will also work for relative and absolute hrefs
      $('ul.nav a').filter(function() {
        return this.href == url;
      }).parent().addClass('active').parent().parent().addClass('active');
    });
  </script>
  <style>
    #logo {
      margin-left: 68%;
      margin-top: 2%;
      margin-bottom: 2%;
    }

    #headings {
      line-height: 1.4em;
      margin-top: 1.2%;

    }
    
    #igdtu{
        font-size:1.5em; 
        color:green;
    }
    @media (max-width: 767px) {
        .desc {
            display: none;
        }
        #logo{
            width:18%;
            margin-left: 0em;
            margin-top: 0em;
            margin-bottom: 0em;
        }
        #igdtu{
            font-size: 1.2em;
        }
        .headings{
            margin-top: 0em;
        }
    }
  </style>
</head>

<body>
  <div class="container-fluid">
    <div class="row">
      <span class="col-sm-2">
          <center><img id="logo" src="igdtuw.png" width="50%"></center>
    </span>
      <div class="col-sm-8" id="headings">
        <center>
          <p id="igdtu" style=""><b>INDIRA GANDHI DELHI TECHNICAL UNIVERSITY FOR WOMEN</b></p>
          <div class="desc">
            <p style="font-size:1em;"><b>(Established by Govt. of Delhi vide Act 9 of 2012)</b></p>
            <p style="font-size:1.3em; color:black;"><b>TRAINING AND PLACEMENT PORTAL</b></p>
        </center>
        </div>
      </div>
    </div>

    <div id="navigation">
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li id="home"><a href="student_login.jsp">HOME</a></li>
                <li id="why_igdtuw" ><a href="screen_why.jsp?page=student">WHY IGDTUW</a></li>
                <li id="stats" ><a href="screen.stats.jsp?page=student">PLACEMENT STATS</a></li>
                <li id="placements" ><a href="screen.placements.jsp?page=student">PLACEMENTS</a></li>
                <li id="contact_us" ><a href="contact.jsp?page=student">CONTACT US</a></li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
</body>
</html>