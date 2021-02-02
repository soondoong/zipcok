package zipcok.coachmypage.model;

import java.util.*;

public interface CoachMypageDAO {
	
	public int requestDelete(int req_idx) ;
	public int requestStatusChange(int req_idx) ;
	public int coachMypageHomeGymLikeListTotalCnt(String mem_id);
	public List coachMypageHomeGymLikeList(int cp, int ls, String mem_id);
}
