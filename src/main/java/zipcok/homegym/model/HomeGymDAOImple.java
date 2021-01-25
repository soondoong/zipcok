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
	public int HomeGymAdd(HomeGymDTO dto, HomeGymEquipmentDTO dto2) {
		System.out.println("test2");
		int hg_result = sqlMap.insert("hgAddSQL", dto);
		System.out.println("test3");
		int eq_result = sqlMap.insert("hgEqAddSQL", dto2);
		System.out.println("test4");
		return hg_result>0&&eq_result>0?1:0;
	}

	@Override
	public List<HomeGymDTO> HomeGymList() {
		List<HomeGymDTO> list = sqlMap.selectList("hgListSQL");
		return null;
	}

}
