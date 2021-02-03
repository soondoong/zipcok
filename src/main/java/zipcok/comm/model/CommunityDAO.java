package zipcok.comm.model;

import java.util.*;

public interface CommunityDAO {
	
	public CommunityDTO commList(String mem_id, String mem_type);
	public String getCaochName(String com_coach_id);
	
	

}
