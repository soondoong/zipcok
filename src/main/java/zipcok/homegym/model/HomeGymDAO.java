package zipcok.homegym.model;

import java.util.ArrayList;
import java.util.List;

import zipcok.coach.model.CoachFileDTO;

public interface HomeGymDAO {
	public boolean HomeGymCheck(String id);
	public int HomeGymAdd(HomeGymDTO dto);
	public List<HomeGymDTO> HomeGymList(int cp, int listSize,String location, String year, String month, String day);
	public int HomeGymImgUpload(ArrayList<CoachFileDTO> list);
	public String HomeGymNickNameCheck(String hg_nickname);
	public int HomeGymAddPrice();
	public int HomeGymTotalCnt(String location, String year, String month, String day);
}
