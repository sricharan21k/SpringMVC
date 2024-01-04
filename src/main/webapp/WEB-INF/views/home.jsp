<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
         rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
         crossorigin="anonymous">
    <style>
        table tbody tr:hover {
            background-color: black;
        }
    </style>
    </head>
    <body>
        <h2 class="text-center mb-3 pb-2 bg-primary-subtle">Spring MVC</h2>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-7 col-sm-6">
                    <a class="btn btn-primary" href="<c:url value='/person/add' />">Add person</a>
                </div>
                <form class="col" action="<c:url value='/person/search' />">
                    <div class="container">
                        <div class="row">
                            <input type="text" class="form-control col ms-4 me-2" name="filter" placeholder="Enter name...">
                            <button type="submit" class="btn btn-primary col-sm-3">Search</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="container-fluid">
            <table class="table text-center">
                <thead class="table-primary">
                    <tr>
                        <th scope="col">S.No</th>
                        <th scope="col">Firstname</th>
                        <th scope="col">Lastname</th>
                        <th scope="col">Age</th>
                        <th scope="col">Country</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody class="align-middle">
                    <c:forEach items="${personList}" var="person" varStatus="i">
                        <tr>
                            <td>${i.count}</td>
                            <td>${person.firstname}</td>
                            <td>${person.lastname}</td>
                            <td>${person.age}</td>
                            <td>${person.country}</td>
                            <td>
                                <a class="btn btn-sm btn-outline-primary" href="<c:url value='/person/update/${person.id}'/>">Update</a>
                                <a class="btn btn-sm btn-outline-danger" href="<c:url value='/person/delete/${person.id}'/>">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
         crossorigin="anonymous"></script>
    </body>
</html>