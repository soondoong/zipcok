package zipcok.notice.model;

import java.util.*;


public interface NoticeDAO {
	
	public int noticeWrite(NoticeDTO dto);//게시물등록
	public List noticeAllList(int cp,int ls);//모든게시물리스트
	public int getTotalCnt();//총게시물수
	public int getCateTotalCnt(String bbs_category);//카테고리별총게시물수
	public NoticeDTO noticeContent(int bbs_idx);//상세보기
	public List noticeSearchList(int cp,int ls, String bbs_category);//카테고리별게시물리스트
	public int noticeUpdate(NoticeDTO dto);//게시물수정
	public int deleteFile(String fileName);//파일삭제한척
	public int noticeDelete(int bbs_idx);//게시물삭제
	public int noticeAndFileDel(int bbs_idx);//게시물삭제될 때 파일도 함께 삭제
	public int zfileRealDelete();//파일데이터삭제
	public int noticeReadnum(int bbs_idx);//공지사항 조회수
	
	public int findRownum(int bbs_idx);//이전글다음글하기위한로우넘구하는메서드
	public NoticeDTO noticePrevNext(int rnum);//이전글다음글
	
	public int noticeFileUpload(ArrayList<ZipcokFileDTO> fileArr);//파일업로드
	public int noticeMaxIdx();//최신글idx구하기
	public List<ZipcokFileDTO> zfileSelect(int bbs_idx);//파일조회하기
}
