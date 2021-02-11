package zipcok.comm.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExBbsDAOImple implements ExBbsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//글쓰기
	@Override
	public int dailyWrite(ExBbsDTO dto) {
		int count=sqlMap.insert("dailyWriteSQL", dto);
		return count;
	}
	
	@Override
	public int getMaxExIdx() {
		int count=sqlMap.selectOne("getMaxExIdxSQL");
		return count;
	}
	
	//글목록 불러오기
	@Override
	public List dailyList(int cp, int ls, int ex_comm_idx) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("ex_comm_idx", ex_comm_idx);
		List list=sqlMap.selectList("dailyListSQL",map);
		return list;
	}
	
	//총 게시물 수 구하기
	@Override
	public int getTotalCnt() {
		int count=sqlMap.selectOne("getTotalCntSQL");
		return count==0?1:count;
	}
	
	//글 보기
	@Override
	public ExBbsDTO dailyContent(int ex_idx) {
		ExBbsDTO dto=sqlMap.selectOne("bbsContentSQL",ex_idx);
		return dto;
	}
	
	//글 수정
	@Override
	public int dailyUpdate(ExBbsDTO dto) {
		int count=sqlMap.update("bbsUpdateSQL",dto);
		return count;
	}
	
	//글 삭제
	@Override
	public int dailyDelete(int ex_idx) {
		int count=sqlMap.delete("bbsDeleteSQL",ex_idx);
		return count;
	}
	
	//조회수 불러오기
	@Override
	public int dailyReadnum(int ex_idx) {
		int count=sqlMap.update("bbsReadnumSQL",ex_idx);
		return count;
	}
	
	//댓글 최대 순번 구하기
	@Override
	public int dailyGetMaxSunbun(int re_idx) {
		int count=sqlMap.selectOne("dailyGetMaxSunbunSQL",re_idx);
		return count;
	}
	
	//댓글 쓰기
	@Override
	public int dailyReWrite(ExReBbsDTO dto) {
		int count=sqlMap.insert("bbsReWriteSQL",dto);
		return count;
	}
	
	//댓글 삭제
	@Override
	public int dailyReDelete(int re_group) {
		int count=sqlMap.delete("bbsReDeleteSQL",re_group);
		return count;
	}
	
	//대댓글 삭제
	@Override
	public int dailyReReDelete(int re_idx) {
		int count=sqlMap.delete("bbsReReDeleteSQL",re_idx);
		return count;
	}
	
	//댓글 뿌려주기
	@Override
	public List dailyReList(int re_bbs_idx) {
		List list=sqlMap.selectList("dailyReListSQL",re_bbs_idx);
		return list;
	}
	
	//댓글 갯수 구하기
	@Override
	public int dailyGetTotalRe(int re_bbs_idx) {
		int count=sqlMap.selectOne("dailyGetTotalReSQL",re_bbs_idx);
		return count;
	}
	
	//총 댓글 갯수 입력하기
	@Override
	public int dailySetTotalRe(int ex_recnt, int ex_idx) {
		Map map=new HashMap();
		map.put("ex_recnt", ex_recnt);
		map.put("ex_idx", ex_idx);
		int count=sqlMap.update("dailySetTotalReSQL", map);
		return count;
	}
	
	//부모댓글 순번구하기
	@Override
	public int dailyGetSunbun_p(int re_group) {
		int result=sqlMap.selectOne("dailyGetSunbun_pSQL", re_group);
		return result;
	}
	
	//부모댓글 레벨구하기
	@Override
	public int dailyGetLev(int re_idx) {
		int result=sqlMap.selectOne("dailyGetLevSQL", re_idx);
		return result;
	}
	
	//댓글 순서 업데이트
	@Override
	public void dailyReUpdate(int re_bbs_idx, int re_sunbun) {
		Map map=new HashMap();
		map.put("re_bbs_idx", re_bbs_idx);
		map.put("re_sunbun", re_sunbun);
		int result=sqlMap.update("dailyReUpdateSQL", map);
	}
	
	//대댓글 쓰기
	@Override
	public int dailyReReWrite(ExReBbsDTO dto) {
		int count=sqlMap.insert("dailyReReWriteSQL",dto);
		return count;
	}

}
