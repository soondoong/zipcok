package zipcok.member.model;

import java.util.*;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;

import zipcok.coach.model.CoachFileDTO;

public class MemberDAOImple implements MemberDAO {

	private SqlSessionTemplate sqlMap;

	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int memberJoinSubmit(HashMap<String,Object> map) {
		int count = sqlMap.insert("memberJoin", map.get("memberDTO"));
		
		int fileCount=0;
		ArrayList<CoachFileDTO> arr=(ArrayList<CoachFileDTO>)map.get("fileArr");
		for(int i=0; i<arr.size(); i++) {
			fileCount+=sqlMap.insert("insertMemberInfoFile",arr.get(i));
		}
			
		return count+fileCount;
	}
	
	

	@Override
	public String idCheck(String mem_id) {
		String str = sqlMap.selectOne("idCheck", mem_id);
		return str;
	}
	
	@Override
	public String pwdCheck(String mem_id) {
		String str = sqlMap.selectOne("pwdCheck", mem_id);
		return str;
	}
		
	@Override
	public String getMemberName(String mem_id) {
		String str = sqlMap.selectOne("getMemberName", mem_id);
		return str;
	}
	
	@Override
	public String idFind(String mem_email) {
		String str = sqlMap.selectOne("idFind", mem_email);
		return str;
	}
	
	@Override
	public String pwdFind(String mem_id) {
		String str = sqlMap.selectOne("pwdFind", mem_id);
		return str;
	}
	
	
	@Override
	public int pwdUpdate(String mem_id) {
		int count = sqlMap.update("pwdUpdate", mem_id);
		return count;
	}
	
	
	
}


