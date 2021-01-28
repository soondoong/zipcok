package zipcok.mypage.model;

import java.util.*;

import zipcok.member.model.MemberDTO;

public interface MypageDAO {

	public List memberProfile(String mem_id);
	public int mypagePwdUpdate(MemberDTO dto);
}
