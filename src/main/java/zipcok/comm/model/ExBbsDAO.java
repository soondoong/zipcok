package zipcok.comm.model;

import java.util.*;

public interface ExBbsDAO {
	
	public int dailyWrite(ExBbsDTO dto);
	public List dailyList(int cp,int ls);
	public int getTotalCnt();
	public ExBbsDTO dailyContent(int idx);
	public int dailyUpdate(ExBbsDTO dto, int idx);

}
