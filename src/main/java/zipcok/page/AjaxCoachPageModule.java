package zipcok.page;

public class AjaxCoachPageModule {

	
	public static String makePage(int totalcount,int cp, int listSize,int pageSize) {
		 
		 StringBuffer sb=new StringBuffer(); //string조작많이하면 쓰레기데이터쌓여서 조작많이할꺼면이거써야됨
	/*제이슨 표기법 유의*/

		 int totalPage=totalcount/listSize+1;
		 if(totalcount%listSize==0)totalPage--;

		 int userGroup=cp/pageSize;   
		 if(cp%pageSize==0)userGroup--;   

		 /*  이 모듈은 ajax를 통한 검색기능을 수행햇을때 뜨는 page모듈로
		  *  a태그가 명령어로 파라미터를 보내는것이아니라 함수를 호출해 다시 비동기통신을 요청한다
		  *  이때 cp값을 보내줘야하므로 매개변수로 실어보낸다
		  * */
		 		if(userGroup!=0){          
		 			 int temp=(userGroup-1)*pageSize+pageSize;//<<를 누르면 보여줄페이지중 가장앞페이지로 가야함
		 			
		 			sb.append("<a  href='javascript:pageclick("+temp+")");		 				
		 			sb.append( "' ><span>&laquo;</span></a>");
		 		}
		


		 
		 			for(int i=(userGroup*pageSize)+1;i<=(userGroup*pageSize)+pageSize;i++){
		 				
		 				 
		 					sb.append("<a href='javascript:pageclick("+i+")");				 		
		 					sb.append("'>");
		 					sb.append(i);
		 					sb.append("</a>");
		
		 				if(i==totalPage){
		 						break;
		 					}

		 			}
		 	
	 			
		                                      //>>를 누르면 보여줄페이지중 가장뒷페이지로 가야함
		 		//유저그룹이랑 총페이지수에서 보여줄페이지를 나눈몫이 같지않을때
		 		if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
		 			int temp=(userGroup+1)*pageSize+1;
		 			  
		 			sb.append("<a  href='javascript:pageclick("+temp+")");
		 			sb.append("' ><span>&raquo;</span></a>");	 			
		 	
		 			}

		 		return sb.toString();  //string으로 값을 돌려줄수잇도록 구현
		 		
	 }
	
	
}
