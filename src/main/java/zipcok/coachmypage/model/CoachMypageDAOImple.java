package zipcok.coachmypage.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class CoachMypageDAOImple implements CoachMypageDAO {

	private SqlSessionTemplate sqlMap;
	
	public CoachMypageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int requestDelete(int req_idx) {
		int count=sqlMap.delete("requestDelete",req_idx);
		return count;
	}
	
}
