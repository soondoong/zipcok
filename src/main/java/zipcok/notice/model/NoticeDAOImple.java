package zipcok.notice.model;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeDAOImple implements NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;

	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int noticeWrite(NoticeDTO dto) {
		int count=sqlMap.insert("noticeWriteSQL", dto);
		return count;
	}
	

	public List noticeAllList(int cp, int ls) {
		
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashedMap();
		map.put("start", start);
		map.put("end", end);
		      List list=sqlMap.selectList("noticeAllListSQL", map);
		      return list;
	}
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("noticeTotalCnt");
		return count==0?1:count;
	}
	

}