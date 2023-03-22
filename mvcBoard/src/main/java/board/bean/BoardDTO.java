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
}
