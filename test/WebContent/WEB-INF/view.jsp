<!DOCTYPE html>
<html>
<head>
	<title>CHADAD</title>
	<style type="text/css">
	
	.page-footer {
        background-color: blue;
    }
		
  	body {
    	display: flex;
    	min-height: 100vh;
    	flex-direction: column;
  	}

  	main {
    	flex: 1 0 auto;
  	}
	</style>
	<meta name = "viewport" content = "width = device-width, initial-scale = 1">      
      <link rel = "stylesheet"
         href = "https://fonts.googleapis.com/icon?family=Material+Icons">
      <link rel = "stylesheet"
         href = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
      <script type = "text/javascript"
         src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>           
      <script src = "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js">
      </script> 

      <script type="text/javascript">  
      	$(document).ready(function() {
    $('select').material_select();
});
      </script>
      
      <%
      		String db = (String) request.getAttribute("db");
      %>
      
      <script>
			function show(str) {
			  var xhttp;    
			  if (str == "") {
			    document.getElementById("txtHint").innerHTML = "";
			    return;
			  }
			  xhttp = new XMLHttpRequest();
			  xhttp.onreadystatechange = function() {
			    if (this.readyState == 4 && this.status == 200) {
			      document.getElementById("txtHint").innerHTML = this.responseText;
			    }
			  };
			  xhttp.open("GET", "/test/show?q="+str+"&p=${db}", true);
			  xhttp.send();
			}
	</script>




	
</head>
<body>

	
	<!-- 
	<nav class="nav-extended">
    <div class="nav-wrapper">
      <a href="#" class="brand-logo">Logo</a>
      <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="sass.html">Sass</a></li>
        <li><a href="badges.html">Components</a></li>
        <li><a href="collapsible.html">JavaScript</a></li>
      </ul>
    </div>
    <div class="nav-content">
      <ul class="tabs tabs-transparent">
        <li class="tab"><a href="#test1">Test 1</a></li>
        <li class="tab"><a class="active" href="#test2">Test 2</a></li>
        <li class="tab disabled"><a href="#test3">Disabled Tab</a></li>
        <li class="tab"><a href="#test4">Test 4</a></li>
      </ul>
    </div>
  </nav>

  <ul class="sidenav" id="mobile-demo">
    <li><a href="sass.html">Sass</a></li>
    <li><a href="badges.html">Components</a></li>
    <li><a href="collapsible.html">JavaScript</a></li>
  </ul>

  <div id="test1" class="col s12">Test 1</div>
  <div id="test2" class="col s12">Test 2</div>
  <div id="test3" class="col s12">Test 3</div>
  <div id="test4" class="col s12">Test 4</div>
  -->
	
	 <nav class="teal">
    <div class="nav-wrapper">
      <a href="#" class="brand-logo">Reference Spatiale</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="show">Show</a></li>
        <li><a href="../print">Print</a></li>
        <li><a href="collapsible.html">JavaScript</a></li>
      </ul>
    </div>
  </nav>
	
	<h1 class="center-align" >Plateforme CM</h1>
	
	<form action="/test/bon">
		<div class="input-field col s12">
		    <select name="DB" id="DBSelect">
		      <option value="" disabled selected>Select your DataBase</option>
		      <%@ page import="java.util.*" %>>
		      <%
			      	ArrayList<String> DBs = (ArrayList<String>) request.getAttribute("DBs");
		      		
		      		for(int i = 0;i<DBs.size();i++){
		      			out.println("<option value="+DBs.get(i)+">"+DBs.get(i)+"</option>");
		      		}
		      %>
		    </select>
		    <label></label>
		</div>
	    <p>
	      <label>
	        <input id="choice_1" name="RequestType" type="radio" value="Spatiale" checked />
	        <label for="choice_1">Spatiale<label>
	      </label>
	    </p>
	    <p>
	      <label>
	        <input id="choice_2" name="RequestType" type="radio" value="Attributaire" />
	        <label for="choice_2">Attributaire </label>
	      </label>
	    </p>
	    <p></p>
	  	<button class="btn waves-effect waves-light" type="submit">Submit
	    	<i class="material-icons right">send</i>
	  	</button>
	  	
	  	
	  	<%
	  		ArrayList<String> tables = (ArrayList<String>) request.getAttribute("tables");
	        boolean wach9lbti = (boolean) request.getAttribute("wach9lbti");
	        String RequestType = (String) request.getAttribute("requestType");
	        
	        //out.println((String) request.getAttribute("requestType"));
	        if (RequestType!=null){
	        	if (RequestType.equals("Spatiale")){
		        	if (!tables.isEmpty()){
		  				out.println("<div class=\"input-field col s12\">");
		  				out.println("<select name=\"tablesSource\" id=\"tablesSeletSource\">");
		  				out.println("<option value=\"\" disabled selected>Select Source Layer</option>");
		  				for(int i=0;i<tables.size();i++){
		  					out.println("<option value="+tables.get(i)+">"+tables.get(i)+"</option>");
		  				}
		  				
		  				out.println("</select>");
		  				out.println("</div >");
		  				
		  				out.println("<br>");
		  				
		  				out.println("<div class=\"input-field col s12\">");
		  				out.println("<select name=\"tablesCible\" id=\"tablesSeletCible\">");
		  				out.println("<option value=\"\" disabled selected>Select Cible Layer</option>");
		  				for(int i=0;i<tables.size();i++){
		  					out.println("<option value="+tables.get(i)+">"+tables.get(i)+"</option>");
		  				}
		  				out.println("</select>");
		  				out.println("</div >");
		  			}
		  			else if(wach9lbti){
		  				out.println("<div> <h4>Makain walo hna !</h4> </div >");
		  			}
		       	}
		        else {
		        	
		        	if (!tables.isEmpty()){
		  				out.println("<div class=\"input-field col s12\">");
		  				out.println("<select name=\"tables\" id=\"tablesSelet\" onchange=\"show(this.value)\">");
		  				
		  				out.println("<option value=\"\" disabled selected>Select Layers</option>");
		  				for(int i=0;i<tables.size();i++){
		  					out.println("<option value="+tables.get(i)+">"+tables.get(i)+"</option>");
		  				}
		  				
		  				out.println("</select>");
		  				out.println("</div >");
		  			}
		  			else if(wach9lbti){
		  				out.println("<div> <h4>Makain walo hna !</h4> </div >");
		  			}
		        }	
	        }
	        else{
	        	out.println("<h2>wiiiiiiiiiiiiiiii3</h2>");
	        }
	        
  			
  		
	  	%>
	  	
	  	
	  	<div id="txtHint">Customer info will be listed here...</div>
	  	
	  	<div>
	  	bla bla bla bla chadad chadad issam issam
	  	
	  	</div>
	  	<div>
	  	bla bla bla bla chadad chadad issam issam
	  	
	  	</div>
	  	<div>
	  	<p>
	  	bla bla bla bla chadad chadad issam issam
	  	</p>
	  	</div>
	  	
	  	<footer class="page-footer teal darken-2">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">CM Products</h5>
                <p class="grey-text text-lighten-4">
                This Plateform created to use ESRI's JavaScript API, without ArcGIS SERVER services.
                <br/>
                Contact chadad.mohamed@gmail.com | c.mohamed5
                </p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Links</h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="http://www.referencespatiale.com">Reference Spatiale</a></li>
                  <li><a class="grey-text text-lighten-3" href="https://developers.arcgis.com/documentation">ESRI JS API documentation</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">wiki how</a></li>
                  <li><a class="grey-text text-lighten-3" href="https://github.com/CMohamed/StageRefSpatiale">Project Git's repository</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            © 2018 Copyright by CM
            <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
            </div>
          </div>
        </footer>
  </form>
</body>
</html>