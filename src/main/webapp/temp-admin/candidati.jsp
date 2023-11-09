<%@ page contentType="text/html;charset=UTF-8" session="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TalentBridge</title>
        <link href="resources/css/custom/custom.css" rel="stylesheet">
        <script type="text/javascript" src="resources/js/bootstrap.bundle.min.js"></script>
    </head>

    <body class="bg-body-tertiary">
        <jsp:include page='account_edit_modal.jsp'></jsp:include>

        <jsp:include page='admin_header.jsp'>
            <jsp:param name="activeLinkId" value="candidati" />
        </jsp:include>


        <section style="height: 100vh;">

        </section>

        <jsp:include page='admin_footer.jsp'></jsp:include>

    </body>

    </html>