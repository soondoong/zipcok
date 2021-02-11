package zipcok.admin.model;

import java.util.*;

import zipcok.member.model.MemberDTO;

public interface AdminMemberDAO {

	public int adminMemberTotalCnt(HashMap<String, Object> map);
	public List<MemberDTO> adminMemberList(HashMap<String, Object> map);
	public MemberDTO adminMemberManage(String mem_id);
	
}
