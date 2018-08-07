<!DOCTYPE html>
<html>
<head>
	<title>CHADAD</title>
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
	<h1>Plateforme CM</h1>

	
	
	

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
  </form>
</body>
</html>