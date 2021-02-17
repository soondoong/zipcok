package zipcok.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminStatsHomegymRegistDAOImple implements AdminStatsHomegymRegistDAO {
	
	@Autowired	
	private SqlSessionTemplate sqlMap;
	
	//날짜별로 신규 등록 홈짐 수 구하기
	@Override
	public int GetNewHomeGymCount(String date) {
		int count=sqlMap.selectOne("GetNewHomeGymCountSQL",date);
		return count;
	}
	
	//활성화 된 홈짐 수 구하기
	@Override
	public int GetStatusOnHomeGymCount(String date) {
		int count=sqlMap.selectOne("GetStatusOnHomeGymCountSQL",date);
		return count;
	}
	
	//거래된 홈짐 수 구하기
	@Override
	public int GetPaymentHomegymCount(String date) {
		int count=sqlMap.selectOne("GetPaymentHomegymCountSQL",date);
		return count;
	}

}
