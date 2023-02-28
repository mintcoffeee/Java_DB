package member.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.bean.MemberDTO;
import member.dao.MemberDAO;


//@WebServlet("/WriteServlet")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
	public void init() {
		
	}
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//data
		request.setCharacterEncoding("UTF-8"); //post 방식일때만 사용
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName(name);
		memberDTO.setId(id);
		memberDTO.setPwd(pwd);
		memberDTO.setGender(gender);
		memberDTO.setEmail1(email1);
		memberDTO.setEmail2(email2);
		memberDTO.setTel1(tel1);
		memberDTO.setTel2(tel2);
		memberDTO.setTel3(tel3);
		memberDTO.setZipcode(zipcode);
		memberDTO.setAddr1(addr1);
		memberDTO.setAddr2(addr2);
		
		//DB
//		MemberDAO memberDAO = new MemberDAO();	//직접 new 계속하면 회원가입 증가할수록 메모리에 과부하 
		MemberDAO memberDAO = MemberDAO.getInstance();	 //instance 를 계속 호출해도 클래스에 한번만 생성된다.

		int su = memberDAO.memberWrite(memberDTO);
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();	//스크림생성 
		out.println("<html>");
		out.println("<body>");
		if(su == 0) {
			out.println("<h3>회원가입 실패</h3>");
			out.println("<input type='button' value='뒤로' onclick='history.go(-1)'>");
		}else {
			out.println("<h3>회원가입 성공</h3>");
			out.println("<input type='button' value='로그인' onclick=location.href='http://localhost:8080/memberServlet/member/loginForm.html'>");
		}
		
		out.println("</body>");
		out.println("</html>");
		
	}

	
	public void destroy() {
		
	}

}
