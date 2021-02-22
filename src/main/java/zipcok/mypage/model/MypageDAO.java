package zipcok.mypage.model;

import java.util.*;

import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.ReviewDTO;
import zipcok.cs.model.CsDTO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymEquipmentDTO;
import zipcok.homegym.model.PaymentDTO;
import zipcok.homegym.model.Pd_AllDTO;
import zipcok.homegym.model.Pd_HgAllDTO;
import zipcok.member.model.MemberAllDTO;
import zipcok.member.model.MemberDTO;

public interface MypageDAO {

   public MemberDTO memberProfile(String mem_id);
   public MemberAllDTO memberAllProfile(String mem_id);
   public CoachFileDTO memberProfilePhoto(String mem_id);
   public int mypagePwdUpdate(MemberDTO dto);
   public int mypageAddrUpdate(MemberDTO dto);
   public int mypageEmailConfirm(String mem_email);
   public int mypageEmailUpdate(MemberDTO dto);
   public int mypagePhoneUpdate(MemberDTO dto);
   public int mypageWriteListTotalCnt(String mem_id);//작성글 수
   public List mypageWriteList(int cp, int ls, String mem_id);//작성글 목록
   public int mypageWriteDelete(String checkArr);//작성글 삭제
   public int mypageCommWriteListTotalCnt(String ex_id);//커뮤니티 작성글 수
   public List mypageCommWriteList(int cp, int ls, String ex_id);//커뮤니티 작성글 목록
   public int mypageCommWriteDelete(String checkArr);//커뮤니티 작성글 삭제
   public int mypageCommWriteDeleteRebbs(String checkArr);//커뮤니티 작성글 댓글삭제
   public int mypageHomeGymLikeListTotalCnt(String mem_id);
   public List<LikeDTO> mypageHomeGymLikeList(int cp, int ls, String mem_id);
   public List<CoachFileDTO> HomeGymLikeTargetProfile(HashMap<String, Object> map);
   public int mypageCoachMatchLikeListTotalCnt(String mem_id);
   public List mypageCoachMatchLikeList(int cp, int ls, String mem_id);
   public CoachFileDTO moFindProfileDTO(String id); //프로필파일수정
   public int moDeleteProfileImg(CoachFileDTO dto); //프로필파일수정
   public int moInsertProfileImg(CoachFileDTO dto); //프로필파일수정
   //public int memberDelete(String mem_id);
   //public int memberPhotoDelete(String mem_id);
   public HomeGymDTO mypageHomeGymInfo(String user_id);
   public List<HomeGymEquipmentDTO> mypageHomeGymEqInfo(String user_id);
   public List<CoachFileDTO> mypageHomeGymImgInfo(String user_id);
   public int mypageHomeGymLikeCount(String user_id);
   public List<ReviewDTO> HomeGymReview(String homegymId);
   public int mypageHomeGymStautsChange(Map<String, String> map);
   public int mypageHomeGymAddrUpdate(Map<String, String> map);

   public int mypageHomeGymStationUpdate(Map<String, String> map);
   public int mypageHomeGymPerson_countUpdate(Map<String, Object> map);
   public int mypageHomeGymPriceUpdate(Map<String, Object> map);

   /*결제내역*/
  public List<Pd_AllDTO> coachPaymentList(HashMap<String,Object> map);
  public int getTotalCntPaymentList(HashMap<String,Object> map);
 /*후기추가*/
  public int coachStarReviewAdd(ReviewDTO rdto);
  public List reviewExistCheck(HashMap<String,Object> map); //후기가잇는지 존재여부체크
  public ReviewDTO showReview(int rev_idx);//후기보여주기
  public boolean mypageHomeGymCheck(String id);
  public int mypageHomeGymEqAllDelete(String mem_id);
  public int mypageHomeGymEqUpdate(Map<String, String> map);
  public int mypageHomeGymUseDateUpdate(Map<String, Object>map);
  public int mypageHomeGymUseTimeUpdate(Map<String, Object>map);
  public int mypageHomeGymPayListTotalCnt(Map<String, Object> map);
  public List<Pd_HgAllDTO> mypageHomeGymPayList(Map<String, Object> map);
  public boolean mypageHomeGymReviewCheck(int pd_idx);
  public int mypageMyPayListTotalCnt(Map<String, Object> map);
  public List<Pd_HgAllDTO> mypageMyPayList(Map<String, Object> map);
  public boolean mypageMyReviewCheck(int pd_idx);
  public String mypageHomeGymNickname(String pd_target_id);
  public int mypageHomeGymReviewAdd(ReviewDTO dto);
  public ReviewDTO mypageHomeGymReviewView(int pd_idx);
  public int mypagehomegympaymentCancel_payment(int pd_idx);
  public int mypagehomegympaymentCancel_reservation(int reser_idx);
  public PaymentDTO mypageHomeGymPaymentFind(String mem_id);
  public ReviewDTO homegymReview(int pd_idx);

}