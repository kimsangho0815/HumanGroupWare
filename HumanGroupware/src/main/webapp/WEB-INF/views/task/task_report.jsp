<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<%@ page import="java.util.Map" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/bootstrap-css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<style>
.flexContainer{
	display:flex;
}
.tableBox {
	width:95%;
}
input{ outline:none; border:none;}
</style>
<body>
<%
    Map<String, Object> userInfoMap = (Map<String, Object>) session.getAttribute("userInfoMap");
    String userName = (String) userInfoMap.get("emp_name");
    int depart=(int)userInfoMap.get("emp_depart");
    int userid=(int)userInfoMap.get("emp_no");
    int managerNum = (int)userInfoMap.get("managerNum");
    String managerName = (String)userInfoMap.get("managerName");
    String departName = (String)userInfoMap.get("dep_name");
%>
<input type="hidden" id="managerNum" value =<%=managerNum %>>
<input type="hidden" id="userName" value =<%=userName %>>
<input type="hidden" id="userID" value =<%=userid %>>
<div class="flexContainer"> 
<%if(userid==managerNum){%>
	<div class="tableBox">
			<table id="SendTask" class="table">
				<tr><td><strong>작성한 업무함</strong></td></tr>
				<tr>
					<td>업무 이름</td>
					<td>수행자</td>
					<td>내용</td>
					<td>업무 기한</td>
				</tr>
			</table>
			<div id="pageButtonBox"></div>
	</div>
<%}else {%>
	<div class="tableBox">
			<table id="ReceiveTask" class="table">
				<tr><td><strong>지시받은 업무함</strong></td></tr>
				<tr>
					<td>업무 이름</td>
					<td>지시자</td>
					<td>내용</td>
					<td>업무 기한</td>
				</tr>
			</table>
			<div id="pageButtonBox"></div>
	</div>
<%} %>
</div>

</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/js/bootstrap-js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@2.4.0/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs-vis"></script>
<script>
$(document)
.ready(function(){
	selectTask()
	checkManager()
})
.on("click","#SendTask tr:gt(1) td:nth-child(3)",function(){
	
	let type = "S_Task"
	
	let t_id = $(this).parent("tr").find("input[name='task_Num']").val()
	let userID=$("#userID").val()
	
	document.location="/detail/"+type+"/"+t_id+"/"+userID
	
})
.on("click","#ReceiveTask tr:gt(1) td:nth-child(3)",function(){
	
	let type = "R_Task"

	let t_id = $(this).parent("tr").find("input[name='task_Num']").val()
	let userID=$("#userID").val()
	
	document.location="/detail/"+type+"/"+t_id+"/"+userID
})
function selectTask(){
	$.ajax({url:"/selectTasks",
			type:"post",
			dataType:"json",
			data:{userID:$("#userID").val(),
				 managerNum:$("#managerNum").val()},
			success:function(data){
				for(let i=0; i<data.length; i++){
					let li = data[i]
					let tb = "<tr>"
					
					tb+= "<td><input type='hidden' value="+li["task_id"]+" name='task_Num'>"+li["task_name"]+"</td>"
					tb+= "<td>"+li["task_human"]+"</td>"
					tb+= "<td id='contentRank"+i+"'>"+li["task_content"]+"</td>"
					tb+= "<td>"+li["task_started"]+"~"+li["task_limit"]+"</td></tr>"
					let a = li["task_started"]
					let b = a.split("-")
					let c = li["task_limit"]
					let d = c.split("-")
					let e = parseInt(d[2])-parseInt(b[2])
					console.log("업무기한 날짜 : "+e)
					let x =  data.length
					
					getData(e,x,i)
					if($("#userID").val()==$("#managerNum").val()){
						$("#SendTask").append(tb)
					}else{
						$("#ReceiveTask").append(tb)	
					}
					
				}				
			}
	})
}
function checkManager(){
	
	let manager = $("#managerNum").val()
	
	if(manager==$("#userID").val()||manager==100){		
		let tag1 = "<li><a href='/depWorkLog' class='link-dark d-inline-flex text-decoration-none rounded'>부서일지</a></li>"
		$("#btn1").append(tag1)
		let tag2=  "<li><a href='#' class='link-dark d-inline-flex text-decoration-none rounded'>휴지통</a></li>"
		$("#btn1").append(tag2)
		let tag3 = "  <li><a href=''#' class='link-dark d-inline-flex text-decoration-none rounded'>휴지통</a></li>"
		$("#btn2").append(tag3)
	}		
}
function getData(e,x,i){

	//사원이 요청하면 상급자가 결정
	//  업무기간, 요청자의 직급, 평가자직급
	// 중요도 판단.
	//0 사원 1차장 2과장
const 보스톤_원인 = [
    [10,2,1],
	[10,2,1],
	[10,2,1],
	[10,2,1],
	[10,2,1],
	[10,2,1],
	[10,2,1],
	[10,2,1],
	[10,2,1],
	[10,2,1],
	[10,2,1],
	[10,2,1],
	[10,2,1],
	[10,2,1],
	[10,2,1],


	[7,2,1],
	[7,2,1],
	[7,2,1],
	[7,2,1],
	[7,2,1],
	[7,2,1],
	[7,2,1],
	[7,2,1],
	[7,2,1],
	[7,2,1],
	[7,2,1],
	[7,2,1],
	[7,2,1],
	[7,2,1],
	[7,2,1],


	[5,2,1],
	[5,2,1],
	[5,2,1],
	[5,2,1],
	[5,2,1],
	[5,2,1],
	[5,2,1],
	[5,2,1],
	[5,2,1],
	[5,2,1],
	[5,2,1],
	[5,2,1],
	[5,2,1],
	[5,2,1],
	[5,2,1],

  
    [3,2,1],
	[3,2,1],
	[3,2,1],
	[3,2,1],
	[3,2,1],
	[3,2,1],
	[3,2,1],
	[3,2,1],
	[3,2,1],
	[3,2,1],
	[3,2,1],
	[3,2,1],
	[3,2,1],
	[3,2,1],
	[3,2,1],

    [2,2,1],
	[2,2,1],
	[2,2,1],
	[2,2,1],
	[2,2,1],
	[2,2,1],
	[2,2,1],
	[2,2,1],
	[2,2,1],
	[2,2,1],
	[2,2,1],
	[2,2,1],
	[2,2,1],
	[2,2,1],
	[2,2,1],    

	[1,2,1],
	[1,2,1],
	[1,2,1],
	[1,2,1],
	[1,2,1],
	[1,2,1],
	[1,2,1],
	[1,2,1],
	[1,2,1],
	[1,2,1],
	[1,2,1],
	[1,2,1],
	[1,2,1],
	[1,2,1],
	[1,2,1],
	

	[0,2,1],
	[0,2,1],
	[0,2,1],
	[0,2,1],
	[0,2,1],
	[0,2,1],
	[0,2,1],
	[0,2,1],
	[0,2,1],
	[0,2,1],
	[0,2,1],
	[0,2,1],
	[0,2,1],
	[0,2,1],
	[0,2,1],


   ];

//유저가 방문방의 별점

        const 보스톤_결과 = [
      [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],

	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],
	  [ 1],

	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],

	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],

      [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],

      [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],

      [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
	  [ 5],
 ]
	//1월에 남성이 A호텔의 특정룸의 평점을 구해주세요.
	const 질의데이터=[
	[e,2,1],
	];

	//제시한 지역중에 높은순으로 추천순위가 된다.     
	        
	   
	        // 1. 과거의 데이터를 준비합니다. 
	        var 원인 = tf.tensor(보스톤_원인);
	        var 결과 = tf.tensor(보스톤_결과);
		var 질의 =tf.tensor(질의데이터);
	 
	        // 2. 모델의 모양을 만듭니다. 
	        var X = tf.input({ shape: 3 });
	        var H1 = tf.layers.dense({ units: 3, activation:'relu' }).apply(X);
	        var H2 = tf.layers.dense({ units:3, activation:'relu' }).apply(H1);
	        var Y = tf.layers.dense({ units: 1 }).apply(H2);
	        var model = tf.model({ inputs: X, outputs: Y });
	        var compileParam = { optimizer: tf.train.adam(), loss: tf.losses.meanSquaredError }
	        model.compile(compileParam);
	        tfvis.show.modelSummary({name:'요약', tab:'모델'}, model);
	 
	        // 3. 데이터로 모델을 학습시킵니다. 
//	         var fitParam = {epochs:500}
	        var _history = [];
	        var fitParam = { 
	          epochs: 250, 
	          callbacks:{
	            onEpochEnd:
	              function(epoch, logs){
	                console.log('epoch', epoch, logs, 'RMSE=>', Math.sqrt(logs.loss));
	                _history.push(logs);
	                tfvis.show.history({name:'loss', tab:'역사'}, _history, ['loss']);
	              }
	          }
	        } // loss 추가 예제
	        model.fit(원인, 결과, fitParam).then(function (result) {
	             
	            // 4. 모델을 이용합니다. 
	            // 4.1 기존의 데이터를 이용
	            var 예측한결과 = model.predict(질의);
	            예측한결과.print();
	            var myArray = 예측한결과.dataSync();
	         // view 업무보고를 할 때 하급사원이 보고를 할 때 
	         let data = Math.floor(myArray);
	         
		 	 
 				 var tdElement = document.getElementById("contentRank"+i);
  				 var spanElement = tdElement.querySelector("span.importance");
  				 if (!spanElement) {
    				spanElement = document.createElement("span");
    				spanElement.className = "importance";
    				tdElement.appendChild(spanElement);
  				}
  				
  				if (data >= 4 && data <= 5) {
    				// 업무 중요도 : 높음
    				spanElement.textContent = "업무 중요도: 높음!";
   					spanElement.style.marginLeft = "10px";
    				spanElement.style.color = "red"; // 텍스트 색상을 빨간색으로 설정
    				spanElement.style.fontWeight = "bold"; // 글꼴 두께를 굵게 설정
  				} else {
    				// 업무 중요도 : 낮음
    				spanElement.textContent = "업무 중요도: 낮음!";
    				spanElement.style.marginLeft = "10px";
    				spanElement.style.color = "blue"; // 텍스트 색상을 파란색으로 설정
    				spanElement.style.fontWeight = "bold"; // 글꼴 두께를 굵게 설정
  				}
			


	         console.log(myArray);
	         console.log(myArray[0]);
	        });  
}
</script>
</html>