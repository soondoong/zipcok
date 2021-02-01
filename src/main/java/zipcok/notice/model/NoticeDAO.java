package zipcok.notice.model;

import java.util.*;

import zipcok.coach.model.CoachFileDTO;

public interface NoticeDAO {
	
	public int noticeWrite(NoticeDTO dto);
	public List noticeAllList(int cp,int ls);
	public int getTotalCnt();
	public int getCateTotalCnt(String bbs_category);
	public NoticeDTO noticeContent(int bbs_idx);
	public List noticeSearchList(int cp,int ls, String bbs_category);
	public int noticeUpdate(NoticeDTO dto);
	public int deleteFile(ZipcokFileDTO dto);
	public int noticeDelete(int bbs_idx);
	public int noticeReadnum(int bbs_idx);
	
	public int findRownum(int bbs_idx);
	public NoticeDTO noticePrevNext(int rnum);
	
	public int noticeFileUpload(ArrayList<ZipcokFileDTO> fileArr);
	public int noticeMaxIdx();
	public List<ZipcokFileDTO> zfileSelect(int bbs_idx);
}
