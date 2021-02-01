package zipcok.page;

public class MypagePageModule {

	public static String makePage(String pagename, int totalcount,int cp, int listSize,int pageSize) {
		 
		 StringBuffer sb=new StringBuffer(); //string조작많이하면 쓰레기데이터쌓여서 조작많이할꺼면이거써야됨
	

		 int totalPage=totalcount/listSize+1;
		 if(totalcount%listSize==0)totalPage--;

		 int userGroup=cp/pageSize;   
		 if(cp%pageSize==0)userGroup--;   


		 		if(userGroup!=0){                                          //<<를 누르면 보여줄페이지중 가장앞페이지로 가야함
		 			sb.append("<a href='");
		 			sb.append(pagename);
		 			sb.append("?cp=");
		 			int temp=(userGroup-1)*pageSize+pageSize;
		 			sb.append(temp);		 			
		 			sb.append("'>&lt;&lt;</a>");
		 		}
		


		 
		 			for(int i=(userGroup*pageSize)+1;i<=(userGroup*pageSize)+pageSize;i++){
		 			
		 					sb.append("<a href='");		
		 					sb.append(pagename);
		 					sb.append("?cp=");
		 					sb.append(i);
		 					sb.append("'>");
		 					sb.append(i);
		 					sb.append("</a>&nbsp;&nbsp;");
		
		 				if(i==totalPage){
		 						break;
		 					}

		 			}
		 	
	 			
		                                      //>>를 누르면 보여줄페이지중 가장뒷페이지로 가야함
		 		//유저그룹이랑 총페이지수에서 보여줄페이지를 나눈몫이 같지않을때
		 		if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
		 			sb.append("<a href='");
		 			sb.append(pagename);
		 			sb.append("?cp=");
		 			int temp=(userGroup+1)*pageSize+1;
		 			sb.append(temp);
		 			sb.append("'>&gt;&gt;</a>");	 			
		 	
		 			}

		 		return sb.toString();  //string으로 값을 돌려줄수잇도록 구현
		 		
	 }
	
	
}
