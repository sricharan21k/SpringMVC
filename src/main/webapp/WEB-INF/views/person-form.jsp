<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
         rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
         crossorigin="anonymous">
    </head>
    <body>
        <h2 class="text-center m-4">${action} Person</h2>
        <form class="col-4 mx-auto card" action="<c:url value='/person/${fn:toLowerCase(action)}' />" method="post">
             <div class="m-3 justify-content-center">
                 <input type="hidden" value="${person.id != null ? person.id : 0}" name="id">
                 <div class="form-floating mb-2">
                    <input type="text" class="form-control" id="firstname" name="firstname"
                     value="${person.firstname}" placeholder="Firstname">
                    <label for="firstname">Firstname</label>
                 </div>
                 <div class="form-floating mb-2">
                    <input type="text" class="form-control" id="lastname" name="lastname"
                     value="${person.lastname}" placeholder="Lastname">
                    <label for="lastname">Lastname</label>
                 </div>
                 <div class="form-floating mb-2">
                    <input type="number" class="form-control" id="age" name="age"
                     value="${person.age}" placeholder="Age">
                    <label for="age">Age</label>
                 </div>
                 <div class="form-floating mb-2">
                    <input type="text" class="form-control" id="country" name="country"
                     value="${person.country}" placeholder="Country">
                    <label for="country">Country</label>
                 </div>
                 <button type="submit" class="btn btn-primary col-12">Submit</button>
             </div>
        </form>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
         crossorigin="anonymous"></script>
    </body>
</html>