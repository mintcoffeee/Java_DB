package board.bean;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDTO {
	private int seq;
	private String id, name, email, subject, content;
	
	private int ref, lev, step, pseq, reply, hit;
	private Date logtime;
	
	// DTO 생성 시, SQL table Col name 순서와 동일하게 작성
	// * Oracle col_name = DTO variable_name = jsp name_attribute
}
