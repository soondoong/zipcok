package zipcok.comm.model;

import java.util.ArrayList;

import zipcok.coach.model.CoachFileDTO;

public interface BbsFileDAO {
	
	public int bbsFileUpload(ArrayList<BbsFileDTO> fileArr);

}
