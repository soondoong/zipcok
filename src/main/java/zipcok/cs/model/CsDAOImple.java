package zipcok.cs.model;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CsDAOImple implements CsDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;

	public CsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int getTotalCnt() {
		int count=sqlMap.selectOne("csTotalCnt");
		return count==0?1:count;
	}
	
	@Override
	public List csAllList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		List list=sqlMap.selectList("csAllListSQL", map);
		return list;
	}
	
	@Override
	public int csWrite(CsDTO dto) {
		int count=sqlMap.insert("csWriteSQL",dto);
		
		return count;
	}
}
