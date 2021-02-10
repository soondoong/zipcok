package zipcok.comm.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int manageCommPlus(String com_coach_id) {
		int result=sqlMap.insert("manageCommPlusSQL",com_coach_id);
		return result;
	}
	
	//커뮤니티 소속 회원들 이름 리스트 만들기
	@Override
	public ArrayList<String> commUsersList(int uc_comm_idx) {
		List list=sqlMap.selectList("commUsersListSQL",uc_comm_idx);
		return null;
	}

}
