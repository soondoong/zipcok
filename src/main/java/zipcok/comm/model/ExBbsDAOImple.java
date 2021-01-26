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
		int count=sqlMap.selectOne("dailyGetMaxSunbunSQL");
		return count;
	}
	
	@Override
	public int dailyReWrite(ExReBbsDTO dto, int ex_idx, String ex_id) {
		Map map=new HashMap();
		map.put("re_bbs_idx", ex_idx);
		map.put("re_id", ex_id);
		int count=sqlMap.insert("bbsReWriteSQL",map);
		return count;
	}

}
