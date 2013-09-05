<%@include file="taglib_includes.jsp" %>

<html>
<head>
    <script type="text/javascript" src="js/clientInfo.js"></script>
    <title><spring:message code="App.Title"></spring:message> </title>
</head>
<body style="font-family: Arial; font-size:smaller;">

<table  bgcolor="lightblue" width="750" height="500" align="center" style="border-collapse: collapse;" border="1" bordercolor="#006699" >
    <tr>
        <td align="center"><h3>Edit ClientInfo Form</h3></td>
    </tr>
  <tr valign="top" align="center">
    <td align="center">
         <form:form action="updateClientInfo.do" method="post" commandName="editClientInfo">
                <table width="500" style="border-collapse: collapse;" border="0" bordercolor="#006699" cellspacing="2" cellpadding="2">                    
                     <tr>
                        <td width="100" align="right">ClientName</td>
                        <td width="150">
                        <form:input path="clientName"/></td>
                        <td align="left">
                        <form:errors path="cientName" cssStyle="color:red"></form:errors>
                        </td>
                    </tr>
                    <tr>
                        <td width="100" align="right">ClientCode</td>
                        <td width="150">
                        <form:input path="clientCode"/></td>
                        <td align="left">
                        <form:errors path="clientCode" cssStyle="color:red"></form:errors>
                        </td>
                    </tr>
                    <tr>
                        <td width="100" align="right">Email</td>
                        <td><form:input path="email"/></td>
                        <td align="left"><form:errors path="email" cssStyle="color:red"></form:errors>  </td>
                    </tr>
                    <tr>
                        <td width="100" align="right">Phone</td>
                        <td><form:input path="phone"/></td>
                        <td align="left">
                        <form:errors path="phone" cssStyle="color:red"></form:errors>  </td>
                    </tr>
                    <tr valign="bottom">
                        <td colspan="3" align="center">
                        <input type="button"  value="Delete" onclick="javascript:deleteClientInfo('deleteClientInfo.do?id=${editClientInfo.id}');">
                        &nbsp;&nbsp;
                        <input type="submit" name="" value="Save">                        
                        &nbsp;&nbsp;
                        <input type="button"  value="Back" onclick="javascript:go('viewAllClientInfo.do');">
                        </td>
                    </tr>
                    
                </table>                
        </form:form>
    </td>    
  </tr>
</table>


</body>
</html>