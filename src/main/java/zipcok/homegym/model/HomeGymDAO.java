package zipcok.homegym.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import zipcok.coach.model.CoachFileDTO;

public interface HomeGymDAO {
	public boolean HomeGymCheck(String id);
	public int HomeGymAdd(HomeGymDTO dto);
	public int HomeGymTotalCnt(Map<String, Object> options);
	public List<HomeGymDTO> HomeGymList(Map<String, Object> options);
	public int HomeGymImgUpload(ArrayList<CoachFileDTO> list);
	public String HomeGymNickNameCheck(String hg_nickname);
	public int HomeGymAddPrice();
	public List<HomeGymEquipmentDTO> UserEquipmentList(String userid);
}
