package zipcok.member.model;

import java.util.*;

public interface MemberDAO {

   public int memberJoinSubmit(HashMap<String,Object> map);
   public String idCheck(String mem_id);
   public String pwdCheck(String mem_id);
   public String getMemberName(String mem_id);
   public String idFind(String mem_email);
   public int pwdUpdate(MemberDTO dto);
   public String typeCheck(String mem_id);
   public int idConfirm(String mem_id);
   public int emailConfirm(String mem_email);
   
}