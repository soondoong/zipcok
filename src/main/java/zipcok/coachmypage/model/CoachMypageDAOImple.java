package zipcok.coachmypage.model;

import java.util.*;

import org.apache.commons.collections.map.HashedMap;
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
	
	
	@Override
	public int coachMypageHomeGymLikeListTotalCnt(String mem_id) {
		int count=sqlMap.selectOne("coachMypageHomeGymLikeListTotalCnt", mem_id);
		return count==0?1:count;
	}
	
	@Override
	public List coachMypageHomeGymLikeList(int cp, int ls, String mem_id) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashedMap();
		map.put("mem_id", mem_id);
		map.put("start", start);
		map.put("end", end);
		List list = sqlMap.selectList("coachMypageHomeGymLikeList", map);
		
		return list;
	}
	
	//F&A 고객센터 작성글 총 수
	@Override
	public int coachMypageWriteListTotalCnt(String mem_id) {
		int count=sqlMap.selectOne("coachMypageWriteListTotalCnt", mem_id);
		return count==0?1:count;
	}
	
	//F&A 고객센터 작성글 목록
	@Override
	public List coachMypageWriteList(int cp, int ls, String mem_id) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashedMap();
		map.put("mem_id", mem_id);
		map.put("start", start);
		map.put("end", end);
		List list = sqlMap.selectList("coachMypageWriteList", map);
		
		return list;
	}
	
	
}
