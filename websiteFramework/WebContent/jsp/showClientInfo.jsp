<%@include file="taglib_includes.jsp" %>

<html>
<head>

<title></title>
<script type="text/javascript" src="js/clientInfo.js"></script>
</head>
<body style="font-family: Arial; font-size:smaller;">
    <center>
    <form action="searchClientInfo.do" method="post">        
            <table style="border-collapse: collapse;" border="0" bordercolor="#006699" width="500">
            <tr>
                <td>Enter ClientInfo Name</td>
                <td><input type="text" name="name"/>
                    &nbsp;&nbsp;<input type="submit" value="Search"/>
                    &nbsp;&nbsp;<input type="button" value="New ClientInfo" onclick="javascript:go('saveClientInfo.do');"/>
            </td></tr>
        </table>
    </form>
    
    <table style="border-collapse: collapse;" border="1" bordercolor="#006699" width="500">
        <tr bgcolor="lightblue">
            <th>ClientCode</th>
            <th>ClientName</th>
            <th>InputDate</th>
            <th>Email</th>    
            <th>Phone</th>
            <th></th>
        </tr>
        <c:if test="${empty SEARCH_CLIENTINFO_RESULTS_KEY}">
        <tr>
            <td colspan="4">No Results found</td>
        </tr>
        </c:if>
        <c:if test="${! empty SEARCH_CLIENTINFO_RESULTS_KEY}">
            <c:forEach var="clientInfo" items="${SEARCH_CLIENTINFO_RESULTS_KEY}">        
            <tr>
                <td><c:out value="${clientInfo.clientcode}"></c:out></td>
                <td><c:out value="${clientInfo.clientname}"></c:out></td>
                <td><c:out value="${clientInfo.inputdate}"></c:out></td>
                <td><c:out value="${clientInfo.email}"></c:out> </td>
                <td><c:out value="${clientInfo.phone}"></c:out></td>
                <td>
                    &nbsp;<a href="updateClientInfo.do?id=${clientInfo.id}">Edit</a>
                    &nbsp;&nbsp;<a href="javascript:deleteClientInfo('deleteClientInfo.do?id=${clientInfo.id}');">Delete</a>
                </td>
            </tr>
            </c:forEach>
        </c:if>                
    </table>    
    </center>
        
</body>
</html>