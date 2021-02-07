package zipcok.comm.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.notice.model.ZipcokFileDTO;

@Service
public class BbsFileDAOImple implements BbsFileDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//파일 첨부하기
	@Override
	public int bbsFileUpload(ArrayList<BbsFileDTO> fileArr) {
		int count=0;
		for(int i=0; i<fileArr.size(); i++) {
		count+=sqlMap.insert("insertBbsFileSQL",fileArr.get(i));
		}
		return count;
	}
	
	//파일 리스트 가져오기
	@Override
	public List<BbsFileDTO> bbsFileList(String bfile_bbs,int bfile_bbs_idx) {
		Map map=new HashMap();
		map.put("bfile_bbs", bfile_bbs);
		map.put("bfile_bbs_idx", bfile_bbs_idx);
		List<BbsFileDTO> list=sqlMap.selectList("bbsFileListSQL", map);
		return list;
	}

}
