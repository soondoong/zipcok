package zipcok.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminStatsMemberDAOImple implements AdminStatsMemberDAO {
	
	@Autowired	
	private SqlSessionTemplate sqlMap;
	
	//멤버타입에 따른 회원수 구하기
	@Override
	public int GetMemTypeCount(String mem_type) {
		int count=sqlMap.selectOne("GetMemTypeCountSQL",mem_type);
		return count;
	}

}
