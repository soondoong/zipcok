package zipcok.comm.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.member.model.MemberDTO;
import zipcok.test.model.Payment_Request_TestDTO;

@Service
public class CommManageDAOImple implements CommManageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//결제한 수강생 내역 가져오기
	@Override
	public List<Payment_Request_TestDTO> paymentList(String pr_receiver_test) {
		List<Payment_Request_TestDTO> list=sqlMap.selectList("paymentListSQL",pr_receiver_test);
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
	
	@Override
	public List<MemberDTO> commUserIdSearch(String mem_id) {
		List<MemberDTO> list=sqlMap.selectList("commUserIdSearchSQL",mem_id);
		return list;
	}
	
	@Override
	public int commMemPlus(String uc_mem_id) {
		int result=sqlMap.insert("commMemPlusSQL",uc_mem_id);
		return result;
	}

}
