package zipcok.homegym.model;

import java.util.ArrayList;
import java.util.List;

import zipcok.coach.model.CoachFileDTO;

public interface HomeGymDAO {
	public boolean HomeGymCheck(String id);
	public int HomeGymAdd(HomeGymDTO dto);
	public List<HomeGymDTO> HomeGymList();
	public int HomeGymImgUpload(ArrayList<CoachFileDTO> list);
}
