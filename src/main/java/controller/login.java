package controller;

import model.bean.Role;
import model.bean.User;
import model.service.RoleService;
import model.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet("/login")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        String email = req.getParameter("email");
        String pw = req.getParameter("password");

        User user = UserService.getInstance().checkLogin(email, pw);
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("auth", user);
            String c = RoleService.getInstance().checkRole(user);
            System.out.println("----------------" +c);
            if (c.equals("admin"))
                resp.sendRedirect(req.getContextPath() + "/views/Admin/view/admin.jsp");
            else
                resp.sendRedirect(req.getContextPath() + "/views/MainPage/view_mainpage/mainpage.jsp");
        } else {
            req.setAttribute("result", "Email không tồn tại hoặc mật khẩu không chính xác!!!");
            req.getRequestDispatcher("views/Login/view_login/login.jsp").forward(req, resp);
        }
    }

}
