package zipcok.comm.model;

import java.util.List;

import zipcok.test.model.Payment_Request_TestDTO;
import zipcok.comm.model.CommunityDTO;
import zipcok.comm.model.Users_communityDTO;
import zipcok.member.model.MemberDTO;

public interface CommManageDAO {
	
	public List<Payment_Request_TestDTO> paymentList(String pr_receiver_test);
	public List<Payment_Request_TestDTO> paymentList_finish(String pr_receiver_test);
	public List<CommunityDTO> manageCommList(String com_coach_id);
	public int manageCommPlus(String com_coach_id,String com_name);
	public List<Users_communityDTO> commUsersList(int uc_comm_idx);
	public String commUserGetName(String mem_id);
	public List<MemberDTO> commUserIdSearch(String mem_id);
	public String getCommName(int uc_comm_idx);
	public int commMemPlus(String uc_mem_id, int uc_comm_idx, String com_name);

}
