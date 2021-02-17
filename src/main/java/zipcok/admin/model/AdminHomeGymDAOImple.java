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
	
	
	
	
	
	/*-----------------예약조회 병모----------------*/

	//예약조회 전체 수
	@Override
	public int adminHomeGymReservationAllTotalCnt(HashMap<String, Object> map) {
		int totalCnt = sqlMap.selectOne("adminHomeGymReservationAllTotalCnt", map);
		return totalCnt;
	}
	//예약조회 전체 목록
	@Override
	public List<HomeGymReservationDTO> adminHomeGymReservationAll(HashMap<String, Object> map) {
		List<HomeGymReservationDTO> list = sqlMap.selectList("adminHomeGymReservationAll", map);
		return list;
	}
	
	
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
	
	//취소승인 상태변경
	@Override
	public int reservationCancelStatus(String mem_id) {
		int count = sqlMap.update("reservationCancelStatus", mem_id);
		return count;
	}
	
	//취소승은 마이페이지 결제상태변경
	@Override
	public int reservationCancelStatusPayment(String pd_mem_id) {
		int count = sqlMap.update("reservationCancelStatusPayment", pd_mem_id);
		return count;
	}
	
	
	/*-----------------예약조회 병모----------------*/
	
}
