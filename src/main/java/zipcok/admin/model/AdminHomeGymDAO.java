package zipcok.admin.model;

import java.util.*;

import zipcok.homegym.model.HomeGymReservationDTO;

public interface AdminHomeGymDAO {

	public int adminHomeGymReservationSelectTotalCnt(HashMap<String, Object> map);
	public List<HomeGymReservationDTO> adminHomeGymReservationSelect(HashMap<String, Object> map);
	public int adminHomeGymReservationSearchTotalCnt(HashMap<String, Object> map);
	public List<HomeGymReservationDTO> adminHomeGymReservationSearch(HashMap<String, Object> map);
	public int adminHomeGymReservationDateTotalCnt(HashMap<String, Object> map);
	public List<HomeGymReservationDTO> adminHomeGymReservationDate(HashMap<String, Object> map);
	
}
