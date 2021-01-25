var XHR=null ; //일단 사용자 브라우저가 뭔지 판단해보자. XMLHttpRequest객체를 브라우저마다 지원하는게 다름

function getXHR(){
	if(window.ActiveXObject){ //IE 6 이상
		return new ActiveXObject('Msxml2.XMLHTTP');		
	}else if(window.XMLHttpRequest){ //chrome,firefox브라우저
		return new XMLHttpRequest();
	}else{ //커스텀브라우저. 지원못해줭~꺼져
		return null;
	}
	
}

function sendRequest(url,params,callback,method){ 
	
	XHR=getXHR();
	
	var httpMethod = method?method:'GET';  //null일경우 겟방식이되게함
	if(httpMethod != 'GET' && httpMethod != 'POST'){  //사용자 오타낫을때
		httpMethod = 'GET' ;
	}
	
	var httpParams = (params == null || params == '')?null:params;
	
	var httpUrl = url;
	if(httpMethod == 'GET' && httpParams != null){  //GET 이면서 넘길데이터가있을때
			httpUrl=httpUrl+'?'+httpParams;
	}
	
	XHR.onreadystatechange = callback;
	XHR.open(httpMethod,httpUrl,true);
	XHR.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	XHR.send(httpMethod == 'POST'?httpParams:null);
	
}