<%
    // Destroy the current session completely
    session.removeAttribute("userObj");
    session.invalidate();

    // Optional: prevent cached navbar from showing logged-in state
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", 0);

    // Redirect to home page
    response.sendRedirect("login.jsp");
%>
