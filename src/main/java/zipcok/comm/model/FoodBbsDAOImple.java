package zipcok.comm.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FoodBbsDAOImple implements FoodBbsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//글쓰기
	@Override
	public int foodWrite(FoodBbsDTO dto) {
		int count=sqlMap.insert("foodWriteSQL", dto);
		return count;
	}
	
	@Override
	public int getMaxFoodIdx() {
		int count=sqlMap.selectOne("getMaxFoodIdxSQL");
		return count;
	}
	
	//글목록 불러오기
	@Override
	public List foodList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List list=sqlMap.selectList("foodListSQL",map);
		return list;
	}
	
	//총 게시물 수 구하기
	@Override
	public int getTotalCnt() {
		int count=sqlMap.selectOne("foodGetTotalCntSQL");
		return count==0?1:count;
	}
	
	//글 보기
	@Override
	public FoodBbsDTO foodContent(int food_idx) {
		FoodBbsDTO dto=sqlMap.selectOne("foodContentSQL",food_idx);
		return dto;
	}
	
	//글 수정
	@Override
	public int foodUpdate(FoodBbsDTO dto) {
		int count=sqlMap.update("foodUpdateSQL",dto);
		return count;
	}
	
	//글 삭제
	@Override
	public int foodDelete(int food_idx) {
		int count=sqlMap.delete("foodDeleteSQL",food_idx);
		return count;
	}
	
	//조회수 불러오기
	@Override
	public int foodReadnum(int food_idx) {
		int count=sqlMap.update("foodReadnumSQL",food_idx);
		return count;
	}
	
	//댓글 최대 순번 구하기
	@Override
	public int foodGetMaxSunbun(int re_idx) {
		int count=sqlMap.selectOne("dailyGetMaxSunbunSQL",re_idx);
		return count;
	}
	
	//댓글 쓰기
	@Override
	public int foodReWrite(FoodBbsDTO dto) {
		int count=sqlMap.insert("bbsReWriteSQL",dto);
		return count;
	}
	
	//댓글삭제
	@Override
	public int foodReDelete(int re_group) {
		int count=sqlMap.delete("bbsReDeleteSQL",re_group);
		return count;
	}
	
	//대댓글 삭제
	@Override
	public int foodReReDelete(int re_idx) {
		int count=sqlMap.delete("bbsReReDeleteSQL",re_idx);
		return count;
	}
	
	//댓글 뿌려주기
	@Override
	public List foodReList(int re_bbs_idx) {
		List list=sqlMap.selectList("dailyReListSQL",re_bbs_idx);
		return list;
	}
	
	//댓글 갯수 구하기
	@Override
	public int foodGetTotalRe(int re_bbs_idx) {
		int count=sqlMap.selectOne("dailyGetTotalReSQL",re_bbs_idx);
		return count;
	}
	
	//총 댓글 갯수 입력하기
	@Override
	public int foodSetTotalRe(int food_recnt, int food_idx) {
		Map map=new HashMap();
		map.put("ex_recnt", food_recnt);
		map.put("ex_idx", food_idx);
		int count=sqlMap.update("foodSetTotalReSQL", map);
		return count;
	}
	
	//부모댓글 순번구하기
	@Override
	public int foodGetSunbun_p(int re_group) {
		int result=sqlMap.selectOne("dailyGetSunbun_pSQL", re_group);
		return result;
	}
	
	//부모댓글 레벨구하기
	@Override
	public int foodGetLev(int re_idx) {
		int result=sqlMap.selectOne("dailyGetLevSQL", re_idx);
		return result;
	}
	
	//댓글 순서 업데이트
	@Override
	public void foodReUpdate(int re_bbs_idx, int re_sunbun) {
		Map map=new HashMap();
		map.put("re_bbs_idx", re_bbs_idx);
		map.put("re_sunbun", re_sunbun);
		int result=sqlMap.update("dailyReUpdateSQL", map);
		
	}
	
	//대댓글 쓰기
	@Override
	public int foodReReWrite(ExReBbsDTO dto) {
		int count=sqlMap.insert("dailyReReWriteSQL",dto);
		return count;
	}
	
	

}
