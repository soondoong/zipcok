package zipcok.coach.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.sun.javafx.collections.MappingChange.Map;

import zipcok.homegym.model.PaymentDTO;
import zipcok.mypage.model.LikeDTO;

public interface CoachDAO {
	
	public HashMap<String, List<MainCoachDTO>> mainCoachList(HashMap<String,String> categoryMap);
	public List<MainCoachDTO> searchCoachList(HashMap<String, Object> keys,int cp, int ls);
	public List<MainCoachDTO> 	ajaxSearchCoachList(HashMap<String, Object> keys,int cp, int ls);
	public int getTotalCnt(HashMap map);
	public int getAjaxTotalCnt(HashMap<String,Object> map);
	public int coachJoin( HashMap<String, Object> map);
	public int coachInfoFileUpload(ArrayList<CoachFileDTO> fileArr);
	public ArrayList<CategoryDTO> findCategory(String id);
	public HashMap<String,Object> coachProfile(String id);
	public int sendRequestForm(RequestFormDTO dto);
	public List<RequestFormDTO> searchRequestList(HashMap<String, Object> keys,int cp, int ls);
	public RequestFormDTO findOneRequest(int req_idx);
	
	public int insertLike(LikeDTO dto);//좋아요 추가
	public int deleteLike(LikeDTO dto);//좋아요 삭제
	
	public int coachAccountAdd(PaymentDTO dto); //결제계좌등록
}
