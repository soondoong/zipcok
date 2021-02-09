package zipcok.comm.model;

import java.util.*;

public interface FoodBbsDAO {
	
	public int foodWrite(FoodBbsDTO dto);
	public int getMaxFoodIdx();
	public List foodList(int cp,int ls);
	public int getTotalCnt();
	public FoodBbsDTO foodContent(int food_idx);
	public int foodUpdate(FoodBbsDTO dto);
	public int foodDelete(int food_idx);
	public int foodReadnum(int food_idx);
		
	//댓글
	public int foodGetMaxSunbun(int re_idx);
	public int foodReWrite(FoodBbsDTO dto);
	public int foodReDelete(int re_group);
	public int foodReReDelete(int re_idx);
	public List foodReList(int re_bbs_idx);
	public int foodGetTotalRe(int re_bbs_idx);
	public int foodSetTotalRe(int ex_recnt,int ex_idx);
	public int foodGetSunbun_p(int re_group);
	public int foodGetLev(int re_idx);
	public void foodReUpdate(int ex_idx, int re_sunbun);
	public int foodReReWrite(ExReBbsDTO dto);
	
	
	
	
}
