package zipcok.comm.model;

import java.util.*;

import zipcok.comm.model.BbsFileDTO;

public interface BbsFileDAO {
	
	public int bbsFileUpload(ArrayList<BbsFileDTO> fileArr);
	public List<BbsFileDTO> bbsFileList(int bfile_bbs,int bfile_bbs_idx);
	public int bbsFileDel(int bfile_idx);

}
