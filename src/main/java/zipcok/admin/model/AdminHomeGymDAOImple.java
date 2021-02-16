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
	
	//상태조건 총수
	@Override
	public int adminHomeGymReservationSelectTotalCnt(HashMap<String, Object> map) {
		int totalCnt = sqlMap.selectOne("adminHomeGymReservationSelectTotalCnt", map);
		return totalCnt;
	}
	
	//상태조건 검색
	@Override
	public List<HomeGymReservationDTO> adminHomeGymReservationSelect(HashMap<String, Object> map) {
		List<HomeGymReservationDTO> list = sqlMap.selectList("adminHomeGymReservationSelect", map);
		return list;
	}
	
	
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
	
	//날짜로 예약조회 수
	@Override
	public int adminHomeGymReservationDateTotalCnt(HashMap<String, Object> map) {
		int totalCnt = sqlMap.selectOne("adminHomeGymReservationDateTotalCnt", map);
		return totalCnt;
	}
	
	//날짜로 예약조회 목록
	@Override
	public List<HomeGymReservationDTO> adminHomeGymReservationDate(HashMap<String, Object> map) {
		List<HomeGymReservationDTO> list = sqlMap.selectList("adminHomeGymReservationDate", map);
		return list;
	}
	
}
