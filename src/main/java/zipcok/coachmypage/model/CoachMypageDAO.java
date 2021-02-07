package zipcok.coachmypage.model;

import java.util.*;

import zipcok.coach.model.CoachFileDTO;
import zipcok.member.model.MemberDTO;

public interface CoachMypageDAO {
	
	public int requestDelete(int req_idx) ;
	public int requestStatusChange(int req_idx) ;
	public int coachMypageHomeGymLikeListTotalCnt(String mem_id);
	public List coachMypageHomeGymLikeList(int cp, int ls, String mem_id);
	public int coachMypageWriteListTotalCnt(String mem_id);
	public List coachMypageWriteList(int cp, int ls, String mem_id);
	public MemberDTO coachMypageProfile(String mem_id);
	public int coachMypagePwdUpdate(MemberDTO dto);
	public int coachMypageAddrUpdate(MemberDTO dto);
	public int coachMypageEmailUpdate(MemberDTO dto);
	public int coachMypagePhoneUpdate(MemberDTO dto);
	public CoachFileDTO findProfileDTO(String id); //프로필파일수정
	public int deleteProfileImg(CoachFileDTO dto); //프로필파일수정
	public int insertProfileImg(CoachFileDTO dto); //프로필파일수정
}
