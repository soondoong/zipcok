package zipcok.admin.model;
import java.sql.*;
import java.util.HashMap;
import java.util.List;

import zipcok.member.model.MemberAllDTO;

public interface AdminCoachMatchDAO {
	
	public List<MemberAllDTO> coachMatchSearch(HashMap<String, Object>map);
}
