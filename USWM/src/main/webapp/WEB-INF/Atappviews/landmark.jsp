<%-- 
<%@page import="java.util.List"%>
<%@page import="com.agiledge.atom.entities.*"%>
<%@page import="com.agiledge.atom.config.files.OtherFunctions"%>
<%@page import="com.agiledge.atom.constants.AuditLogConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Landmarks</title>
<script type="text/javascript" src="js/jquery-latest.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.js"></script>
<script type="text/javascript" src="js/dateValidation.js"></script>
</head>
<body>
	<%
         /*  long empid=0;
        String employeeId = OtherFunctions.checkUser(session);
        if (employeeId == null||employeeId.equals("null") ) {
            String param = request.getServletPath().substring(1) + "___"+ request.getQueryString(); 	response.sendRedirect("index.jsp?page=" + param);
        } else {
            empid = Long.parseLong(employeeId); */
            %>
	<%@include file="Header.jsp"%>
	<%
        /* }
        OtherDao ob = null;
        ob = OtherDao.getInstance(); */
    %>

	<script type="text/javascript">
        // validate landmark
      
        
       	$(document).ready(function() {

		$("form[name=place]").hide();
		$("form[name=editLandmark]").hide();
		$("form[name=landmark]").hide();
		$("#showAddLandmarkDiv_a").click(showAddLandmark);
		$("#closeAddLandmark_img").click(closeAddLandmark);
		$(".editButton").click(showEditLandmark);
		$("form[name=landmark]").draggable();
	});

	//--------------
	function showAddLandmark() {
		$("#landmark").val("");
		$("form[name=editLandmark]").attr("action", "addLandmark");
		$("#windowTitle").text("Add Landmark");
		$("#showAddLandmarkDiv").hide();
		$("form[name=landmark]").show();
		$("#submitbtn").val("Add");
	}
	function closeAddLandmark() {

		$("#showAddLandmarkDiv").show();
		$("form[name=landmark]").hide();
		$("form[name=landmark]").attr("action", "#");
	}

	function showEditLandmark() {
		try {
			$("form[name=landmark]").show();
			$("form[name=landmark]").attr("action", "updateLandmark");
			$("#windowTitle").text("Edit Landmark");
			$("#submitbtn").val("Update");

			$("input[name=landmarkId]").val(
					$(this).parent().parent().children().children(".landmarkId")
							.val());
			$("#landmark").val(
					$(this).parent().parent().children().children(".landmark")
							.val());

		} catch (e) {
			alert(e);
		}
	}

	//-----validation

	//--------------

	function validateLandmark() {

		var flag = true;

		try {
			if ($("input[name=landmark]").val().trim() == "") {
				alert("Landmark should not be blank");
				flag = false;
			}else if(/^[A-Za-z0-9]+[A-Za-z0-9&\s\.\,\/\-\_:\(\)\[\]]*$/.test($("input[name=landmark]").val().trim())==false) {
				alert("Landmark includes invalid data");
				flag = false;
			}
		} catch (e) {

			alert(e.message);
			flag = false;
		}
		return flag;

	}
    function showAuditLog(relatedId,moduleName){
		var params = "toolbars=no,menubar=no,location=no,scrollbars=yes,resizable=yes";
		var size = "height=450,width=900,top=200,left=300," + params;
		var url="showAuditLog?relatedNodeId="+relatedId+"&moduleName="+moduleName;	
	    newwindow = window.open(url, 'AuditLog', size);

		if (window.focus) {
			newwindow.focus();
		}
	}
           
        </script>
	<%
            int placeId = Integer.parseInt("" + request.getParameter("placeId"));

            List<Landmark> landmarkList = (List<Landmark>)request.getAttribute("landmarkList");
            Place place = (Place)request.getAttribute("place");
           
        %>
	<div id="body">
		<div class="content">





			<h3>
				Landmark under
				<%=place.getPlace() %></h3>
			<hr />
	
 	<iframe  style="float: right; width: 48%" height="500px" src="marklandmark?place=<%=placeId%>" ></iframe>
 	  
			<table style="width: 50%">
				<tr>
					<td style="border-bottom: 1px solid #ccc; vertical-align: top;"
						width="70%">
						<table style="width: 100%;">
							<thead>
								<tr>
									<th align="center">Id</th>
									<th colspan="2">Landmark</th>
									<th align="center">Audit Log</th>
								</tr>
							</thead>
							<%
								for (Landmark landmark : landmarkList) {
							%>
							<tr>
								<td align="center"><%=landmark.getId()%> <input
									type="hidden" class="landmarkId"
									value="<%=landmark.getId()%>" /> <input type="hidden"
									class="landmark" value="<%=landmark.getLandmark()%>" /></td>
								<td align="center"><%=landmark.getLandmark()%></a></td>
								<td id="modifyLandmarkLabel<%=landmark.getId()%>"><img
									src="images/edit.png" class="editButton" title="Edit" /></td>
								<TD id="modifyLandmark<%=landmark.getId()%>"
									style="display: none"></TD>
								<td align="center"><input type="button" class="formbutton"
									onclick="showAuditLog(<%=landmark.getId()%>,'<%=AuditLogConstants.APL_MODULE%>');"
									value="Audit Log" /></td>
							</tr>
							<%
								}
							%>
						</table>
					</td>
					<td width="30%"
						style="border-bottom: 0px solid #000; vertical-align: top;">

						<div id="showAddLandmarkDiv" style="padding-top: 3px;">
							<input type="button" class="formbutton" id="showAddLandmarkDiv_a"
								title="sdfsdf" value="Add Landmark" />

						</div>


						<form name="landmark" action="addLandmark"
							onsubmit="return validateLandmark();" method="post">


							<table style="border-style: outset; width: 20%;">
								<thead>
									<tr>
										<th colspan="2"><label id="windowTitle">Add
												Landmark</label>
											<div style="float: right;" id="closeAddLandmark">
												<img id="closeAddLandmark_img" style="float: right;"
													id="closeAddLandmark" src="images/close.png" title="Close" />
											</div></th>
									</tr>
								</thead>
								<tr>
									<td align="center">Landmark</td>
									<td align="center"><input type="hidden" name="landmarkId"
										value="" /> <input type="hidden" value="<%=placeId%>"
										name="placeId" /> <input type="text" name="landmark"
										id="landmark" /></td>
								</tr>
								<tr>
									<td align="center">&nbsp;</td>
									<td align="center"><input type="submit" class="formbutton"
										value="Add" name="submitbtn" id="submitbtn" /></td>
								</tr>
								<tr>
									<td align="center"></td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
			</table>

			<%@include file="Footer.jsp"%>
		</div>
	</div>
</body>
</html>

 --%>