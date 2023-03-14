package user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		System.out.println();
		System.out.println("******************************");
		System.out.println("\t1. 이름 검색");
		System.out.println("\t2. 아이디 검색");
		System.out.println("******************************");
		System.out.print("\t번호 입력 : ");
		int num = scan.nextInt();
		
		//dao
		UserDAO userDAO = UserDAO.getInstance();
		
		Map<String, String> parameterMap = new HashMap<String, String>();
		
		if(num == 1) {
			System.out.print("찾고자하는 이름 입력 : ");
			String name = scan.next();
			parameterMap.put("column", "name");
			parameterMap.put("value", "%"+name+"%");
		} else if(num == 2) {
			System.out.print("찾고자하는 아이디를 입력 : ");
			String id = scan.next();
			parameterMap.put("column", "id");
			parameterMap.put("value", "%"+id+"%");
		}
		
		List<UserDTO> list =  userDAO.search(parameterMap);
		
		for(UserDTO userDTO : list) {
			System.out.println(userDTO.getName() +"\t" + userDTO.getId() + "\t" + userDTO.getPwd());
		}
	}

}
