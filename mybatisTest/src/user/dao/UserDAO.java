package user.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static UserDAO userDAO = new UserDAO();
	
	public static UserDAO getInstance() {
		return userDAO;
	}
	
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
		sqlSession.insert("userSQL.write", userDTO); 
		//("userMapper.xml 안에 있는 태그의 아이디명", 넘길 데이터), 아이디명은 함수명을 주로 사용한다. 
		//insert: userSQL.write 를 찾아 간다. 
		sqlSession.commit(); //insert, update, delete 는 lock이 걸려있기 때문에 반드시 커밋을 해야 한다. 
		sqlSession.close();
		
	}

	public List<UserDTO> getUserList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.getUserList"); //selectList: List type 으로 반환, List에 알아서 담아준다. 
		sqlSession.close();
		return list;
	}

	public UserDTO getUser(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserDTO userDTO = sqlSession.selectOne("userSQL.getUser", id);
		sqlSession.close();
		return userDTO;
	}

	public void update(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("userSQL.update", map);
		sqlSession.commit();
		sqlSession.close();
	}

	public void delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("userSQL.delete", id);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<UserDTO> search(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.search", map); //selectList: List type 으로 반환, List에 알아서 담아준다. 
		sqlSession.close();
		return list;
	}

}



