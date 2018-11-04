package Controllers;


import Models.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogInAdmin extends HttpServlet {
    private final String RES_PAGE = "logIn.jsp";

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        String[] usernames = request.getParameterValues("username");
        String[] passwords = request.getParameterValues("password");
        String username = usernames[0];
        String password = passwords[0];
        HttpSession session;
        User user = new User(username, password);
        user.checkIfAdmin(password);

        if(user.isAdmin()) {
            session = request.getSession();
            session.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher(RES_PAGE);
            view.forward(request, response);
        } else {
            RequestDispatcher view =
                    request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        }

    }
}
