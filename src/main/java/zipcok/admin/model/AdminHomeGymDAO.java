package zipcok.admin.model;

import java.util.*;

import zipcok.homegym.model.HomeGymReservationDTO;

public interface AdminHomeGymDAO {

	public int adminHomeGymReservationSearchTotalCnt(HashMap<String, Object> map);
	public List<HomeGymReservationDTO> adminHomeGymReservationSearch(HashMap<String, Object> map);
	
}
