package zipcok.comm.model;

import java.util.*;

public interface CommunityDAO {
	
	public List<Integer> commList(String mem_id, String mem_type);
	public String getCommName(int com_idx);
	public String getCaochName(String com_coach_id);
	public CommunityDTO getComInfo(int com_idx);
	
	

}
