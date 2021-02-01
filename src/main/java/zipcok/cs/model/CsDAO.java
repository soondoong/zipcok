package zipcok.cs.model;
import java.util.*;



public interface CsDAO {

	public int getTotalCnt(); //총게시물 수
	public List csAllList(int cp,int ls); //리스트
	public int csWrite(CsDTO dto);
	public int csUpdate(CsDTO dto);
	public CsDTO csContent(int bbs_idx);
	public int csMaxIdx();
	public List<CsZipcokFileDTO> zfileSelect(int bbs_idx);
	public int csFileUpload(ArrayList<CsZipcokFileDTO> fileArr);
}
