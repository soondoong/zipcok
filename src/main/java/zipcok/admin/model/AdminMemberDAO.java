package zipcok.admin.model;

import java.util.*;

import zipcok.member.model.MemberDTO;

public interface AdminMemberDAO {

	public int adminMemberTotalCnt(Map<String, Object> map);
	public List<MemberDTO> adminMemberList(Map<String, Object> map);
	
}
