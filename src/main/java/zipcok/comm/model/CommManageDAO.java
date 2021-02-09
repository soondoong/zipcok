package zipcok.comm.model;

import java.util.List;

import zipcok.test.model.Payment_Request_TestDTO;
import zipcok.comm.model.CommunityDTO;

public interface CommManageDAO {
	
	public List<Payment_Request_TestDTO> paymentList(String pr_receiver_test);
	public List<CommunityDTO> manageCommList(String com_coach_id);
	public int manageCommPlus(String com_coach_id);

}
