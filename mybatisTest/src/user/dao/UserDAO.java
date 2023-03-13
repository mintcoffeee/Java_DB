package user.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	public UserDAO() {
		InputStream inputStream;
		try {
			//Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); //문자단위로 읽는다
			inputStream = Resources.getResourceAsStream("mybatis-config.xml"); //byte 단위로 읽어온다
			
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream); //interface 라서 바로 생성 불가능 
			
		} catch (IOException e) {
			e.printStackTrace();
		}   
		
		
	}
	
	public void write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성, openSession은 SqlSession을 만들어서 return
		sqlSession.insert("userSQL.write", userDTO); //("userMapper.xml 안에 있는 태그의 아이디명", 넘길 데이터), 아이디명은 함수명을 주로 사용한다. 
		sqlSession.commit(); //insert, update, delete 는 lock이 걸려있기 때문에 반드시 커밋을 해야 한다. 
		sqlSession.close();
		
	}

}



