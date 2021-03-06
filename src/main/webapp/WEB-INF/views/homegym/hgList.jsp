<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@include file="../_include/head.jsp" %>
<%@include file="../header2.jsp" %>

<script>
window.addEventListener('load', function() {
   var today = getTimeStamp();
   $('#choice_date').attr('min', today);
   var eq_options = '${keywordMap.eq_options}';
   if(eq_options != ''){
      var eq_options_split = eq_options.split(',');
      for(var i in eq_options_split){
         document.getElementById(eq_options_split[i]).checked = true;
         var option_list = document.getElementsByClassName('homegym_search_result_list_item_option_'+eq_options_split[i]);
         for(var j = 0 ; j < option_list.length ; j ++ ){
            var option_class = option_list.item(j);
            option_class.style.color = 'write';
            option_class.style.backgroundColor = '#0099ff';
         }
      }
   }
});

$(function(){
   $('.ia').on('click', function() {
      var userid='${login.mem_id}';
         if(userid ==null || userid == ''){ //비로그인시
            alert('회원만 가능한 서비스입니다');
         }else{ //로그인시            
            var targetid= $(this).attr('id');   
            if(userid==targetid){
               window.alert('자기 자신은 좋아요를 클릭하실 수 없습니다.');
               return;
            }
            //alert(targetid);   
           if($(this).hasClass("toggleStyle")){ //좋아요취소시
                   $(this).removeClass("toggleStyle");
                   $(this).html('<i class="far fa-heart likeicon"></i>');
                   ajaxUnLike(userid,targetid);        
               }else{ //좋아요햇을시
                  
                   $(this).addClass("toggleStyle");
                   $(this).html('<i class="fas fa-heart likeicon likeafter"></i>');
                  
                 ajaxLike(userid,targetid);              
                   //좋아요하면 insert 취소하면 delete            
                   
               }             
         }   
   }); 
});
 
function getTimeStamp() {

    var d = new Date();
    var s =
        leadingZeros(d.getFullYear(), 4) + '-' +
        leadingZeros(d.getMonth() + 1, 2) + '-' +
        leadingZeros(d.getDate(), 2);

    return s;
}

function leadingZeros(n, digits) {

    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
}

function priceOption(){   
   var left_price_span = document.getElementById('price').value;
   document.getElementById('price_value').innerText = left_price_span;
   document.getElementById('option_fm').submit();
}

function sendOption(){
   document.getElementById('option_fm').submit();
}
function ContentEnter(id){
   location.href = 'HomeGymContent.do?hg_mem_id='+id;
}
function ajaxLike(userid, targetid){
   var params = 'user_id='+userid+'&target_id='+targetid;
   sendRequest('HomegymLikeOn.do', params, ajaxLike_rq, 'GET');
}
function ajaxUnLike(userid, targetid){
   var params = 'user_id='+userid+'&target_id='+targetid;
   sendRequest('HomegymLikeOff.do', params, ajaxUnLike_rq, 'GET');
}
function ajaxLike_rq(){
     if(XHR.readyState==4){
           if(XHR.status==200){
              var data=XHR.responseText;
              data=eval('('+data+')');
               alert("좋아요 목록에 추가되었습니다");   
           }
     }
}
function ajaxUnLike_rq(){
     if(XHR.readyState==4){
           if(XHR.status==200){
              var data=XHR.responseText;
              data=eval('('+data+')');
               alert("좋아요 목록에서 삭제되었습니다");   
           }
     }
}
</script>

<style>
.eq_options {border:1px solid black;font-size: 20px;border-radius: 8px;width:200px;height:30px;}
.ListItem{border:1px solid black;}
.top_search_wrap {background-image: linear-gradient(to top, #006be0, #0070e1, #0074e1, #0579e1, #0f7de1);   
      text-align: center; padding: 70px 0;border-radius: 0 0 30px 30px;}
.top_search_wrap .top_search_inner {display: inline-block;}
.top_search_wrap select {width: 200px; height:50px; margin-right: 10px; box-shadow: 3px 3px 5px #1f47a2;}
.top_search_wrap input[type=date] {width: 200px; height:50px; margin-right: 10px; box-shadow: 3px 3px 5px #1f47a2;}
.top_search_wrap input[type=submit] {width: 150px; height: 40px;}
.homegym_wrap {display: flex;}
.homegym_wrap .homegym_search_wrap {flex: 0 0 300px; }
.homegym_wrap .homegym_search_wrap .left_option {padding: 30px;}
.homegym_wrap .homegym_search_wrap .left_option select {width:80%;}
.homegym_wrap .homegym_search_wrap .left_option .left_option_person_count_label {height:40px; line-height:40px; vertical-align: middle;}
.homegym_wrap .homegym_search_wrap .eq_list {}
.homegym_wrap .homegym_search_wrap .eq_list label {display: inline-block; cursor: pointer; position: relative; padding: 0 0 0 24px;}
.homegym_wrap .homegym_search_wrap .eq_list label input[type=checkbox] {position: absolute; top: 0; left: 0; width: 1px; height: 1px; opacity: 0;}
.homegym_wrap .homegym_search_wrap .eq_list label span:before {display: block; content: ''; position: absolute; top: 4px; left: 0; width: 16px; height: 16px; background: #ffffff; border: 1px solid #333333;}
.homegym_wrap .homegym_search_wrap .eq_list label input[type=checkbox]:checked + span:before {background: #333333;}
.sbtn { box-shadow: 3px 3px 5px #1f47a2; }

.homegym_wrap .homegym_search_result {flex: 1 1 auto; padding: 30px;}
.homegym_search_result h2:before{ content:""; display:inline-block; background-color:#257cda; width:11px; height: 41px; }   
.homegym_search_result h2{ color:#12151d; margin-top:20px;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_paging {margin: 40px 0 0; text-align: center;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_paging a {display: inline-block; background: #f7f7f7; text-align: center; width: 30px; height: 30px; font-size: 14px; line-height: 30px;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_paging a:not(:first-child) {margin-left: 5px;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item {display:flex; padding: 20px; width:800px;}

.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_like {position: relative; left:30px; top: 15px; z-index: 0;}

.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_img {padding:10px; margin-right:20px; width : 300x; height: 200px;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_img img { width:280px; height: 180px;}

.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_content {padding: 10px; width:610px; height: 150px; z-index: 2;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_content .homegym_search_result_list_item_content_eqlist {display:flex; height:100px; vertical-align: middle;}

.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_content .homegym_search_result_list_item_content_eqlist .eqdiv { margin-right: 10px; background-color: #cccccc; margin-top:10px; padding:5px; height: 30px; border-radius: 8px;}
.homegym_wrap .homegym_search_result_list .homegym_search_result_list_item .homegym_search_result_list_item_content .homegym_search_result_list_item_content_price {font-size:25px; font-weight:600; position: relative; left:600px; top: -95px; height:35px; width:180px; text-align:right; }
.likeicon{ font-size:27px;font-weight:100;position: absolute;color:white;}
.likeafter{color : #FF6682; }

      .topHgTitle{ display:flex; justify-content:center; height: 70px;color:white; text-align: left; margin-bottom:15px;}
      .topHgTitle .zipcok{font-size: 40px;width:200px; font-weight:500;  font-family: 'Spoqa Han Sans Neo', 'sans-serif';}
      .topHgTitle .zipcok:after{content:'|' ; font-size: 35px;width:182px;font-family: 'Spoqa Han Sans Neo', 'sans-serif'; margin:0 20px;}
      .zipcok_sub{font-size: 20px; width:250px;}   
</style>
<script src="https://kit.fontawesome.com/802041d611.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>

   <!-- 상단 조건바 -->
   <form id = "option_fm" action = "HomeGymList.do" method = "post">
   <div class="top_search_wrap">
      <div class="topHgTitle">
         <p class="zipcok">집콕헬스</p>
         <p class="zipcok_sub">이제는 홈짐도 공유하는 시대!<br>국내최초 홈짐 매칭 플랫폼</p>
      </div>
      <div class="top_search_inner">
         <select name="top_option_location" onchange="javascript:sendOption();">
            <option value="전체" <c:if test="${keywordMap.location=='전체'}">selected</c:if>>전체</option>
            <option value="강남구" <c:if test="${keywordMap.location=='강남구'}">selected</c:if>>강남구</option>
            <option value="강동구" <c:if test="${keywordMap.location=='강동구'}">selected</c:if>>강동구</option>
            <option value="강북구" <c:if test="${keywordMap.location=='강북구'}">selected</c:if>>강북구</option>
            <option value="강서구" <c:if test="${keywordMap.location=='강서구'}">selected</c:if>>강서구</option>
            <option value="관악구" <c:if test="${keywordMap.location=='관악구'}">selected</c:if>>관악구</option>
            <option value="광진구" <c:if test="${keywordMap.location=='광진구'}">selected</c:if>>광진구</option>
            <option value="구로구" <c:if test="${keywordMap.location=='구로구'}">selected</c:if>>구로구</option>
            <option value="금천구" <c:if test="${keywordMap.location=='금천구'}">selected</c:if>>금천구</option>
            <option value="노원구" <c:if test="${keywordMap.location=='노원구'}">selected</c:if>>노원구</option>
            <option value="도봉구" <c:if test="${keywordMap.location=='도봉구'}">selected</c:if>>도봉구</option>
            <option value="동대문구" <c:if test="${keywordMap.location=='동대문구'}">selected</c:if>>동대문구</option>
            <option value="동작구" <c:if test="${keywordMap.location=='동작구'}">selected</c:if>>동작구</option>
            <option value="마포구" <c:if test="${keywordMap.location=='마포구'}">selected</c:if>>마포구</option>
            <option value="서대문구" <c:if test="${keywordMap.location=='서대문구'}">selected</c:if>>서대문구</option>
            <option value="서초구" <c:if test="${keywordMap.location=='서초구'}">selected</c:if>>서초구</option>
            <option value="성동구" <c:if test="${keywordMap.location=='성동구'}">selected</c:if>>성동구</option>
            <option value="성북구" <c:if test="${keywordMap.location=='성북구'}">selected</c:if>>성북구</option>
            <option value="송파구" <c:if test="${keywordMap.location=='송파구'}">selected</c:if>>송파구</option>
            <option value="양천구" <c:if test="${keywordMap.location=='양천구'}">selected</c:if>>양천구</option>
            <option value="영등포구" <c:if test="${keywordMap.location=='영등포구'}">selected</c:if>>영등포구</option>
            <option value="용산구" <c:if test="${keywordMap.location=='용산구'}">selected</c:if>>용산구</option>
            <option value="은평구" <c:if test="${keywordMap.location=='은평구'}">selected</c:if>>은평구</option>
            <option value="종로구" <c:if test="${keywordMap.location=='종로구'}">selected</c:if>>종로구</option>
            <option value="중구" <c:if test="${keywordMap.location=='중구'}">selected</c:if>>중구</option>
            <option value="중랑구" <c:if test="${keywordMap.location=='중랑구'}">selected</c:if>>중랑구</option>
         </select>
         <input type="date" name="top_option_date" id = "choice_date" value="${keywordMap.date }" onchange="javascript:sendOption();">
         <input type="submit" value = "검색하기" class="btn btn-primary sbtn" style="width:140px; height: 46px;">
      </div>
   </div>
   <div class="homegym_wrap">
      <div class="homegym_search_wrap">
         
         <!-- 좌측 조건바 -->
         <div id = "left_option" class="left_option">
            <h4>검색 조건</h4>
            <hr>
            <div id = "eq_list" class="eq_list">
               <h6>기구</h6>
               <label><input type = "checkbox" name = "left_option_eq" value = "암 컬" id = "암 컬" onclick = "javascript:sendOption();"><span>암 컬</span></label>
               <label><input type = "checkbox" name = "left_option_eq" value = "체스트 프레스" id = "체스트 프레스" onclick = "javascript:sendOption();"><span>체스트 프레스</span></label>
               <label><input type = "checkbox" name = "left_option_eq" value = "덤벨 1kg" id = "덤벨 1kg" onclick = "javascript:sendOption();"><span>덤벨 1kg</span></label>
               <label><input type = "checkbox" name = "left_option_eq" value = "덤벨 3kg" id = "덤벨 3kg" onclick = "javascript:sendOption();"><span>덤벨 3kg</span></label>
               <label><input type = "checkbox" name = "left_option_eq" value = "덤벨 5kg" id = "덤벨 5kg" onclick = "javascript:sendOption();"><span>덤벨 5kg</span></label>
               <label><input type = "checkbox" name = "left_option_eq" value = "덤벨 10kg" id = "덤벨 10kg" onclick = "javascript:sendOption();"><span>덤벨 10kg</span></label>
               <label><input type = "checkbox" name = "left_option_eq" value = "하프 렉" id = "하프 렉" onclick = "javascript:sendOption();"><span>하프 렉</span></label>
               <label><input type = "checkbox" name = "left_option_eq" value = "렛 풀 다운" id = "렛 풀 다운" onclick = "javascript:sendOption();"><span>렛 풀 다운</span></label>
               <label><input type = "checkbox" name = "left_option_eq" value = "레그 컬" id = "레그 컬" onclick = "javascript:sendOption();"><span>레그 컬</span></label>
               <label><input type = "checkbox" name = "left_option_eq" value = "스미스 머신" id = "스미스 머신" onclick = "javascript:sendOption();"><span>스미스 머신</span></label>
               <label><input type = "checkbox" name = "left_option_eq" value = "풀 업" id = "풀 업" onclick = "javascript:sendOption();"><span>풀 업</span></label>
               <label><input type = "checkbox" name = "left_option_eq" value = "런닝머신" id = "런닝머신" onclick = "javascript:sendOption();"><span>런닝머신</span></label>
            </div>
            <hr>
            <h6>가격</h6>
            <div>
               최저가 : <span id = "price_value">${keywordMap.price }</span>원 이상
            </div>
            <div>
            <input type="range" max="10000" step="1000" value="${keywordMap.price }" id="price" name = "left_opton_price" onchange="javascript:priceOption();">
            </div>
            <hr>
            <h6>수용 인원</h6>
            <div>
            <select name = "left_option_person_count" onchange = "javascript:sendOption();">
               <option value = "1" <c:if test="${keywordMap.person_count==1}">selected="selected"</c:if>>1</option>
               <option value = "2" <c:if test="${keywordMap.person_count==2}">selected="selected"</c:if>>2</option>
               <option value = "3" <c:if test="${keywordMap.person_count==3}">selected="selected"</c:if>>3</option>
               <option value = "4" <c:if test="${keywordMap.person_count==4}">selected="selected"</c:if>>4</option>
               <option value = "5" <c:if test="${keywordMap.person_count==5}">selected="selected"</c:if>>5</option>
               <option value = "6" <c:if test="${keywordMap.person_count==6}">selected="selected"</c:if>>6</option>
            </select>
            <label class ="left_option_person_count_label">명 이상</label>
            </div>
            <hr>
         </div>
      </div>
      <div class="homegym_search_result">
         <h2 style="margin:30px 0px;">&nbsp;어떤 홈짐을 찾고 계신가요?</h2>
         <div class="homegym_search_result_list">
            <hr>
            <c:set var="HomeGymList" value="${HomeGymList }" />
            <c:choose>
               <c:when test="${empty HomeGymList }">
                  <div class="homegym_search_result_list_item">등록된 홈짐이 없습니다.</div>
               </c:when>
               <c:otherwise>
                  <c:forEach var="dto" items="${HomeGymList }">
                     <div class="homegym_search_result_list_item">
                        <div class = homegym_search_result_list_item_like>
                           <c:if test="${dto.hg_like ==0 }">
                              <a href="#" class="ia" id="${ dto.hg_mem_id }"><i class="far fa-heart likeicon"></i></a>                  
                           </c:if>
                           <c:if test="${dto.hg_like ==1 }">
                              <a href="#" class="ia toggleStyle" id="${ dto.hg_mem_id }"><i class="fas fa-heart likeicon likeafter"></i></a>                  
                           </c:if>   
                        </div>
                        <div class = "homegym_search_result_list_item_img" onclick = "javascript:ContentEnter('${dto.hg_mem_id}');"><img src = "upload/homegymInfo/${dto.hg_upload }"></div>
                        <div class = "homegym_search_result_list_item_content" onclick = "javascript:ContentEnter('${dto.hg_mem_id}');">                  
                           <h4>
                           ${dto.hg_nickname } 님의 홈짐

                           </h4>
                           <h5>${dto.hg_faddr } / ${dto.hg_station }</h5>
                           <p>수용 가능 인원 : ${dto.hg_person_count }
                           </p>
                           <div class = "homegym_search_result_list_item_content_eqlist">
                           <c:if test = "${empty dto.hg_eq_list }">
                           <h6>등록된 기구가 없습니다.</h6>
                           </c:if>
                           <c:forEach var = "eq_list" items="${dto.hg_eq_list }">
                              <div class = "homegym_search_result_list_item_option_${eq_list.eq_name } eqdiv">
                                 ${eq_list.eq_name } : ${eq_list.eq_count }
                              </div>
                           </c:forEach>
                              
                           </div>
                           <div class = "homegym_search_result_list_item_content_price">
                              시간 당 ${dto.hg_price }원
                           </div>   
                        </div>
                     </div>
                     <hr>
                  </c:forEach>
               </c:otherwise>
            </c:choose>   
            <div class = "homegym_search_result_list_paging"><h6>${pageStr }</h6></div>
         </div>
      </div>
   </div>
   </form>
<%@include file="../_include/footer.jsp" %>