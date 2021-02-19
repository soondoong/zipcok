package zipcok.admin.model;

import java.util.*;

import zipcok.coach.model.ReviewDTO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymEquipmentDTO;
import zipcok.homegym.model.HomeGymReservationDTO;
import zipcok.homegym.model.PaymentDTO;

public interface AdminHomeGymDAO {
	////////////////// 병모 /////////////////////
	public int adminHomeGymReservationAllTotalCnt(HashMap<String, Object> map);
	public List<HomeGymReservationDTO> adminHomeGymReservationAll(HashMap<String, Object> map);
	public int adminHomeGymReservationSelectTotalCnt(HashMap<String, Object> map);
	public List<HomeGymReservationDTO> adminHomeGymReservationSelect(HashMap<String, Object> map);
	public int adminHomeGymReservationSearchTotalCnt(HashMap<String, Object> map);
	public List<HomeGymReservationDTO> adminHomeGymReservationSearch(HashMap<String, Object> map);
	public int adminHomeGymReservationDateTotalCnt(HashMap<String, Object> map);
	public List<HomeGymReservationDTO> adminHomeGymReservationDate(HashMap<String, Object> map);
	public int reservationCancelStatus(String mem_id);//취소승인 상태변경
	public int reservationCancelStatusPayment(String pd_mem_id);//취소승인 마이페이지 상태변경
	//////////////////병모 /////////////////////
	
	
	public List<HomeGymDTO> adminHomeGymSearch(HashMap<String, Object> map);//홈짐검색했을때 리스트 뽑아오기
	public int adminHomeGymSearchTotalCnt(HashMap<String, Object> map);//홈짐검색 시 총게시물 수 가져오기
	
	///////////////////병길////////////////////
	public HomeGymDTO adminHomeGymInfo(String hg_mem_id);
	public int adminHomeGymMemberIdx(String hg_mem_id);
	public List<HomeGymEquipmentDTO> adminHomeGymEquipmentInfo(String hg_mem_id);
	public PaymentDTO adminHomeGymPaymentInfo(String hg_mem_id);
	public Double adminHomeGYmStarAvg(String hg_mem_id);
	public int adminHomeGymApprovedChange(Map<String, Object> map);
	///////////////////병길////////////////////
}
