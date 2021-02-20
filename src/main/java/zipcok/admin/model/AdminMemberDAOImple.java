package zipcok.admin.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.member.model.MemberDTO;

@Service
public class AdminMemberDAOImple implements AdminMemberDAO {

	@Autowired	
	private SqlSessionTemplate sqlMap;
	
	//관리자 회원 총수
	@Override
	public int adminMemberTotalCnt(HashMap<String, Object> map) {
		int totalCnt = sqlMap.selectOne("adminMemberTotalCnt", map);
		return totalCnt;
	}
	//관리자 회원 리스트
	@Override
	public List<MemberDTO> adminMemberList(HashMap<String, Object> map) {
		List<MemberDTO> list = sqlMap.selectList("adminMemberList", map);
		return list;
	}
	//관리자 회원 정보 관리
	@Override
	public MemberDTO adminMemberManage(String mem_id) {
		MemberDTO dto=sqlMap.selectOne("adminMemberManage", mem_id);
		return dto;
	}
	//관리자 회원 비번수정
	@Override
	public int adminMemberPwdUpdate(MemberDTO dto) {
		int count = sqlMap.update("adminMemberPwdUpdate", dto);
	      return count;
	}
	//관리자 회원 이름 수정
	@Override
	public int adminMemberNameUpdate(MemberDTO dto) {
		int count = sqlMap.update("adminMemberNameUpdate", dto);
	      return count;
	}
	//관리자 회원 폰번호 수정
	@Override
	public int adminMemberPhoneUpdate(MemberDTO dto) {
		int count = sqlMap.update("adminMemberPhoneUpdate", dto);
	      return count;
	}
	
	//관리자 회원 이메일 수정
	@Override
	public int adminMemberEmailUpdate(MemberDTO dto) {
		int count = sqlMap.update("adminMemberEmailUpdate", dto);
		return count;
	}
	
	//관리자 회원 타입 수정
	@Override
	public int adminMemberTypeUpdate(MemberDTO dto) {
		int count = sqlMap.update("adminMemberTypeUpdate", dto);
	      return count;
	}
	
	//관리자 회원 주소 수정
	@Override
	public int adminMemberAddrUpdate(HashMap<String, Object> map) {
		int count = sqlMap.update("adminMemberAddrUpdate", map);
		return count;
	}
	
	//관리자 탈퇴회원 총 수
	@Override
	public int adminDelMemberTotalCnt(HashMap<String, Object> map) {
		int totalCnt = sqlMap.selectOne("adminDelMemberTotalCnt", map);
		return totalCnt;
	}
	//관리자 탈퇴회원 목록
	@Override
	public List<MemberDTO> adminDelMemberList(HashMap<String, Object> map) {
		List<MemberDTO> list = sqlMap.selectList("adminDelMemberList", map);
		return list;
	}
	
	//관리자 탈퇴회원 총 수
	@Override
	public int adminDelMemberDateTotalCnt(HashMap<String, Object> map) {
		int totalCnt = sqlMap.selectOne("adminDelMemberDateTotalCnt", map);
		return totalCnt;
	}
	//관리자 탈퇴회원 날짜 조건검색
	@Override
	public List<MemberDTO> adminDelMemberDate(HashMap<String, Object> map) {
		List<MemberDTO> list = sqlMap.selectList("adminDelMemberDate", map);
		return list;
	}
	
	
}
