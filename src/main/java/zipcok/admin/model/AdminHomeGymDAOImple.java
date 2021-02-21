package zipcok.admin.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.coach.model.ReviewDTO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymEquipmentDTO;
import zipcok.homegym.model.HomeGymReservationDTO;
import zipcok.homegym.model.PaymentDTO;

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
	public int reservationCancelStatus(int reser_idx) {
		int count = sqlMap.update("reservationCancelStatus", reser_idx);
		return count;
	}
	
	//취소승은 마이페이지 결제상태변경
	@Override
	public int reservationCancelStatusPayment(int reser_idx) {
		int count = sqlMap.update("reservationCancelStatusPayment", reser_idx);
		return count;
	}
	
	
	/*-----------------예약조회 병모----------------*/
	/////////////병길///////////////////
	@Override
	public List<HomeGymEquipmentDTO> adminHomeGymEquipmentInfo(String hg_mem_id) {
		List<HomeGymEquipmentDTO> list = sqlMap.selectList("adminHomeGymEqList", hg_mem_id);
		return list;
	}
	@Override
	public HomeGymDTO adminHomeGymInfo(String hg_mem_id) {
		HomeGymDTO dto = sqlMap.selectOne("adminHomeGym", hg_mem_id);
		return dto;
	}
	@Override
	public int adminHomeGymMemberIdx(String hg_mem_id) {
		int result = sqlMap.selectOne("adminHomeGymMemberIdx", hg_mem_id);
		return result;
	}
	@Override
	public PaymentDTO adminHomeGymPaymentInfo(String hg_mem_id) {
		PaymentDTO dto = sqlMap.selectOne("adminHomeGymPayment", hg_mem_id);
		return dto;
	}
	@Override
	public Double adminHomeGYmStarAvg(String hg_mem_id) {
		double starAvg = sqlMap.selectOne("adminHomeGYmStarAvg", hg_mem_id);
		return starAvg;
	}
	@Override
	public int adminHomeGymApprovedChange(Map<String, Object> map) {
		int result = sqlMap.update("adminHomeGymApprovedChangeSQL", map);
		return result;
	}
	/////////////////////병길///////////////
}
