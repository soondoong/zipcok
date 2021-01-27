package zipcok.comm.model;

import java.util.*;

public interface ExBbsDAO {
	
	public int dailyWrite(ExBbsDTO dto);
	public List dailyList(int cp,int ls);
	public int getTotalCnt();
	public ExBbsDTO dailyContent(int idx);
	public int dailyUpdate(ExBbsDTO dto);
	public int dailyDelete(int ex_idx);
	public int dailyReadnum(int ex_idx);
	public int dailyGetMaxSunbun(int re_idx);
	public int dailyReWrite(ExReBbsDTO dto);
	public int dailyReDelete(int re_idx);
	public List dailyReList(int re_bbs_idx);

}
