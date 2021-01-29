package zipcok.homegym.model;

import java.util.ArrayList;
import java.util.List;

import zipcok.coach.model.CoachFileDTO;

public interface HomeGymDAO {
	public boolean HomeGymCheck(String id);
	public int HomeGymAdd(HomeGymDTO dto);
	public List<HomeGymDTO> HomeGymList(int cp, int listSize,String location, int year, int month, int day);
	public int HomeGymImgUpload(ArrayList<CoachFileDTO> list);
	public String HomeGymNickNameCheck(String hg_nickname);
	public int HomeGymAddPrice();
	public int HomeGymTotalCnt(String location, int year, int month, int day);
}
