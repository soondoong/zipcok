package zipcok.admin.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.homegym.model.HomeGymReservationDTO;

@Service
public class AdminHomeGymDAOImple implements AdminHomeGymDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//예약조회 수
	@Override
	public int adminHomeGymReservationSearchTotalCnt(HashMap<String, Object> map) {
		int totalCnt = sqlMap.selectOne("adminHomeGymReservationSearchTotalCnt", map);
		return totalCnt;
	}
	
	//예약조회 목록
	@Override
	public List<HomeGymReservationDTO> adminHomeGymReservationSearch(HashMap<String, Object> map) {
		List<HomeGymReservationDTO> list = sqlMap.selectList("adminHomeGymReservationSearch", map);
		return list;
	}
	
	
}
