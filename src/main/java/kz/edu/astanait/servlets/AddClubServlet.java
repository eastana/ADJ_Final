package kz.edu.astanait.servlets;

import kz.edu.astanait.models.Club;
import kz.edu.astanait.repositories.implementations.ClubRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddClubServlet", urlPatterns = "/add/club")
public class AddClubServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clubName = request.getParameter("club_name");
        Club club = new Club(clubName);
        ClubRepository cr = new ClubRepository();
        cr.add(club);
        response.sendRedirect(getServletContext().getContextPath()+"/jsp/club.jsp");
        return;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
