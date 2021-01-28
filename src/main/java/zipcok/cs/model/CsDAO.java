package zipcok.cs.model;
import java.util.*;
public interface CsDAO {

	public int getTotalCnt(); //총게시물 수
	public List csAllList(int cp,int ls); //리스트
	public int csWrite(CsDTO dto);
}
