package zipcok.coach.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.javafx.collections.MappingChange.Map;


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
		HashMap<String, List<MainCoachDTO>> map=new HashMap<String, List<MainCoachDTO>>();
		List<MainCoachDTO> ptList=sqlMap.selectList("findCategoryCoach",categoryMap.get("pt"));
		
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
		
		
		List<MainCoachDTO> yogaList=sqlMap.selectList("findCategoryCoach",categoryMap.get("yoga"));
		
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
		System.out.println("gender:"+keys.get("gender")+"/"+keys.get("start")+"/"+keys.get("end"));
		List<MainCoachDTO> searchList=sqlMap.selectList("ajaxSearchCoachByKey",keys);
		System.out.println("ajax검색된코치수"+searchList.size());
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
	
	
	/*검색된 코치 총 갯수 가져오기*/
	@Override
	public int getTotalCnt(HashMap map) {
		int count=sqlMap.selectOne("totalCnt",map);
		//총게시물수가 0이면오류나니까 
		System.out.println("일반검색 토탈카운트"+count);
		return count==0?1:count;
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
			 reviewmap.put("reviewKey","회원이코치");
		
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

}
