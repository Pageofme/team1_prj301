<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management Application</title>
    </head>
    <body>
        <center>
            <h1>User Management</h1>
        </center>
        <div align="center">
            <table border="1" cellpadding="5">
                <caption><h2>List of Products</h2></caption>
                <tr>
                    <th>Product ID</th>
                    <th>Product name</th>
                    <th>Description</th>
                    <th>Price</th>
                </tr>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td><c:out value="${product.productID}"/></td>
                        <td><c:out value="${product.productName}"/></td>
                        <td><c:out value="${product.description}"/></td>
                        <td><c:out value="${product.price}"/></td>                       
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
