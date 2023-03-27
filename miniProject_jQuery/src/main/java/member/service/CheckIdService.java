package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//Data
		String id = request.getParameter("id");
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		boolean existId = memberDAO.isExistId(id);	//아이디가 있다(ture) = 사용 불가능
		//응답 
		if(existId) {
			return "/member/checkIdFail.jsp"; //사용 불가능
		} else {
			return "/member/checkIdOk.jsp"; //사용 가능
		}
	}
}
