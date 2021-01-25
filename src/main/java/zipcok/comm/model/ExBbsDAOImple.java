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

}
