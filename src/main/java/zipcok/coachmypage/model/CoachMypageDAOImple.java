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
	
	/*상담요청서 삭제*/
	@Override
	public int requestDelete(int req_idx) {
		int count=sqlMap.delete("requestDelete",req_idx);
		return count;
	}
	
	/*상담요청서 yet을 ing 상담중으로 전환시키기*/
	@Override
	public int requestStatusChange(int req_idx) {
		 int count=sqlMap.update("requestStatusChange", req_idx);
		return count;
	}
	
}
