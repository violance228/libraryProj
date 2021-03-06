package com.violence.servlets.user;

import com.violence.entity.User;
import com.violence.repository.UserRepository;
import com.violence.repository.UserRepositoryImpl;
import com.violence.util.Utils;
import com.violence.util.api.parser.ObjectParserFromReq;
import com.violence.util.api.parser.ObjectParserFromReqImpl;
import org.apache.log4j.Logger;

import javax.annotation.security.PermitAll;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.ServerException;

@Named
@PermitAll
@RequestScoped
@WebServlet(urlPatterns = "/registration")
public class Registration extends HttpServlet {
    private static final Logger logger = Logger.getLogger(Registration.class);
    private static final UserRepository userRepository = new UserRepositoryImpl();
    private static final ObjectParserFromReq parser = new ObjectParserFromReqImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/html/user/addUser.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) parser.getObjectFromRequest(req, User.class);
        if (userRepository.getUserByLogin(user.getLogin()) == null && userRepository.getUserByPhone(user.getPhone()) == null) {
            userRepository.save(user);
            req.setAttribute("user", user);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/html/user/trackUser.jsp");
            dispatcher.forward(req,resp);
            logger.info("user " + user.getLogin() + " was registered");
        } else {
            req.setAttribute("error", "user with same login or phone already exist");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/html/user/addUser.jsp");
            dispatcher.forward(req,resp);
            logger.info("user wrote exist login or mobile");
        }
    }
}
