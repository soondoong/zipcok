package zipcok.notice.model;

import java.util.*;

public interface NoticeDAO {
	
	public int noticeWrite(NoticeDTO dto);
	public List noticeAllList(int cp,int ls);
	public int getTotalCnt();

}
