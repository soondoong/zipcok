package zipcok.homegym.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class HomeGymDAOImple implements HomeGymDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public HomeGymDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public boolean HomeGymCheck(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int HomeGymAdd(HomeGymDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HomeGymDTO> HomeGymList() {
		// TODO Auto-generated method stub
		return null;
	}

}
