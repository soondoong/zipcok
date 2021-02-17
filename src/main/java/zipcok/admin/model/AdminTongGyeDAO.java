package zipcok.admin.model;

import java.util.HashMap;
import java.util.List;


public interface AdminTongGyeDAO {

	public AdminCoachTongGyeDTO searchCoachTongGye(HashMap<String,Object> map); //코치매출통계구하기
	public List<GraphDTO> graphMonthCoachSales(HashMap<String,Object> map);//코치매출 그래프통계구하기 월별
}
