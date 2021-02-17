package zipcok.admin.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminTongGyeDAOImple implements AdminTongGyeDAO {

	@Autowired	
	private SqlSessionTemplate sqlMap;
	
	@Override
	public AdminCoachTongGyeDTO searchCoachTongGye(HashMap<String, Object> map) {
		AdminCoachTongGyeDTO dto = sqlMap.selectOne("searchCoachTongGye", map);
		return dto;
	}
	
	/*코치매출통계 그래프정보가져오기*/
	@Override
	public List<GraphDTO> graphMonthCoachSales(HashMap<String, Object> map) {
	
		String key=(String)map.get("graphKey");
		List<GraphDTO> list = new ArrayList<GraphDTO>();
		 switch (key) {
        case "month":     	for(int i=3; i<=14 ; i++) { //31까지해도 상관없음 ㅋ
			        					if(i<10) {
			        						HashMap<String, Object> newmap =new HashMap<String, Object>();
			        						newmap.put("pd_key", (String)map.get("pd_key"));
			        						String m=Integer.toString(i);
			        						newmap.put("startDate", "2020-0"+m+"-01");			
			        						newmap.put("endDate", "2020-0"+m+"-31");	
			    							System.out.println("==1~9월=="+newmap.get("startDate")+"-"+newmap.get("endDate"));
			    							GraphDTO dto=sqlMap.selectOne("graphMonthCoachSales", newmap);
			    							dto.sety(m);
			    							list.add(dto);
			        					}else if(i>=10 && i<13){  //두자리수부터
			        						HashMap<String, Object> newmap =new HashMap<String, Object>();
			        						newmap.put("pd_key", (String)map.get("pd_key"));
			        						String m=Integer.toString(i);
			        						newmap.put("startDate", "2020-"+m+"-01");			
			        						newmap.put("endDate", "2020-"+m+"-31");	
			    							System.out.println("==10~12월=="+"2020-"+m+"-01");
			    							GraphDTO dto=sqlMap.selectOne("graphMonthCoachSales", newmap);
			    							dto.sety(m);
			    							list.add(dto);
			        					}else if(i>=13){ //다시 1월부터
			        						HashMap<String, Object> newmap =new HashMap<String, Object>();
			        						newmap.put("pd_key", (String)map.get("pd_key"));
			        						String m=Integer.toString(i-12);
			        						newmap.put("startDate", "2021-0"+m+"-01");			
			        						newmap.put("endDate", "2021-0"+m+"-31");
			    							System.out.println("==21년1~2월=="+"2021-0"+m+"-01");
			    							GraphDTO dto=sqlMap.selectOne("graphMonthCoachSales", newmap);
			    							dto.sety(m);
			    							list.add(dto);
			        					}
        					
        					}
        	
                 break;
             	
		 }
			return list;
	}
	
}
