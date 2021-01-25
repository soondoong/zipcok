package zipcok.homegym.model;

import java.util.List;

public interface HomeGymEquipmentDAO {
	public int HomeGymEquipmentAdd(HomeGymEquipmentDTO dto);
	public List<HomeGymEquipmentDTO> HomeGymEquipmentSelect(String id);
	
}
