package zipcok.admin.model;

import java.util.*;

import zipcok.member.model.MemberDTO;

public interface AdminMemberDAO {

	public int adminMemberTotalCnt(HashMap<String, Object> map);
	public List<MemberDTO> adminMemberList(HashMap<String, Object> map);
	public MemberDTO adminMemberManage(String mem_id);
	public int adminMemberPwdUpdate(MemberDTO dto);
	public int adminMemberNameUpdate(MemberDTO dto);
	public int adminMemberPhoneUpdate(MemberDTO dto);
	public int adminMemberEmailUpdate(MemberDTO dto);
	public int adminMemberTypeUpdate(MemberDTO dto);
	public int adminMemberAddrUpdate(MemberDTO dto);
	
}
