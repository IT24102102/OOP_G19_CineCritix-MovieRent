<%--
  Created by IntelliJ IDEA.
  User: Tharindu
  Date: 5/2/2025
  Time: 7:29 PM
  To change this template use File | Settings | File Templates.
--%>
<!-- /includes/footer.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
  footer {
    background-color: #111;
    color: white;
    padding: 20px 20px;
    text-align: center;
    font-size: 12px;
    border-top: 1px solid #444;
    margin-top: 50px;
  }

  footer .social-icons {
    margin: 5px 0;
  }

  footer .social-icons a {
    color: white;
    margin: 0 12px;
    font-size: 18px;
    text-decoration: none;
  }

  footer .social-icons a:hover {
    color: #f39c12;
  }

  footer a {
    color: #f39c12;
    text-decoration: none;
    margin: 0 8px;
  }

  footer a:hover {
    text-decoration: underline;
  }

  /* Responsive Footer */
  @media (max-width: 768px) {
    footer {
      font-size: 12px;
    }
    footer .social-icons {
      margin: 10px 0;
    }
    footer .social-icons a {
      margin: 0 10px;
    }
  }
</style>

<footer>

  <div class="social-icons">
    <a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
    <a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
  </div>
  <p>
    <a href="${pageContext.request.contextPath}/Aboutus.jsp">About Us</a> |
    <a href="${pageContext.request.contextPath}/privacy.jsp">Privacy Policy</a>
  </p>
  &copy; 2025 CineCritix. All rights reserved.
</footer>
