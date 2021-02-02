package zipcok.comm.model;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BbsFileDAOImple implements BbsFileDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public int bbsFileUpload(ArrayList<BbsFileDTO> fileArr) {
		int count=0;
		
		for(int i=0; i<fileArr.size(); i++) {
		count+=sqlMap.insert("insertBbsFile",fileArr.get(i));
		}
		return count;
	}

}