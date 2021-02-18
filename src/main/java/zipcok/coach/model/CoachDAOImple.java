package zipcok.coach.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.javafx.collections.MappingChange.Map;

import zipcok.homegym.model.PaymentDTO;
import zipcok.mypage.model.LikeDTO;


@Service
public class CoachDAOImple implements CoachDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	/*코치카테고리정보 찾기*/
	@Override
	public ArrayList<CategoryDTO> findCategory(String id){
		
		ArrayList<CategoryDTO> arr=new ArrayList<CategoryDTO>();
		List list=sqlMap.selectList("findCategories", id);
		arr=(ArrayList<CategoryDTO>)list; //형변환
		return arr;
	}
	
	
	/*카테고리별 전체코치리스트 불러오기*/
	@Override
	public HashMap<String, List<MainCoachDTO>> mainCoachList(HashMap<String,String> categoryMap) {
		HashMap<String, List<MainCoachDTO>> map=new HashMap<String, List<MainCoachDTO>>();//return용
		
		HashMap<String, String> ptMap=new HashMap<String, String>();
		ptMap.put("sid", categoryMap.get("sid"));
		ptMap.put("category", categoryMap.get("pt"));
		
		List<MainCoachDTO> ptList=sqlMap.selectList("findCategoryCoach",ptMap);
		
		for(int i=0;i<ptList.size();i++) {
			String cateName="";
			/*코치카테고리정보 담기*/
		ArrayList<CategoryDTO> arr=findCategory(ptList.get(i).getCoach_mem_id());
		if(arr.size()==1) { //카테고리 1개일때
			cateName=arr.get(0).getCate_name();
		}else {
			cateName=arr.get(0).getCate_name()+"/"+arr.get(1).getCate_name();	
		}
		
		ptList.get(i).setCate_name(cateName); //ex)필라테스/다이어트 or 다이어트
		
	}
				
		map.put("pt", ptList); //새로 셋팅된 카테고리 네임을 넣어서 보내기
		
		ptMap.remove("category");
		ptMap.put("category", categoryMap.get("yoga"));
		List<MainCoachDTO> yogaList=sqlMap.selectList("findCategoryCoach",ptMap);
		
		for(int i=0;i<yogaList.size();i++) {
			String cateName="";
			/*코치카테고리정보 담기*/
			ArrayList<CategoryDTO> arr=findCategory(yogaList.get(i).getCoach_mem_id());
			if(arr.size()==1) { //카테고리 1개일때
				cateName=arr.get(0).getCate_name();
			}else {
				cateName=arr.get(0).getCate_name()+"/"+arr.get(1).getCate_name();	
			}
			
		yogaList.get(i).setCate_name(cateName); //ex)필라테스/다이어트 or 다이어트
		
		}	
		map.put("yoga", yogaList);
		
		return map ;
	}
	
	/*Ajax로 검색된 코치 가져오기 페이징까지*/
	@Override
	public List<MainCoachDTO> ajaxSearchCoachList(HashMap<String, Object> keys, int cp, int ls) {
		
		
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		
		keys.put("start",start);
		keys.put("end",end);
		System.out.println("지역:"+keys.get("location")+"/"+"수업유형:"+keys.get("extype")+"/"+"카테고리:"+keys.get("category"));
		System.out.println("성별:"+keys.get("gender")+"/"+"경력:"+keys.get("yearVal"));
		System.out.println("start:"+start+"/end:"+end);
		List<MainCoachDTO> searchList=sqlMap.selectList("ajaxSearchCoachByKey",keys);
		System.out.println("ajax검색된코치수"+searchList.size());
		System.out.println("------------------------------------------------------");
		for(int i=0;i<searchList.size();i++) {
			String cateName="";
			/*코치카테고리정보 담기*/
			ArrayList<CategoryDTO> arr=findCategory(searchList.get(i).getCoach_mem_id());
			if(arr.size()==1) { //카테고리 1개일때
				cateName=arr.get(0).getCate_name();
			}else {
				cateName=arr.get(0).getCate_name()+"/"+arr.get(1).getCate_name();	
			}
			
			searchList.get(i).setCate_name(cateName); //ex)필라테스/다이어트 or 다이어트
		
		}
		
		
		return searchList;
		
	}
	
	
	/* 검색된 코치 가져오기 페이징까지*/
	@Override
	public List<MainCoachDTO>  searchCoachList(HashMap<String, Object> keys,int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		
		keys.put("start",start);
		keys.put("end",end);
		
		List<MainCoachDTO> searchList=sqlMap.selectList("searchCoachByKey",keys);
		
		for(int i=0;i<searchList.size();i++) {
			String cateName="";
			/*코치카테고리정보 담기*/
			ArrayList<CategoryDTO> arr=findCategory(searchList.get(i).getCoach_mem_id());
			if(arr.size()==1) { //카테고리 1개일때
				cateName=arr.get(0).getCate_name();
			}else {
				cateName=arr.get(0).getCate_name()+"/"+arr.get(1).getCate_name();	
			}
			
			searchList.get(i).setCate_name(cateName); //ex)필라테스/다이어트 or 다이어트
		
		}
		
		
		return searchList;
	}
	
	
	
	@Override
	public int getTotalCnt(HashMap map) {
	
		String sqlKey=(String)(map.get("methodKey"));
		int count=0;
		 switch (sqlKey) {
         case "searchCoach": count=sqlMap.selectOne("searchCoachtotalCnt",map); 
                  break;
         case "receiveReqRequest":count=sqlMap.selectOne("receiveRequestListTotalCnt",map); 
                  break;
         case "sendReqRequest":count=sqlMap.selectOne("sendRequestListTotalCnt",map); 
         			break;
         case "mypageHomeGymPayListTotal":count=sqlMap.selectOne("mypageHomeGymPayListTotalCnt",map); 
			break;
         case "CmPaymentListTotal":count=sqlMap.selectOne("CmPaymentListTotalCnt",map); 
			break;
  
     }
		
	
		
		System.out.println("일반검색 토탈카운트:"+count);
		return count==0?1:count; //총게시물수가 0이면오류나니까 
	}
	
	
	
	
	/*Ajax 검색된 코치 총 갯수 가져오기*/
	@Override
	public int getAjaxTotalCnt(HashMap<String,Object> map) {
		
		int count=sqlMap.selectOne("ajaxTotalCnt",map);
		//총게시물수가 0이면오류나니까 
		
		System.out.println("ajax 토탈카운트"+count);
		return count==0?1:count;
	}
	
	/*코치등록하기*/
	@Override
	public int coachJoin(HashMap<String, Object> map) {
	    int count=sqlMap.insert("coachRegist",map.get("dto")); //코치테이블등록
	    count+=sqlMap.update("memberTypeUpdate",map.get("dto")); //코치회원으로 전환
	    
	  ArrayList<CategoryDTO> cateArr=( ArrayList<CategoryDTO>) map.get("cateArr");
	    for(int i=0; i<cateArr.size(); i++) {
	    	 count+=sqlMap.insert("insertCategory",cateArr.get(i));
	    	 System.out.println("카테고리갯수:"+cateArr.size()+"카테고리명:"+cateArr.get(i).getCate_name());
	    }
	   
		return count;
	}
	
	/*코치 소개사진등록하기*/
	@Override
	public int coachInfoFileUpload(ArrayList<CoachFileDTO> fileArr) {
		int count=0;
		
		for(int i=0; i<fileArr.size(); i++) {
		count+=sqlMap.insert("insertCoachInfoFile",fileArr.get(i));
		}
		return count;
	}
	
	
	/*코치 프로필정보 갖고오기*/
	@Override
	public HashMap<String, Object> coachProfile(String id) {
		
		
		//1단계. 기본 코치정보가져오기 
		MainCoachDTO dto= sqlMap.selectOne("findCoachInfo", id );
		
		//2단계. 카테고리이름 합친거넣어주기
			String cateName="";
			/*코치카테고리정보 담기*/
			ArrayList<CategoryDTO> arr=findCategory(dto.getCoach_mem_id());
			if(arr.size()==1) { //카테고리 1개일때
				cateName=arr.get(0).getCate_name();
			}else {
				cateName=arr.get(0).getCate_name()+"/"+arr.get(1).getCate_name();	
			}
			dto.setCate_name(cateName); //ex)필라테스/다이어트 or 다이어트
		
		
		//3단계 등록한소개사진 가져오기
			HashMap<String, Object> filemap = new HashMap<String, Object>();
			filemap.put("id", id);
			filemap.put("fileKey","코치");
		
			List<CoachFileDTO> coachFileList=sqlMap.selectList("selectCoachFiles", filemap);
			
		//4단계.커리큘럼가져오기
			List<CurriDTO> curriList = sqlMap.selectList("selectCurri", id);
		
		//5단계.후기가져오기
			HashMap<String, Object> reviewmap = new HashMap<String, Object>();
			 reviewmap.put("id", id);
			 reviewmap.put("reviewKey","코치");
		
			 List<ReviewDTO> reviewList= sqlMap.selectList("selectStarReview", reviewmap);
			 System.out.println("후기몇개?"+reviewList.size());
		//6단계. 전체정보 맵에 담아 보내기
			 HashMap<String, Object> resultMap = new HashMap<String, Object>();
			 
			 resultMap.put("coachDTO",dto);
			 resultMap.put("coachFileList", coachFileList);
			 resultMap.put("curriList",curriList);
			 resultMap.put("reviewList", reviewList);
			 
			 
		return resultMap;
	}

	
	/*상담요청서 보내기*/
	@Override
	public int sendRequestForm(RequestFormDTO dto) {
		//1단계. 요청서테이블에 데이터넣기
		int count=sqlMap.insert("addRequestTable",dto);
		
		return count;
	}
	
	
	
	/*상담요청서 목록가져오기*/
	@Override
	public List<RequestFormDTO> searchRequestList(HashMap<String, Object> keys, int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		
		keys.put("start",start);
		keys.put("end",end);	
		//코치일땐 받은요청서 목록 , 일반일땐 보낸요청서목록 나옴
		List<RequestFormDTO> list=sqlMap.selectList((String)keys.get("sqlKey"), keys);		
		
		return list;
	}

	
	/*요청서정보한개가져오기*/
@Override
public RequestFormDTO findOneRequest(int req_idx) {
	RequestFormDTO dto= sqlMap.selectOne("findOneRequest", req_idx);
	return dto;
}
	

 /*좋아요 추가*/
 @Override
public int insertLike(LikeDTO dto) {
	int count=sqlMap.insert("likeplus",dto);
	
	return count;
}
 
 /*좋아요삭제*/
 @Override
public int deleteLike(LikeDTO dto) {
	 int count=sqlMap.delete("deletelike",dto);		
		return count;
}
 	/*결제계좌등록*/
	@Override
	public int coachAccountAdd(PaymentDTO dto) {
		int count =sqlMap.insert("coachAccountAdd",dto);
		return count;
	}
}
