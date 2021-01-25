package zipcok.homegym.model;

import java.util.List;

public interface HomeGymDAO {
	public boolean HomeGymCheck(String id);
	public int HomeGymAdd(HomeGymDTO dto, HomeGymEquipmentDTO dto2);
	public List<HomeGymDTO> HomeGymList();
	
}
