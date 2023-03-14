package user.main;

import java.util.Scanner;

import user.service.UserDeleteService;
import user.service.UserInsertService;
import user.service.UserSearchService;
import user.service.UserSelectService;
import user.service.UserService;
import user.service.UserUpdateService;

public class UserMain {

	public void menu() {
		Scanner scan = new Scanner(System.in);
		UserService userService = null;
		int num;
		
		while(true) {
			System.out.println();
			System.out.println("******************************");
			System.out.println("\t1. 입력");
			System.out.println("\t2. 출력");
			System.out.println("\t3. 수정");
			System.out.println("\t4. 삭제");
			System.out.println("\t5. 검색");
			System.out.println("\t6. 종료");
			System.out.println("******************************");
			System.out.print("\t번호 입력 : ");
			num = scan.nextInt();
			
			if(num == 6) break;
			
			if(num == 1) 
				userService = new UserInsertService(); //부모 = 자식, 다형성 	
			else if(num == 2) userService = new UserSelectService();
			else if(num == 3) userService = new UserUpdateService();
			else if(num == 4) userService = new UserDeleteService();
			else if(num == 5) userService = new UserSearchService();
			
			userService.execute();
		}//while
		
	}
	public static void main(String[] args) {
		UserMain userMain = new UserMain();
		userMain.menu();
		System.out.println("프로그램을 종료합니다.");
		
	}

}

/*
클래스의 개수가 적으면 1:1 관계 생성해도 상관없다.
클래스의 개수가 무한대로 많으면 1:1 관계로 생성하면 객체도 무한대로 필요
결합도 낮추기 => 다형성 => 부모가 자식클래스를 참조 -> 부모 = 자식 
>> 다형성을 이용하여 객체를 생성한다. 
*/




