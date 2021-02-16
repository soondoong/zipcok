package zipcok.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.comm.model.CommunityDTO;
import zipcok.member.model.MemberDTO;

@Service
public class AdminCommDAOImple implements AdminCommDAO {
	
	@Autowired	
	private SqlSessionTemplate sqlMap;
	
	//커뮤니티 정보 가져오기
	@Override
	public List<CommunityDTO> searchComm(String com_name) {
		Map map=new HashMap();
		map.put("com_name", com_name);
		List<CommunityDTO> dto=sqlMap.selectList("searchCommSQL",map);
		return dto;
	}
	
	//커뮤니티 번호로 코치 아이디 가져오기
	@Override
	public String adminGetCoachId(int com_idx) {
		String coach_id=sqlMap.selectOne("adminGetCoachIdSQL",com_idx);
		return coach_id;
	}
	
	//아이디로 회원정보 가져오기
	@Override
	public MemberDTO searchMember(String mem_id) {
		MemberDTO dto=sqlMap.selectOne("searchMemberSQL",mem_id);
		return dto;
	}
	
	//커뮤니티 소속 회원 불러오기
	@Override
	public List<String> getCommMember(int uc_comm_idx) {
		List<String> list=sqlMap.selectList("getCommMemberSQL",uc_comm_idx);
		return list;
	}
	
	//커뮤니티 번호로 총 게시물 수 구하기
	@Override
	public int getAllBbsCount(int ex_comm_idx) {
		int allBbsCount=sqlMap.selectOne("getAllBbsCountSQL",ex_comm_idx);
		return allBbsCount;
	}
	
	//커뮤니티 번호로 댓글 수 구하기
	@Override
	public int getAllRepleCount(int re_comm_idx) {
		int allRepleCount=sqlMap.selectOne("getAllRepleCountSQL",re_comm_idx);
		return allRepleCount;
	}
	
	//최근 게시물 올린 날짜 구하기
	@Override
	public String getActDate(int ex_comm_idx) {
		String ActDate=sqlMap.selectOne("getActDateSQL",ex_comm_idx);
		return ActDate;
	}
	
	//관리 회원 수 구하기
	@Override
	public int getComMemSum(String com_coach_id) {
		int mem_sum=sqlMap.selectOne("getComMemSumSQL",com_coach_id);
		return mem_sum;
	}
	
	//활동 회원 수 구하기
	@Override
	public int getActMemSum(int ex_comm_idx) {
		int act_mem_count=sqlMap.selectOne("getActMemSumSQL",ex_comm_idx);
		return act_mem_count;
	}
	
	//최근 활동 날짜 구하기
	@Override
	public List<String> getStartDate(int ex_comm_idx, String ex_id) {
		Map map=new HashMap();
		map.put("ex_comm_idx", ex_comm_idx);
		map.put("ex_id", ex_id);
		List<String> startDate=sqlMap.selectList("getStartDateSQL",map);
		return startDate;
	}

}
