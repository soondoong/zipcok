package zipcok.comm.model;

import java.util.*;

import zipcok.comm.model.BbsFileDTO;

public interface BbsFileDAO {
	
	public int bbsFileUpload(ArrayList<BbsFileDTO> fileArr);
	public List<BbsFileDTO> bbsFileList(String bfile_bbs,int bfile_bbs_idx);

}
