package zipcok.admin.model;

import java.util.*;

import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymReservationDTO;

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

	

	
}
