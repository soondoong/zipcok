package zipcok.admin.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminTongGyeDAOImple implements AdminTongGyeDAO {

	@Autowired	
	private SqlSessionTemplate sqlMap;
	
	@Override
	public AdminCoachTongGyeDTO searchCoachTongGye(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
