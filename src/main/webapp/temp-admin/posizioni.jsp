<%@ page contentType="text/html;charset=UTF-8" session="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TalentBridge</title>
        <link href="resources/css/custom/custom.css" rel="stylesheet">

    </head>

    <body class="bg-body-tertiary">

        <jsp:include page='admin_header.jsp'>
            <jsp:param name="activeLinkId" value="posizioni" />
        </jsp:include>


        <section style="height: 100vh;">

        </section>

        <%@include file="admin_footer.jsp" %>

            <script type="text/javascript" src="resources/js/bootstrap.bundle.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@barba/core"></script>

    </body>

    </html>