package zipcok.coach.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.sun.javafx.collections.MappingChange.Map;

public interface CoachDAO {
	
	public HashMap<String, List<MainCoachDTO>> mainCoachList(HashMap<String,String> categoryMap);
	public List<MainCoachDTO> searchCoachList(HashMap<String, Object> keys,int cp, int ls);
	public int getTotalCnt(HashMap map);
	public int coachJoin( HashMap<String, Object> map);
	public int coachInfoFileUpload(ArrayList<CoachFileDTO> fileArr);
	public ArrayList<CategoryDTO> findCategory(String id);
}
