package zipcok.mypage.model;

import java.util.*;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;

import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.ReviewDTO;
import zipcok.cs.model.CsDTO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymEquipmentDTO;
import zipcok.homegym.model.PaymentDTO;
import zipcok.homegym.model.Pd_AllDTO;
import zipcok.homegym.model.Pd_HgAllDTO;
import zipcok.member.model.MemberAllDTO;
import zipcok.member.model.MemberDTO;

public class MypageDAOImple implements MypageDAO {

   private SqlSessionTemplate sqlMap;
   
   public MypageDAOImple(SqlSessionTemplate sqlMap) {
      super();
      this.sqlMap = sqlMap;
   }
   
   
   @Override
   public MemberDTO memberProfile(String mem_id) {   //이거어차피한명인데 왜 리스트로 받아오는겨?-수연 / re: ㅈ밥들은 뭐가 효율적인지 잘 몰라... ㅠ
      
      MemberDTO dto= sqlMap.selectOne("memberProfile", mem_id);
      
      return dto;
   }
   
   /*프로필사진포함된 dto*/
   @Override
   public MemberAllDTO memberAllProfile(String mem_id) {
      MemberAllDTO dto= sqlMap.selectOne("memberAllProfile", mem_id);
      
      return dto;
   }

   
   
   
   @Override
   public CoachFileDTO memberProfilePhoto(String mem_id) {
      CoachFileDTO cdto = sqlMap.selectOne("memberProfilePhoto", mem_id);
      return cdto;
   }
   
   //프로필 사진 수정
   @Override
   public CoachFileDTO moFindProfileDTO(String id) {
      CoachFileDTO dto=sqlMap.selectOne("moFindFileDTO", id);
      return dto;
   }
   
   @Override
   public int moDeleteProfileImg(CoachFileDTO dto) {
      int count=sqlMap.delete("moDelCmpProfileImg",dto);
      return count;
   }
   
   @Override
   public int moInsertProfileImg(CoachFileDTO dto) {
      int count=sqlMap.insert("moInsertCmpProfileImg",dto);
      return count;
   }
   
   
   
   
   
   
   @Override
   public int mypagePwdUpdate(MemberDTO dto) {
      int count = sqlMap.update("mypagePwdUpdate", dto);
      return count;
   }
   
   @Override
   public int mypageAddrUpdate(MemberDTO dto) {
      int count = sqlMap.update("mypageAddrUpdate", dto);
      return count;
   }
   
   
   @Override
	public int mypageEmailConfirm(String mem_email) {
		String str = sqlMap.selectOne("mypageEmailConfirm", mem_email);
		return str==null?0:1;
	}
   @Override
   public int mypageEmailUpdate(MemberDTO dto) {
      int count = sqlMap.update("mypageEmailUpdate", dto);
      return count;
   }
   
   @Override
   public int mypagePhoneUpdate(MemberDTO dto) {
      int count = sqlMap.update("mypagePhoneUpdate", dto);
      return count;
   }
   
   //F&A 고객센터 작성글 총 수
   @Override
   public int mypageWriteListTotalCnt(String mem_id) {
      int count=sqlMap.selectOne("mypageWriteListTotalCnt", mem_id);
      return count==0?1:count;
   }
   
   //F&A 고객센터 작성글 목록
   @Override
   public List mypageWriteList(int cp, int ls, String mem_id) {
      int start=(cp-1)*ls+1;
      int end=cp*ls;
      Map map=new HashedMap();
      map.put("mem_id", mem_id);
      map.put("start", start);
      map.put("end", end);
      List list = sqlMap.selectList("mypageWriteList", map);
      
      return list;
   }
   
   //작성글 삭제
   @Override
	public int mypageWriteDelete(String checkArr) {
	   int count =sqlMap.delete("mypageWriteDelete", checkArr);
	   return count;
	}
   
   //커뮤니티 작성글 총 수
   @Override
	public int mypageCommWriteListTotalCnt(String ex_id) {
	   int count=sqlMap.selectOne("mypageCommWriteListTotalCnt", ex_id);
	   return count==0?1:count;
	}
   
   //커뮤니티 작성글 목록
   @Override
	public List mypageCommWriteList(int cp, int ls, String ex_id) {
	   int start=(cp-1)*ls+1;
	      int end=cp*ls;
	      Map map=new HashedMap();
	      map.put("ex_id", ex_id);
	      map.put("start", start);
	      map.put("end", end);
	      List list = sqlMap.selectList("mypageCommWriteList", map);
	      
	      return list;
	   }
   
   //커뮤니티 작성글 삭제
   @Override
	public int mypageCommWriteDelete(String checkArr) {
	   int count =sqlMap.delete("mypageCommWriteDelete", checkArr);
	   return count;
	}
   //커뮤니티 작성글 댓글 삭제
   @Override
	public int mypageCommWriteDeleteRebbs(String checkArr) {
	   int count =sqlMap.delete("mypageCommWriteDeleteRebbs", checkArr);
	   return count;
	}
   
   
   //홈짐 좋아요 총 수
   @Override
   public int mypageHomeGymLikeListTotalCnt(String mem_id) {
      int count=sqlMap.selectOne("mypageHomeGymLikeListTotalCnt", mem_id);
      return count==0?1:count;
   }
   
   //홈짐 좋아요 목록
   @Override
   public List<LikeDTO> mypageHomeGymLikeList(int cp, int ls, String mem_id) {
      int start=(cp-1)*ls+1;
      int end=cp*ls;
      Map map=new HashedMap();
      map.put("mem_id", mem_id);
      map.put("start", start);
      map.put("end", end);
      List<LikeDTO> list = sqlMap.selectList("mypageHomeGymLikeList", map);
      
      return list;
   }
   
   //홈짐 좋아요받은 사람 프로필
   @Override
	public List<CoachFileDTO> HomeGymLikeTargetProfile(HashMap<String, Object> map) {
	   List<CoachFileDTO> list = sqlMap.selectOne("HomeGymLikeTargetProfile", map);
		return list;
	}
   
      //코치매칭 좋아요 총 수
      @Override
      public int mypageCoachMatchLikeListTotalCnt(String mem_id) {
         int count=sqlMap.selectOne("mypageCoachMatchLikeListTotalCnt", mem_id);
         return count==0?1:count;
      }
      
      //코치매칭 좋아요 목록
      @Override
      public List mypageCoachMatchLikeList(int cp, int ls, String mem_id) {
         int start=(cp-1)*ls+1;
         int end=cp*ls;
         System.out.println(cp+"/"+ls+"/"+mem_id);
         Map map=new HashedMap();
         map.put("mem_id", mem_id);
         map.put("start", start);
         map.put("end", end);
         List list = sqlMap.selectList("mypageCoachMatchLikeList", map);
         
         return list;
      }
   
//      @Override
//      public int memberDelete(String mem_id) {
//         int count = sqlMap.delete("memberDelete", mem_id);
//         return count;
//      }
//
//      @Override
//      public int memberPhotoDelete(String mem_id) {
//         int count = sqlMap.delete("memberPhotoDelete", mem_id);
//         return count;
//      }
      /**홈짐 기구 목록 조회*/
  @Override
	public List<HomeGymEquipmentDTO> mypageHomeGymEqInfo(String user_id) {
		List<HomeGymEquipmentDTO> list = sqlMap.selectList("mypageHomeGymEqInfoSQL", user_id);
		return list;
	}
  /**홈짐 이미지 리스트 조회*/
   @Override
	public List<CoachFileDTO> mypageHomeGymImgInfo(String user_id) {
	   List<CoachFileDTO> list = sqlMap.selectList("mypageHomeGymImgInfoSQL", user_id);
	   return list;
	}
   /**홈짐 정보 조회*/
   @Override
	public HomeGymDTO mypageHomeGymInfo(String user_id) {
	   HomeGymDTO dto = sqlMap.selectOne("mypageHomeGymInfoSQL", user_id);
	   return dto;
	}
   /**ajax 홈짐 좋아요 수 조회*/
   @Override
	public int mypageHomeGymLikeCount(String user_id) {
	   int count = sqlMap.selectOne("mypageHomeGymLikeCount", user_id);
	   return count;
	}
   /**홈짐 후기 리스트 조회*/
	@Override
	public List<ReviewDTO> HomeGymReview(String homegymId) {
		List<ReviewDTO> list = sqlMap.selectList("mypageHomeGymReviewSelectSQL", homegymId);
		return list;
	}
	/**ajax 홈짐 활성화 상태 변경*/
	@Override
		public int mypageHomeGymStautsChange(Map<String, String> map) {
		int result = sqlMap.update("mypageHomeGymStatusChangeSQL", map);
		return result;
	}
	/**ajax 홈짐 주소 수정*/
	@Override
		public int mypageHomeGymAddrUpdate(Map<String, String> map) {
		int result = sqlMap.update("mypageHomeGymAddrUpdateSQL", map);
			return result;
		}
	/**ajax 홈짐 가까운 역 수정*/
	@Override
		public int mypageHomeGymStationUpdate(Map<String, String> map) {
		int result = sqlMap.update("mypageHomeGymStationUpdateSQL", map);
		return result;
		}
	/**ajax 홈짐 수용 인원 수정*/
	@Override
	public int mypageHomeGymPerson_countUpdate(Map<String, Object> map) {
		int result = sqlMap.update("mypageHomeGymPerson_countUpdateSQL", map);
		return result;
	}
	/**ajax 홈짐 비용 수정*/
	@Override
	public int mypageHomeGymPriceUpdate(Map<String, Object> map) {
		int result = sqlMap.update("mypageHomeGymPriceUpdateSQL", map);
		return result;
	}
	
	
	
	/*결제요청서내역리스트 출력*/
@Override
	public List<Pd_AllDTO> coachPaymentList(HashMap<String, Object> map) {
		int cp = (int)map.get("cp");
		int ls = (int)map.get("ls");
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		
		map.put("start",start);
		map.put("end",end);
		List<Pd_AllDTO> list= sqlMap.selectList("fromNormalPaymentList", map);
		return list;
	}
	
	//후기존재여부체크 결제요청서리스트랑연관됨
	@Override
		public List reviewExistCheck(HashMap<String,Object> map) {
			int cp = (int)map.get("cp");
			int ls = (int)map.get("ls");
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			
			map.put("start",start);
			map.put("end",end);
			List rev_idxList=sqlMap.selectList("reviewExistCheckCoach",map);
			return rev_idxList;
		}
	
	/*결제내역서 총 토탈카운트구하기*/
	@Override
		public int getTotalCntPaymentList(HashMap<String, Object> map) {


			int count = sqlMap.selectOne("getTotalCntPaymentList", map);
			return count==0?1:count;
		}
	/*코치후기작성*/
	@Override
		public int coachStarReviewAdd(ReviewDTO rdto) {
			int count= sqlMap.insert("coachStarReviewAdd",rdto);
			return count;
		}

	/*후기보여주기*/
		@Override
			public ReviewDTO showReview(int rev_idx) {
				ReviewDTO dto = sqlMap.selectOne("showReview", rev_idx);
				return dto;
			}
	/**마이페이지 내홈짐 보기 접근 시 홈짐 등록 유무 확인*/
	@Override
		public boolean mypageHomeGymCheck(String id) {
		int result = sqlMap.selectOne("mypageHomeGymCheckSQL", id);
		return result==0?false:true;
		}
	/**홈짐 기구 수정 시 기본 데이터 전부 삭제*/
	@Override
		public int mypageHomeGymEqAllDelete(String mem_id) {
		int result = sqlMap.delete("mypageHomeGymEqAllDeleteSQL", mem_id);
		return result;
		}
	/**홈짐 기구 수정 시 데이터 입력(수정x)*/
	@Override
		public int mypageHomeGymEqUpdate(Map<String, String> map) {
		int result = sqlMap.insert("mypageHomeGymEqUpdate", map);
		return result;
		}
	/**ajax 홈짐 시작,종료,불가능 날짜 수정*/
	@Override
		public int mypageHomeGymUseDateUpdate(Map<String, Object> map) {
		int result = sqlMap.update("mypageHomeGymUseDateUpdate", map);
		return result;
		}
	/**ajax 홈짐 시작, 종료 시간 수정*/
	@Override
		public int mypageHomeGymUseTimeUpdate(Map<String, Object> map) {
		int result = sqlMap.update("mypageHomeGymUseTimeUpdate", map);
		return result;
		}
	///////////////////////////////////////////////////////////////////////////
	@Override
	public int mypageHomeGymPayListTotalCnt(Map<String, Object> map) {
		int count = sqlMap.selectOne("mypageHomeGymPayListTotalCnt", map);
		return count==0?1:count;
	}
	@Override
	public List<Pd_HgAllDTO> mypageHomeGymPayList(Map<String, Object> map) {
		int cp = (Integer)map.get("cp1");
		int ls = (Integer)map.get("ls");
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<Pd_HgAllDTO> list = sqlMap.selectList("mypageHomeGymPayList", map);
		return list;
	}
	@Override
	public boolean mypageHomeGymReviewCheck(int pd_idx) {
		int ck = 0;
		ck = sqlMap.selectOne("mypageHomeGymReviewCheck", pd_idx);
		return ck==0?false:true;
	}
	@Override
	public String mypageHomeGymNickname(String pd_target_id) {
		String hg_nickname = sqlMap.selectOne("mypageHomeGymNickname", pd_target_id);
		return hg_nickname;
	}
	@Override
	public int mypageMyPayListTotalCnt(Map<String, Object> map) {
		int count = sqlMap.selectOne("mypageMyPayListTotalCnt", map);
		return count==0?1:count;
	}
	@Override
	public List<Pd_HgAllDTO> mypageMyPayList(Map<String, Object> map) {
		int cp = (Integer)map.get("cp2");
		int ls = (Integer)map.get("ls");
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<Pd_HgAllDTO> list = sqlMap.selectList("mypageMyPayList", map);
		return list;
	}
	@Override
	public boolean mypageMyReviewCheck(int pd_idx) {
		int ck = 0;
		ck = sqlMap.selectOne("mypageMyReviewCheck", pd_idx);
		return ck==0?false:true;
	}
	@Override
	public int mypageHomeGymReviewAdd(ReviewDTO dto) {
		int result = sqlMap.insert("mypagePayListReviewAdd", dto);
		return result;
	}
	@Override
	public ReviewDTO mypageHomeGymReviewView(int pd_idx) {
		ReviewDTO dto = sqlMap.selectOne("mypagePayListReviewView", pd_idx);
		return dto;
	}
	@Override
	public int mypagehomegympaymentCancel_payment(int pd_idx) {
		int result = sqlMap.update("mypagePaymentCancel_payment", pd_idx);
		return result;
	}
	@Override
	public int mypagehomegympaymentCancel_reservation(int reser_idx) {
		int result = sqlMap.update("mypagePaymentCancel_reservation", reser_idx);
		return result;
	}
	@Override
		public PaymentDTO mypageHomeGymPaymentFind(String mem_id) {
			PaymentDTO dto = sqlMap.selectOne("mypagePaymentFind", mem_id);
			return dto;
		}
	@Override
		public ReviewDTO homegymReview(int pd_idx) {
			ReviewDTO dto = sqlMap.selectOne("homegymReviewOne", pd_idx);
			return dto;
		}
}