package zipcok.coach.model;

import java.util.HashMap;
import java.util.List;

import com.sun.javafx.collections.MappingChange.Map;

public interface CoachDAO {
	
	public HashMap<String, List<MainCoachDTO>> mainCoachList();
	public List<MainCoachDTO> searchCoachList(HashMap<String, String> keys);

}
