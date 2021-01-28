package zipcok.comm.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExBbsDAOImple implements ExBbsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public int dailyWrite(ExBbsDTO dto) {
		int count=sqlMap.insert("dailyWriteSQL", dto);
		return count;
	}
	
	@Override
	public List dailyList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List list=sqlMap.selectList("dailyListSQL",map);
		return list;
	}
	
	@Override
	public int getTotalCnt() {
		int count=sqlMap.selectOne("getTotalCntSQL");
		return count==0?1:count;
	}
	
	@Override
	public ExBbsDTO dailyContent(int ex_idx) {
		ExBbsDTO dto=sqlMap.selectOne("bbsContentSQL",ex_idx);
		return dto;
	}
	
	@Override
	public int dailyUpdate(ExBbsDTO dto) {
		int count=sqlMap.update("bbsUpdateSQL",dto);
		return count;
	}
	
	@Override
	public int dailyDelete(int ex_idx) {
		int count=sqlMap.delete("bbsDeleteSQL",ex_idx);
		return count;
	}
	
	@Override
	public int dailyReadnum(int ex_idx) {
		int count=sqlMap.update("bbsReadnumSQL",ex_idx);
		return count;
	}
	
	@Override
	public int dailyGetMaxSunbun(int re_idx) {
		int count=sqlMap.selectOne("dailyGetMaxSunbunSQL",re_idx);
		return count;
	}
	
	@Override
	public int dailyReWrite(ExReBbsDTO dto) {
		int count=sqlMap.insert("bbsReWriteSQL",dto);
		return count;
	}
	
	@Override
	public int dailyReDelete(int re_group) {
		int count=sqlMap.delete("bbsReDeleteSQL",re_group);
		return count;
	}
	
	@Override
	public int dailyReReDelete(int re_idx) {
		int count=sqlMap.delete("bbsReReDeleteSQL",re_idx);
		return count;
	}
	
	@Override
	public List dailyReList(int re_bbs_idx) {
		List list=sqlMap.selectList("dailyReListSQL",re_bbs_idx);
		return list;
	}
	
	@Override
	public int dailyGetTotalRe(int re_bbs_idx) {
		int count=sqlMap.selectOne("dailyGetTotalReSQL",re_bbs_idx);
		return count;
	}
	
	@Override
	public int dailySetTotalRe(int ex_recnt, int ex_idx) {
		Map map=new HashMap();
		map.put("ex_recnt", ex_recnt);
		map.put("ex_idx", ex_idx);
		int count=sqlMap.update("dailySetTotalReSQL", map);
		return count;
	}
	
	@Override
	public int dailyGetSunbun_p(int re_group) {
		int result=sqlMap.selectOne("dailyGetSunbun_pSQL", re_group);
		return result;
	}
	
	@Override
	public int dailyGetLev(int re_idx) {
		int result=sqlMap.selectOne("dailyGetLevSQL", re_idx);
		return result;
	}
	
	@Override
	public void dailyReUpdate(int re_bbs_idx, int re_sunbun) {
		Map map=new HashMap();
		map.put("re_bbs_idx", re_bbs_idx);
		map.put("re_sunbun", re_sunbun);
		int result=sqlMap.update("dailyReUpdateSQL", map);
	}
	
	@Override
	public int dailyReReWrite(ExReBbsDTO dto) {
		int count=sqlMap.insert("dailyReReWriteSQL",dto);
		return count;
	}

}
