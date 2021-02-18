package zipcok.comm.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.member.model.MemberDTO;
import zipcok.cpayment.model.Payment_RequestDTO;
import zipcok.homegym.model.Payment_detailsDTO;

@Service
public class CommManageDAOImple implements CommManageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//결제한 수강생 내역 가져오기
	@Override
	public List<Payment_detailsDTO> paymentList(String pd_target_id) {
		List<Payment_detailsDTO> list=sqlMap.selectList("paymentListSQL",pd_target_id);
		return list;
	}
	
	//결제 완료한 수강생 내역 가져오기
	@Override
	public List<Payment_detailsDTO> paymentList_finish(String pd_target_id) {
		List<Payment_detailsDTO> list=sqlMap.selectList("paymentList_finishSQL",pd_target_id);
		return list;
	}
	
	//개설 커뮤니티 정보 가져오기
	@Override
	public List<CommunityDTO> manageCommList(String com_coach_id) {
		List<CommunityDTO> list=sqlMap.selectList("manageCommListSQL",com_coach_id);
		return list;
	}
	
	//커뮤니티 개설하기
	@Override
	public int manageCommPlus(String com_coach_id,String com_name) {
		Map map=new HashMap();
		map.put("com_coach_id", com_coach_id);
		map.put("com_name", com_name);
		int result=sqlMap.insert("manageCommPlusSQL",map);
		return result;
	}
	
	//커뮤니티 소속 회원들 이름 리스트 만들기
	@Override
	public List<Users_communityDTO> commUsersList(int uc_comm_idx) {
		List<Users_communityDTO> list=sqlMap.selectList("commUsersListSQL",uc_comm_idx);
		return list;
	}
	
	//아이디로 회원 이름 가져오는 메소드
	@Override
	public String commUserGetName(String mem_id) {
		String result=sqlMap.selectOne("commUserGetNameSQL",mem_id);
		return result;
	}
	
	//커뮤니티 유저 찾기
	@Override
	public List<MemberDTO> commUserIdSearch(String mem_id) {
		List<MemberDTO> list=sqlMap.selectList("commUserIdSearchSQL",mem_id);
		return list;
	}
	
	//커뮤니티 이름 찾기
	@Override
	public String getCommName(int uc_comm_idx) {
		String uc_name=sqlMap.selectOne("getCommNameSQL",uc_comm_idx);
		return uc_name;
	}
	
	//수강생 추가
	@Override
	public int commMemPlus(String uc_mem_id, int uc_comm_idx, String com_name) {
		Map map=new HashMap();
		map.put("uc_mem_id", uc_mem_id);
		map.put("uc_comm_idx", uc_comm_idx);
		map.put("uc_name", com_name);
		int result=sqlMap.insert("commMemPlusSQL",map);
		return result;
	}
	
	//총 수강생 수 더하기
	@Override
	public int commMemSumPlus(int com_idx) {
		int result=sqlMap.update("commMemSumPlusSQL",com_idx);
		return result;
	}
	
	//커뮤니티 삭제
	@Override
	public int commDel(int com_idx) {
		int result=sqlMap.delete("commDelSQL",com_idx);
		return result;
	}
	
	//커뮤니티 삭제2
	@Override
	public int commDel2(int uc_comm_idx) {
		int result=sqlMap.delete("commDel2SQL",uc_comm_idx);
		return result;
	}
	
	////idx로 커뮤니티 소속 회원들 아이디 뽑아오기
	@Override
	public List<String> getCommMem(int uc_comm_idx) {
		List<String> CommMem=sqlMap.selectList("getCommMemSQL",uc_comm_idx);
		return CommMem;
	}

}
