package zipcok.mypage.model;

import java.util.*;

import zipcok.coach.model.CoachFileDTO;
import zipcok.member.model.MemberDTO;

public interface MypageDAO {

	public MemberDTO memberProfile(String mem_id);
	public CoachFileDTO memberProfilePhoto(String mem_id);
	public int mypagePwdUpdate(MemberDTO dto);
	public int mypageAddrUpdate(MemberDTO dto);
	public int mypageEmailUpdate(MemberDTO dto);
	public int mypagePhoneUpdate(MemberDTO dto);
	
	
}
