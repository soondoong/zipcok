package zipcok.comm.model;

import java.util.*;

public interface ExBbsDAO {
	
	public int dailyWrite(ExBbsDTO dto);
	public int getMaxExIdx();
	public List dailyList(int cp,int ls,int ex_comm_idx);
	public int getTotalCnt();
	public ExBbsDTO dailyContent(int idx);
	public int dailyUpdate(ExBbsDTO dto);
	public int dailyDelete(int ex_idx);
	public int dailyReadnum(int ex_idx);
	
	//댓글
	public int dailyGetMaxSunbun(int re_idx);
	public int dailyReWrite(ExReBbsDTO dto);
	public int dailyReDelete(int re_group);
	public int dailyReReDelete(int re_idx);
	public List dailyReList(int re_bbs_idx);
	public int dailyGetTotalRe(int re_bbs_idx);
	public int dailySetTotalRe(int ex_recnt,int ex_idx);
	public int dailyGetSunbun_p(int re_idx);
	public int dailyGetLev(int re_idx);
	public void dailyReUpdate(int ex_idx, int re_sunbun);
	public int dailyReReWrite(ExReBbsDTO dto);

}
