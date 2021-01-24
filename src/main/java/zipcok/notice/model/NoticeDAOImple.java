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
	

}
