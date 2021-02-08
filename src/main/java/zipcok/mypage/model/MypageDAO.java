package zipcok.mypage.model;

import java.util.*;

import zipcok.coach.model.CoachFileDTO;
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

}