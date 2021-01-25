package zipcok.homegym.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class HomeGymEquipmentDAOImple implements HomeGymEquipmentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public HomeGymEquipmentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int HomeGymEquipmentAdd(HomeGymEquipmentDTO dto) {
		int eq_result = sqlMap.insert("hgEqAddSQL", dto);
		return eq_result;
	}

	@Override
	public List<HomeGymEquipmentDTO> HomeGymEquipmentSelect(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
