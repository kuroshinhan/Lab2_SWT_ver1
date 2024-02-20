package controller;

import dao.ExamScheduleDAO;
import dao.LocationDAO;
import dao.NotificationDAO;
import dao.RegistrationDAO;
import dao.SubjectDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.ExamSchedule;
import model.Location;
import model.Notification;
import model.Registration;
import model.Subject;
import model.User;
import utils.SessionManager;

/**
 *
 * @author 84354
 */
public class AdminPanelController extends HttpServlet {

    private static final Logger logger = Logger.getLogger(AdminPanelController.class.getName());
    private UserDAO userDAO;
    private ExamScheduleDAO examDAO;
    private SubjectDAO subjectDAO;
    private LocationDAO locationDAO;
    private NotificationDAO noteDAO;
    private RegistrationDAO registerDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        examDAO = new ExamScheduleDAO();
        subjectDAO = new SubjectDAO();
        locationDAO = new LocationDAO();
        noteDAO = new NotificationDAO();
        registerDAO = new RegistrationDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Không sử dụng System.out.println() ở đây
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mod = request.getParameter("mod");
        String action = request.getParameter("action");
        User user = SessionManager.getSessionUser(request);
        request.setAttribute("user", user);

        if (mod != null && mod.equals("1")) {
            if (action != null && action.equals("1")) {
                String id = request.getParameter("id");
                ExamSchedule e = examDAO.getExamScheduleById(id);
                request.setAttribute("e", e);
                ArrayList<Subject> subjects = subjectDAO.getAllSubjects();
                ArrayList<Location> locations = locationDAO.getAllLocations();
                request.setAttribute("subjects", subjects);
                request.setAttribute("locations", locations);
                request.getRequestDispatcher("UpdateExamSchedule.jsp").forward(request, response);
            } else if (action != null && action.equals("2")) {
                String id = request.getParameter("id");
                examDAO.deleteExamSchedule(id);
            }

            ArrayList<Subject> subjects = subjectDAO.getAllSubjects();
            ArrayList<ExamSchedule> exams = examDAO.getAllExamSchedules();
            ArrayList<Location> locations = locationDAO.getAllLocations();
            request.setAttribute("subjects", subjects);
            request.setAttribute("exams", exams);
            request.setAttribute("locations", locations);
            request.getRequestDispatcher("ExamScheduleList.jsp").forward(request, response);

        } else if (mod != null && mod.equals("0")) {
            request.getRequestDispatcher("AdminProfile.jsp").forward(request, response);

        } else if (mod != null && mod.equals("3")) {
            ArrayList<Notification> notes = noteDAO.getNotificationsByAccount(user.getAccount());
            request.setAttribute("note", notes);
            request.getRequestDispatcher("ListRegistration.jsp").forward(request, response);

            String id = request.getParameter("id");
            if (id != null) {
                Notification note = noteDAO.getNotificationById(id);
                logger.info("Notification retrieved: " + note);
                Registration regis = registerDAO.getRegistrationById(note.getRegistration());
                logger.info("Registration retrieved: " + regis);
                Notification newNote = null;

                if (action != null && action.equals("0")) {
                    regis.setStatus("Accepted");
                    newNote = new Notification("", regis.getUser(), "Request is accepted", regis.getId(), "0");
                } else if (action != null && action.equals("1")) {
                    regis.setStatus("Rejected");
                    newNote = new Notification("", regis.getUser(), "Request is rejected", regis.getId(), "0");
                }

                note.setStatus("1");
                noteDAO.addNotification(newNote);
                registerDAO.updateRegistration(regis);
                ArrayList<Registration> regisList = registerDAO.getAllRegistrations();
                ArrayList<Registration> filter = new ArrayList<>();

                for (Registration r : regisList) {
                    if (r != null && r.getStatus().equals("Accepted")) {
                        filter.add(r);
                    }
                }

                request.setAttribute("list", filter);
                request.getRequestDispatcher("ListStudent").forward(request, response);
            }

        } else {
            response.sendRedirect("Admin.jsp");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = SessionManager.getSessionUser(request);
        request.setAttribute("user", user);
        if (request.getParameter("createExam") != null) {
            String subject = request.getParameter("subject").trim();
            String date = request.getParameter("date").trim();
            String location = request.getParameter("location").trim();
            String start = request.getParameter("start").trim();
            String end = request.getParameter("end").trim();
            String error = "";
            if (subject.isEmpty() || date.isEmpty() || location.isEmpty() || start.isEmpty() || end.isEmpty()) {
                error = "Please fill in all required field";
            } else if (start.compareTo(end) >= 0) {
                error = "Start time must be smaller than End time";
            } else {
                ExamSchedule e = new ExamSchedule("", subject, date, location, start, end);
                examDAO.addExamSchedule(e);
            }
            
            ArrayList<Subject> subjects = subjectDAO.getAllSubjects();
            ArrayList<ExamSchedule> exams = examDAO.getAllExamSchedules();
            ArrayList<Location> locations = locationDAO.getAllLocations();
            request.setAttribute("error", error);
            request.setAttribute("subjects", subjects);
            request.setAttribute("exams", exams);
            request.setAttribute("locations", locations);
            request.getRequestDispatcher("ExamScheduleList.jsp").forward(request, response);
        }
        if (request.getParameter("updateExam") != null) {
            String id = request.getParameter("id");
            String subject = request.getParameter("subject");
            String date = request.getParameter("date");
            String location = request.getParameter("location");
            String start = request.getParameter("start");
            String end = request.getParameter("end");
            String error = "";
            
            if (start.compareTo(end) >= 0) {
                error = "Start time must be smaller than End time";
                request.setAttribute("error", error);
                ExamSchedule e = examDAO.getExamScheduleById(id);
                request.setAttribute("e", e);
                ArrayList<Subject> subjects = subjectDAO.getAllSubjects();
                ArrayList<Location> locations = locationDAO.getAllLocations();
                request.setAttribute("subjects", subjects);
                request.setAttribute("locations", locations);
                request.getRequestDispatcher("UpdateExamSchedule.jsp").forward(request, response);
            } else {
                ExamSchedule e = new ExamSchedule(id, subject, date, location, start, end);
                examDAO.updateExamSchedule(e);
                ArrayList<Subject> subjects = subjectDAO.getAllSubjects();
                ArrayList<ExamSchedule> exams = examDAO.getAllExamSchedules();
                ArrayList<Location> locations = locationDAO.getAllLocations();
                request.setAttribute("subjects", subjects);
                request.setAttribute("exams", exams);
                request.setAttribute("locations", locations);
                request.getRequestDispatcher("ExamScheduleList.jsp").forward(request, response);
            }
        }
        if (request.getParameter("updateProfile") != null) {
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            User u = new User(user.getAccount(), user.getPassword(), name, email, phone, address, user.getRole());
            userDAO.updateUser(u);
            SessionManager.createSession(request, u);
            request.setAttribute("user", u);
            request.getRequestDispatcher("AdminProfile.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
