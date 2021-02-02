package zipcok.mypage.model;

import java.util.*;

import zipcok.coach.model.CoachFileDTO;
import zipcok.cs.model.CsDTO;
import zipcok.member.model.MemberDTO;

public interface MypageDAO {

	public MemberDTO memberProfile(String mem_id);
	public CoachFileDTO memberProfilePhoto(String mem_id);
	public int mypagePwdUpdate(MemberDTO dto);
	public int mypageAddrUpdate(MemberDTO dto);
	public int mypageEmailUpdate(MemberDTO dto);
	public int mypagePhoneUpdate(MemberDTO dto);
	public int mypageWriteListTotalCnt();
	public List mypageWriteList(int cp, int ls, String mem_id);
	public int mypageHomeGymLikeListTotalCnt();
	public List mypageHomeGymLikeList(int cp, int ls, String mem_id);
	public String likeListKey(String mem_id);
}
