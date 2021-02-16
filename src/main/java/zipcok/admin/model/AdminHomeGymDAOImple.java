package zipcok.admin.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymReservationDTO;

@Service
public class AdminHomeGymDAOImple implements AdminHomeGymDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	/*-----------------홈짐관리----------------*/
	//총게시물수
	@Override
	public int adminHomeGymSearchTotalCnt(HashMap<String, Object> map) {
		int count = sqlMap.selectOne("adminHomeGymTotalCnt", map);
		return count;
	}
	//홈짐검색
	@Override
	public List<HomeGymDTO> adminHomeGymSearch(HashMap<String, Object> map) {
		List<HomeGymDTO> list = sqlMap.selectList("adminHomeGymSearch", map);
		return list;
	}
	/*-----------------홈짐관리----------------*/
	
	/*-----------------예약조회----------------*/
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
	/*-----------------예약조회----------------*/
	
	/*-----------------예약취소관리----------------*/
	/*-----------------예약취소관리----------------*/
	
	
}
