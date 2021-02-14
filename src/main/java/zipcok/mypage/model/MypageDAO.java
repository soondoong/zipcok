package zipcok.mypage.model;

import java.util.*;

import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.ReviewDTO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymEquipmentDTO;
import zipcok.homegym.model.Pd_AllDTO;
import zipcok.member.model.MemberAllDTO;
import zipcok.member.model.MemberDTO;

public interface MypageDAO {

   public MemberDTO memberProfile(String mem_id);
   public MemberAllDTO memberAllProfile(String mem_id);
   public CoachFileDTO memberProfilePhoto(String mem_id);
   public int mypagePwdUpdate(MemberDTO dto);
   public int mypageAddrUpdate(MemberDTO dto);
   public int mypageEmailUpdate(MemberDTO dto);
   public int mypagePhoneUpdate(MemberDTO dto);
   public int mypageWriteListTotalCnt(String mem_id);
   public List mypageWriteList(int cp, int ls, String mem_id);
   public int mypageHomeGymLikeListTotalCnt(String mem_id);
   public List mypageHomeGymLikeList(int cp, int ls, String mem_id);
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
   /*결제내역*/
  public List<Pd_AllDTO> coachPaymentList(HashMap<String,Object> map);
  public int getTotalCntPaymentList(HashMap<String,Object> map);
 /*후기추가*/
  public int coachStarReviewAdd(ReviewDTO rdto);
  
}