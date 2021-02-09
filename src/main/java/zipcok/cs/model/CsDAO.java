package zipcok.cs.model;
import java.util.*;



public interface CsDAO {

	public int getTotalCnt(); //총게시물 수
	
	public List csAllList(int cp,int ls); //리스트
	
	public int csWrite(CsDTO dto);//게시물등록
	
	public int csUpdate(CsDTO dto);//게시물수정
	
	public int csDelete(int bbs_idx);//게시물삭제
	
	public int csAndFileDel(int bbs_idx);//게시물 삭제될 때 파일도 함께 삭제
	
	public CsDTO csContent(int bbs_idx);//상세보기
	
	public int csMaxIdx();//최신글idx구하기
	
	public List<CsZipcokFileDTO> CsZfileSelect(int bbs_idx);//파일조회하기
	
	public int csFileUpload(ArrayList<CsZipcokFileDTO> fileArr);//파일업로드하기
	
	public int deleteCsFile(String fileName);//파일삭제한척
	
	public int cszfileRealDelete();//파일데이터삭제
	
	public int csReadnum(int bbs_idx);//고객센터 조회수
	
	public int csReWrite(CsReDTO dto);//고객센터 답변달기
	
	public CsReDTO csReList(int re_bbs_idx);//고객센터 답변가져오기
	

	public int csReDelete(int re_idx);//고객센터 답변 지우기
}
