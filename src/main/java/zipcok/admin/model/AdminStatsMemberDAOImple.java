package zipcok.admin.model;

import java.util.HashMap;
import java.util.Map;

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
	
	//날짜에 따른 가입자 수 구하기
	@Override
	public int GetMemJoinDateCountSum(String startDate, String endDate) {
		Map map=new HashMap();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		int count=sqlMap.selectOne("GetMemJoinDateCountSumSQL",map);
		return count;
	}
	
	//해당 날짜 가입자 수 구하기
	@Override
	public int GetMemJoinDate(String date) {
		int count=sqlMap.selectOne("GetMemJoinDateSQL",date);
		return count;
	}
	
	@Override
	public int GetMemOutDateCountSum(String startDate, String endDate) {
		Map map=new HashMap();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		int count=sqlMap.selectOne("GetMemOutDateCountSumSQL",map);
		return count;
	}
	
	//해당 날짜 탈퇴자 수 구하기
	@Override
	public int GetMemOutDate(String date) {
		int count=sqlMap.selectOne("GetMemOutDateSQL",date);
		return count;
	}
	
	//해당 날짜 코치 전환 수 구하기
	@Override
	public int GetCoachJoinDate(String date) {
		int count=sqlMap.selectOne("GetCoachJoinDateSQL",date);
		return count;
	}

}
