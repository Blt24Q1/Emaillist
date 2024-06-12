package himedia.controller;

import java.io.IOException;
import java.util.List;

import himedia.dao.EmaillistDao;
import himedia.dao.EmaillistDaoOracleImpl;
import himedia.vo.EmailVo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//	Controller: 요청 처리, 내부 로직 담당
//	- 목록 (GET)
//	- 입력 폼 (GET) ?a=form
//	- 입력 액션 (POST)
//	어노테이션 방식으로 등록
@WebServlet(name="Emaillist", urlPatterns="/el")
public class EmaillistServlet extends BaseServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터 a=form이면 입력 폼으로 이동
		String actionName = req.getParameter("a");	
		if ("form".equals(actionName)) {
			//	사용자 입력 페이지로 FORWARD
		} else {
			//	목록 받아오는 부분 -> /el
			EmaillistDao dao = new EmaillistDaoOracleImpl(dbuser, dbpass);
			List<EmailVo> list = dao.getList();
			
			//	list를 요청 객체에 추가
			req.setAttribute("list", list);
			//	list 객체를 jsp로 FORWARD
			RequestDispatcher rd = getServletContext()
					.getRequestDispatcher("/WEB-INF/views/emaillist/index.jsp");
			rd.forward(req, resp);
		}
	}

}
