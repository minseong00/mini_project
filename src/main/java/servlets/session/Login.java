package servlets.session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.admin.AdminDAO;
import dao.member.MemDAO;
import model.AdminVO;
import model.MemVO;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private HttpSession session = null;
	
    public Login() {
        super();
        
    }

	/**
	 * @see 로그아웃
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		session.invalidate();
		response.sendRedirect(request.getContextPath() + "/LoginCheck");
			
		
	}

	/**
	 * @see 로그인
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession(false);
		AdminVO admin = new AdminVO();				//VO 객체생성
		AdminDAO adminDAO = new AdminDAO(); //DAO를 통한 로그인 처리
		MemVO member = new MemVO();
		MemDAO memDAO = new MemDAO();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		admin.setAdmin_id(id);
		admin.setAdmin_pwd(pw);
		System.out.println("servlet id, pw 값 : " + id + " / " + pw);
		boolean result = adminDAO.adminLogin(admin);
		System.out.println("admin result 값 : " + result);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter(); 


			
		
		out.close();
	}

}
