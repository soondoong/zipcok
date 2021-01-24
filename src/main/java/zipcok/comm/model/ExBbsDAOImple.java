package zipcok.comm.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;

public class ExBbsDAOImple implements ExBbsDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int dailyWrite(ExBbsDTO dto) {
		int count=sqlMap.insert("dailyWriteSQL", dto);
		return count;
	}
	
	
	
	
	@Override
	public int getTotalCnt() {
		int count=sqlMap.selectOne("getTotalCntSQL");
		return count==0?1:count;
	}

}
