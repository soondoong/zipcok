package zipcok.homegym.model;

import java.util.List;
import java.util.Map;

public interface HomeGymEquipmentDAO {
	public int HomeGymEquipmentAdd(Map<String, Object> map);
	public List<HomeGymEquipmentDTO> UserEquipmentList(String userid);
	public List<HomeGymEquipmentDTO> HomeGymEquipmentContent(String homegymId);
	
}
