package zipcok.coachmypage.model;

import java.util.*;

import zipcok.coach.model.CategoryDTO;
import zipcok.coach.model.CoachDTO;
import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.CurriDTO;

import zipcok.homegym.model.PaymentDTO;
import zipcok.homegym.model.Payment_detailsDTO;
import zipcok.coach.model.ReviewDTO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymEquipmentDTO;
import zipcok.homegym.model.HomeGymPayListDTO;
import zipcok.homegym.model.Pd_AllDTO;
import zipcok.homegym.model.Pd_HgAllDTO;
import zipcok.member.model.MemberAllDTO;
import zipcok.member.model.MemberDTO;
import zipcok.mypage.model.LikeDTO;

public interface CoachMypageDAO {
	
	public int requestDelete(int req_idx) ;
	public int requestStatusChange(int req_idx) ; //상담요청서 상태변경
	public int reqStatusChangetoOk(int req_idx,String status); //상담요청서 상태변경
	public int coachMypageHomeGymLikeListTotalCnt(String mem_id);
	public List<LikeDTO> coachMypageHomeGymLikeList(int cp, int ls, String mem_id);
	public MemberAllDTO memberAllProfile2(String mem_id);
	public int coachMypageWriteListTotalCnt(String mem_id);//작성글 수
	public List coachMypageWriteList(int cp, int ls, String mem_id);//작성글 목록
	public int coachMypageWriteDelete(String checkArr);//작성글 삭제
	public int coachMypageCommWriteListTotalCnt(String ex_id);//커뮤니티 작성글 수
	public List coachMypageCommWriteList(int cp, int ls, String ex_id);//커뮤니티 작성글 목록
	public int coachMypageCommWriteDelete(String checkArr);//커뮤니티 작성글 삭제
	public MemberDTO coachMypageProfile(String mem_id);
	public int coachMypagePwdUpdate(MemberDTO dto);
	public int coachMypageAddrUpdate(MemberDTO dto);
	public int coachMypageEmailConfirm(String mem_email);
	public int coachMypageEmailUpdate(MemberDTO dto);
	public int coachMypagePhoneUpdate(MemberDTO dto);
	public CoachFileDTO findProfileDTO(String id); //프로필파일수정
	public int deleteProfileImg(CoachFileDTO dto); //프로필파일수정
	public int insertProfileImg(CoachFileDTO dto); //프로필파일수정
	public List<CategoryDTO> categoryFind(String id);//아이디로 카테고리찾기
	public int categoryinsert(CategoryDTO dto);//카테고리넣기
	public int categoryDelete(HashMap<String,String> map);//카테고리삭제
	public void curriInsert(CurriDTO cdto);//커리큘럼등록
	public void curriUpdate(CurriDTO cdto);//커리큘럼수정
	public void curriDelete(CurriDTO cdto);//커리큘럼 삭제
	public List<Pd_AllDTO> CmPaymentList(HashMap<String,Object> map); //코치매칭된결제내역

	public PaymentDTO getCoachAccount(String coachId,String key);//코치결제계좌dto찾기

	public boolean coachmypageHomeGymCheck(String id);
	public int coachmypageHomeGymEqAllDelete(String mem_id);
	public int coachmypageHomeGymEqUpdate(Map<String, String> map);
	public int coachmypageHomeGymUseDateUpdate(Map<String, Object>map);
	public int coachmypageHomeGymUseTimeUpdate(Map<String, Object>map);
    public HomeGymDTO coachmypageHomeGymInfo(String user_id);
    public List<HomeGymEquipmentDTO> coachmypageHomeGymEqInfo(String user_id);
    public List<CoachFileDTO> coachmypageHomeGymImgInfo(String user_id);
    public int coachmypageHomeGymLikeCount(String user_id);
    public List<ReviewDTO> coachHomeGymReview(String homegymId);
    public int coachmypageHomeGymStautsChange(Map<String, String> map);
    public int coachmypageHomeGymAddrUpdate(Map<String, String> map); 
    public int coachmypageHomeGymStationUpdate(Map<String, String> map);
    public int coachmypageHomeGymPerson_countUpdate(Map<String, Object> map);
    public int coachmypageHomeGymPriceUpdate(Map<String, Object> map);
    public int coachmypageHomeGymPayListTotalCnt(Map<String, Object> map);
    public List<Pd_HgAllDTO> coachmypageHomeGymPayList(Map<String, Object> map);
    public boolean coachmypageHomeGymReviewCheck(int pd_idx);
    public int coachmypageMyPayListTotalCnt(Map<String, Object> map);
    public List<Pd_HgAllDTO> coachmypageMyPayList(Map<String, Object> map);
    public boolean coachmypageMyReviewCheck(int pd_idx);
    public String coachmypageHomeGymNickname(String pd_target_id);
    public int coachmypageHomeGymReviewAdd(ReviewDTO dto);
    public ReviewDTO coachmypageHomeGymReviewView(int pd_idx);
    public int coachmypagehomegympaymentCancel_payment(int pd_idx);
    public int coachmypagehomegympaymentCancel_reservation(int reser_idx);
    public PaymentDTO coachmypageHomeGymPaymentFind(String mem_id);
    
    
    /*paymentDTO로 결제계좌정보 수정*/
    public int accountUpdate(PaymentDTO dto);
    /*코치활동주소 변경*/
	public int coachAddrUpdate(CoachDTO dto);
  
}
