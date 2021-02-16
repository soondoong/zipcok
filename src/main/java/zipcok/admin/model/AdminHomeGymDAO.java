package zipcok.admin.model;

import java.util.*;

import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymReservationDTO;

public interface AdminHomeGymDAO {

	public int adminHomeGymReservationSearchTotalCnt(HashMap<String, Object> map);
	public List<HomeGymReservationDTO> adminHomeGymReservationSearch(HashMap<String, Object> map);
	public List<HomeGymDTO> adminHomeGymSearch(HashMap<String, Object> map);//홈짐검색했을때 리스트 뽑아오기
	public int adminHomeGymSearchTotalCnt(HashMap<String, Object> map);//홈짐검색 시 총게시물 수 가져오기
	
}
