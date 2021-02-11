package zipcok.homegym.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.ReviewDTO;

public interface HomeGymDAO {
	public boolean HomeGymCheck(String id);
	public int HomeGymAdd(HomeGymDTO dto);
	public List<HomeGymDTO> HomeGymList(Map<String, Object> options);
	public int HomeGymTotalCnt(Map<String, Object> options);
	public int HomeGymImgUpload(ArrayList<CoachFileDTO> list);
	public String HomeGymNickNameCheck(String hg_nickname);
	public String HomeGymAddPrice();
	public HomeGymDTO HomeGymContent(String homegymId);
	public List<CoachFileDTO> HomeGymImageContent(String homegymId);
	public List<ReviewDTO> HomeGymReview(String homegymId);
	public String HomeGymIdImgSelect(String homegymId);
}
