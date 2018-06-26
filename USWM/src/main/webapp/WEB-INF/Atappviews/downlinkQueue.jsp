 <%--
    Author     : Vikky
--%>

 <%@page import="java.util.*"%>
<%@page import="com.team.app.domain.*"%>
<%@page import="com.team.app.dto.*"%>
<%@page import="org.displaytag.decorator.TotalTableDecorator"%>
<%@page import="org.displaytag.decorator.MultilevelTotalTableDecorator"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
 <%@ page buffer = "900kb" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE html >
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Downlink Queue</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/custom_siemens.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="css/AdminLTE.min.css">
<link rel="stylesheet" href="css/skins/_all-skins.min.css">
<link rel="stylesheet" href="css/slider.css">

<script type="text/javascript" src="js/jquery-latest.js"></script>
<script  src="https://code.jquery.com/jquery-2.2.0.js"></script>
<script type="text/javascript" src="js/jquery-latest.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="js/app.min.js"></script>
<script src="js/demo.js"></script>
<script src="js/scroller.js"></script>
 <script type="text/javascript">
   
   function confirmValidate(){
	   
	   var orgid=document.getElementById("orgid").value;
 	  	var appid=document.getElementById("appid").value;
 	  	var devid=document.getElementById("devid").value;
 		
	   	   
	   if(orgid=="0"){
		   alert("Please select organisation!");
		   return false;
	   }else if(appid=="0"){
		   alert("Please select application!");
		   return false;
	   }else if(devid=="0"){
		   alert("Please select devEUI!");
		   return false;
	   }/* else{		   
			   $.ajax({
	               url: 'syncDev',
	               type: 'POST',
	               //data: 'orgId='+orgid+'&appId='+appid+'&devId='+devid,
	               data: jQuery.param({ orgId: orgid, appId : appid, devId : devid}) ,
	               success: function (data) {
	               alert(data);
	               window.location.reload();
	            	   //$(".success").html(data);
	                   	
	                   },
	  		 		error: function(e){
	  	     			        alert('Error: ' + e);
	  	     		 }
	
	                  
	               });
			   
			  return false;
	   		}  */
	   		
   }
   
function getAppByOrgID()
{    
            	var orgid=document.getElementById("orgid").value;
            	
            	if(orgid=="0")
                	{      
            	
                	var appid=document.getElementById("appid");
                	var devid=document.getElementById("devid");
                		appid.innerHTML='<select name="appname" id="appid" onchange="getDevEUIByAppID()"> <option value="0" >--Choose Application--</option></select>';
                		devid.innerHTML='<select name="devname" id="devid"> <option value="0" >--Choose Device EUI--</option></select>';
                		return;
                	}
                else
                	{
                	                
                var url="getApplications?orgId="+orgid;                                    
                xmlHttp=GetXmlHttpObject()
                if (xmlHttp==null)
                {
                    alert ("Browser does not support HTTP Request");
                    return
                }                    
                xmlHttp.onreadystatechange=setApplication;	
                xmlHttp.open("GET",url,true);                
                xmlHttp.send(null);
                
                	}
 }
            
            
function getDevEUIByAppID()
{     
	var appid=document.getElementById("appid").value;
	
	if(appid=="0")
    	{                	
    	var devid=document.getElementById("devid");
    		devid.innerHTML='<select name="devname" id="devid"> <option value="0" >--Choose Device EUI--</option></select>';
    	return;
    	}
    else
    	{
    var url="getDevEUI?appId="+appid;                                    
    xmlHttp=GetXmlHttpObj()
    if (xmlHttp==null)
    {
        alert ("Browser does not support HTTP Request");
        return
    }                    
    xmlHttp.onreadystatechange=setDevEUI;	
    xmlHttp.open("GET",url,true);                
    xmlHttp.send(null);
    
    	}
}
                
            function GetXmlHttpObject()
            {
                var xmlHttp=null;
                if (window.XMLHttpRequest) 
                {
                    xmlHttp=new XMLHttpRequest();
                }                
                else if (window.ActiveXObject) 
                { 
                    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                }

                return xmlHttp;
            }
            
            
            function GetXmlHttpObj()
            {
                var xmlHttp=null;
                if (window.XMLHttpRequest) 
                {
                    xmlHttp=new XMLHttpRequest();
                }                
                else if (window.ActiveXObject) 
                { 
                    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                }

                return xmlHttp;
            }
        
            function setApplication() 
            {                      
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                { 
                    var returnText=xmlHttp.responseText;
                    var appid=document.getElementById("appid");
                    appid.innerHTML='<select  name="appname" id="appid" onchange="getDevEUIByAppID()"><Option value="0">--Choose Application--</Option>'+returnText+'</select>';                                             
                }
            }
            
            function setDevEUI() 
            {                      
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                { 
                    var returnText=xmlHttp.responseText;
                    var devid=document.getElementById("devid");
                    devid.innerHTML='<select  name="devname" id="devid"><Option value="0">--Choose Device EUI--</Option>'+returnText+'</select>';                                             
                }
            }
     </script>       
</head>

<body class="hold-transition skin-blue sidebar-mini">
						<% TblUserInfo userSession = (TblUserInfo) request.getSession().getAttribute("user");
			            if (userSession == null){
			                response.sendRedirect("/");
			            }
						String fname1=("DownlinkQueue :").concat(new Date().toString()).concat(".csv");
						String fname2=("DownlinkQueue :").concat(new Date().toString()).concat(".xls");
						String fname3=("DownlinkQueue :").concat(new Date().toString()).concat(".xml");
						
						String orgName=request.getAttribute("name").toString();
			  			String orgId=request.getAttribute("id").toString();
						
						List<DownlinkQueue> downlinkQueueList=(List<DownlinkQueue>)request.getAttribute("downlinkQueueList");
						%>
	
<div class="wrapper">  
<%@include file="Header.jsp"%> 
  		<div class="content-wrapper">
		
			<section class="content">
		 		<div class="content-wrap box box-primary">
		 			
			 		
						
						<div class="row">
							<div class="col-sm-12 text-right ">	
							   <img src="images/user_iocn_header.png" />&nbsp;<b>Welcome <%=userSession.getUname()%></b> <a href="logout"><img src="images/logout_icon_header.png" /><b>Log Out</b></a>
							</div>
													
						</div><br/>
					
					
						<div class="row">
								<div class="col-sm-8 page-heading mar-top-20">
								<i class="fa fa-download"></i>
								<h5 class="text-blue text-semi-bold"><b>Downlink Queue</b></h5>
								</div>
													
						</div><br/>
						
							<div class="row" >
    				    		<div class="col-sm-12">	
    				    	
    				    	<form name="form1" action="downlinkQueSubmit" onsubmit="return confirmValidate();" method="post">
										
								  <table class="table">
								 							 	
								  	<tr>
								  		<td align="right"><b>Organization</b></td>
								  			<%-- <td><input type="text" value="<%=orgName%>"  class="formbutton" id="<%=orgId%>" name="orgName" /></td>--%>
										
										<td>
										 <select name="orgname" id="orgid" onchange="getAppByOrgID()">
										    <option value="0">--Choose Organisation--</option>	
										    <option value="<%=orgId%>"><%=orgName%></option>
										 </select> 
										</td>
									</tr>
									<tr>	
									   <td align="right"><b>Applications</b></td>
									   
										 <td>
										 	<select name="appname" id="appid" onchange="getDevEUIByAppID()">
										    	<option value="0">--Choose Application--</option>	
										    </select> 
										</td>
									</tr>
									
									<tr>	
									   <td align="right"><b>Device EUI</b></td>
									   
										 <td>
										 	<select name="devname" id="devid" >
										    	<option value="0">--Choose Device EUI--</option>	
										    </select> 
										</td>
									</tr>
									<tr>	
										<td align="right"></td>
											<td> <input type="submit"  class="formbutton text-bold " style="background-color:#3c8dbc; " value="Downlink"/></td>
										 
									</tr>	
																		
								  </table>	
							 </form> 
							</div>	
					   </div>		
						
						
						
						<div class="row" style="overflow-y: auto;">
							<div class="col-sm-12 ">	
												
					     	<display:table  class="table table-hover  text-center"  name="<%=downlinkQueueList%>" id="row"
									export="true" requestURI="" defaultsort="1" defaultorder="descending" pagesize="100">
							<display:column  property="id" title="ID" sortable="true" headerClass="sortable" />
							<display:column  property="devEui" title="DevEUI" sortable="true"  />
							<display:column  property="confirmed" title="Confirmed" sortable="true"  />
							<display:column  property="pending" title="Pending" sortable="true"  />
							<display:column  property="fport" title="fPort" sortable="true"  />
							<display:column  property="data" title="Data" sortable="true"  />
							<display:column  property="reference" title="Reference" sortable="true"  />
							<display:column  property="createdAt" title="CreatedDt"  sortable="true"  />
							
								
									
								     		   
						 	<display:setProperty name="export.csv.filename" value="<%=fname1%>" />
							<display:setProperty name="export.excel.filename" value="<%=fname2%>" />
							<display:setProperty name="export.xml.filename" value="<%=fname3%>" /> 
						</display:table> 
							</div>
						</div>
						<a  id="goTop"><i class="fa fa-eject"></i></a>	
				 </div>
			</section>	
			<%@include file="Footer.jsp"%>  		
	</div>	
</div>
		 
		
</body>
</html> 