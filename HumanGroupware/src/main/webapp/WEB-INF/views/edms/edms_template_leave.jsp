<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/bootstrap-css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <title>template</title>
</head>
<style>
    #templateDocument table{
        border-collapse: collapse; 
        text-align: center;
    }
    #templateLeaveHead td, #templateLeaveBody td{
        border: 1px solid black;
        height: 55px;
    }
    #templateLeaveHead > tbody > tr:nth-child(1) > td:nth-child(1){
        border: none;
    }
    #templateLeaveHead > tbody > tr:nth-child(1) > td:nth-child(2){
        border-bottom: none;
        width: 40px;
    }
    #templateLeaveHead > tbody > tr:nth-child(2) > td{
        border-bottom: none;
        width: 100px;
    }
    #templateLeaveBody > tbody > tr > td:first-child{
        width: 100px;
    }
    #templateLeaveBody > tbody > tr:nth-child(6) > td:nth-child(2){
        height: 200px;
    }
    #templateLeaveBody > tbody > tr:nth-child(7) > td{
        height: 150px;
    }
    #templateLeaveBody > tbody > tr:nth-child(5) > td:nth-child(2){
        height: 80px;
    }
    #templateLeaveBody input[type=text]{
        width: 45px;
    }
    #templateLeaveBody > tbody > tr:nth-child(n+1):nth-child(-n+3) > td:nth-child(2){
        text-align: start;
        vertical-align: middle;
    }
    #templateLeaveBody textarea{
        outline: none; resize: none; width: 400px; height: 190px; 
        display: block; border: none;
    }
    #modalBody table span{
        color:blue;
    }
    #modalBody table span:hover{
        color:purple;
        cursor: pointer;
    }
    #writer, #approverMidName, #approverFinalName, #leavePeriod{
        width: 50px; padding: 0; outline: none; border: none;
    }
    #writeYear, #writeMonth, #writeDay{
        padding: 0; outline: none; border: none; text-align: right;
    }
    #writeYear{
        width: 60px;
    }
    #writeMonth, #writeDay{
        width: 35px; 
    }
    #leavePeriodDiv input[type=text]{
        outline: none; border: none; text-align: right; background-color: rgb(247, 245, 245);
    }
</style>
<body>
<form id="approvalForm" method="post" action="/edmsSend/leave">
<div class="table-responsive-md">
    <table class="table">
        <tbody>
            <tr class="">
                <td scope="row" style="width: 155px;">제목</td>
                <td>
                    <div class="">
                        <input type="text" class="form-control form-control-sm align-middle" 
                                name="edmsTitle" id="edmsTitle"
                                style="width: 500px;">
                    </div>
                </td>
            </tr>
            <tr class="">
                <td scope="row" style="width: 155px;">결재선지정</td>
                <td>
                    <div class="">
                        <select class="form-select form-select-sm d-inline-block align-middle" 
                        name="selectApprover" id="selectApprover"
                        style="width: 140px;">
                        <option selected hidden>결재자 선택</option>
                        <option value="mid">중간승인자</option>
                        <option value="final">최종승인자</option>
                        </select>
                        <button type="button" class="btn btn-primary btn-sm d-inline-block align-middle"
                                id="btnApprovalLine">선택</button>
                    </div>
                </td>
            </tr>
            <tr>
                <td scope="row" style="width: 155px;">참조</td>
                <td>
                    <div class="">
                        <!-- <input type="text" class="form-control form-control-sm d-inline-block align-middle" 
                                    name="edmsRef" id="edmsRef"
                                    style="width: 400px;" readonly> -->
                        <div id="edmsRef" class="d-inline-block align-middle fs-6" style="width: 465px; height: 62px; padding: 4px 8px; background-color: #fff; outline: 1px solid #ced4da; border-radius: 3px;"></div>
                        <button type="button" class="btn btn-primary btn-sm d-inline-block align-middle"
                            id="btnSelectRef">선택</button>
                    </div>
                    <input type="hidden" id="edmsRefList" name="edmsRefList">
                </td>
            </tr>
        </tbody>
    </table>
</div>
<div class="d-flex justify-content-center" id="templateDocument">
    <table>
        <tr>
            <td style="padding: 0; margin: 0; width: 600px; vertical-align: bottom;">
                <table id="templateLeaveHead" style="width: 600px;">
                    <tr>
                        <td rowspan="2">
                            <div style="padding: 0; margin: 0; width: 334px;">
                                <p style="font-size: 30px;">휴가신청서</p>
                            </div>
                        </td>
                        <td rowspan="2" style="vertical-align: middle">
                            <p>결</p>
                            <p>재</p>
                        </td>
                        <td>작성</td>
                        <td>팀장</td>
                        <td>부서장</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" id="writer" name="writer" value="${empName}" readonly>
                            <input type="hidden" id="writerId" name="writerId" value="${empNo}" readonly>
                        </td>
                        <td>
                            <input type="text" id="approverMidName" readonly>
                            <input type="hidden" id="midId" name="midId" readonly>
                        </td>
                        <td>
                            <input type="text" id="approverFinalName" readonly>
                            <input type="hidden" id="finalId" name="finalId" readonly>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="padding: 0; margin: 0; width: 600px; vertical-align: top;">
                <table id="templateLeaveBody" style="width: 600px;">
                    <tr>
                        <td>소속</td>
                        <td>&emsp;${empDepart}</td>
                    </tr>
                    <tr>
                        <td>직위</td>
                        <td>&emsp;${empPosition}</td>
                    </tr>
                    <tr>
                        <td>성명</td>
                        <td>&emsp;${empName}</td>
                    </tr>
                    <tr>
                        <td>구분</td>
                        <td>
                            <input type="hidden" id="selectedLeaveCategory" name="selectedLeaveCategory">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" 
                                    name="leaveCategory" id="leaveCategory1" value="연차">
                                <label class="form-check-label" for="leaveCategory1">연차</label>
                            </div>
                              <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" 
                                    name="leaveCategory" id="leaveCategory2" value="반차">
                                <label class="form-check-label" for="leaveCategory2">반차</label>
                            </div>
                              <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" 
                                    name="leaveCategory" id="leaveCategory3" value="병가">
                                <label class="form-check-label" for="leaveCategory3">병가</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" 
                                    name="leaveCategory" id="leaveCategory4" value="공가">
                                <label class="form-check-label" for="leaveCategory4">공가</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" 
                                    name="leaveCategory" id="leaveCategory5" value="기타">
                                <label class="form-check-label" for="leaveCategory5">기타</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>일시</td>
                        <td style="font-size: 12px; text-align: center;">
                            <div id="leavePeriodDiv" class="text-start d-inline-block">
                                <input type="text" id="startYear" name="startYear"> 년 
                                <input type="text" id="startMonth" name="startMonth"> 월 
                                <input type="text" id="startDay" name="startDay"> 일부터
                                <br>~<br>
                                <input type="text" id="endYear" name="endYear"> 년 
                                <input type="text" id="endMonth" name="endMonth"> 월 
                                <input type="text" id="endDay" name="endDay"> 일까지 
                                &nbsp;<input type="number" id="leavePeriod" name="leavePeriod"
                                        style="text-align: right;" readonly>일간
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>사유</td>
                        <td><textarea id="leaveDetail" name="leaveDetail"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="border-bottom: none;">
                            <p>위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.</p>
                            <br>
                            <p>
                                <input type="number" id="writeYear" name="writeYear" value="${year}" readonly> 년 
                                <input type="number" id="writeMonth" name="wirteMonth" value="${month}" readonly> 월 
                                <input type="number" id="writeDay" name="writeDay" value="${day}" readonly> 일
                            </p>           
                        </td>
                    </tr>
                    <tr>
                        <td style="border-right: none; border-top: none;"></td>
                        <td style="border-left: none; border-top: none; text-align: end;">
                            <p style="margin-right: 50px;">성명 : ${empName} (인)</p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<div class="d-flex gap-2 mt-5 justify-content-center">
    <button type="submit" name="btnSubmit" id="btnSubmit" class="btn btn-primary">상신</button>
</div>
</form>
<!-- 모달 열기 -->
<button type="button" id="btnOpenModal" class="btn btn-primary btn-sm" data-bs-toggle="modal" 
    data-bs-target="#modalId" style="display: none;">
  Launch
</button>
<!-- 모달 -->
<div class="modal fade" id="modalId" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modalBody">
                <table></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" 
                    data-bs-dismiss="modal" id="btnModalClose">닫기</button>
                <!-- <button type="button" class="btn btn-primary" id="btnModalConfirm">확인</button> -->
            </div>
        </div>
    </div>
</div>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="/js/bootstrap-js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@2.4.0/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs-vis"></script>
<script>
const myTask = '<%=request.getAttribute("myTask")%>';
$(document)
.ready(()=>{
    console.log(myTask);
})
.on("click", "#btnApprovalLine", function(){
    let approvalLine = $("#selectApprover option:selected").val();
    let lineStep = $("#selectApprover option:selected").text();
    console.log(approvalLine);
    if(approvalLine == "mid" || approvalLine == "final"){
        $("#modalTitle").text(lineStep+" 선택");
        $("#btnOpenModal").trigger("click");
        
        $.ajax({
            url: "/edms/emplist",
            type: "post",
            dataType: "json",
            success: (data)=>{
                console.table(data);
                $("#modalBody table").empty();
                data.forEach(el => {
                    let str = "<tr><td><span data-name="+el["empName"];
                    str += " data-id="+el["empNo"]+">";
                    str += "["+el["empDepart"]+"]";
                    str += el["empName"]+" "+el["empPosition"];
                    str += "</span></td></tr>";
                    $("#modalBody table").append(str);
                });
                $("#modalBody span").attr("onclick", "empInfo(this)");
            }
        })
    }else{
        alert("먼저 결재자를 선택해주세요");
        return;
    }
})
.on("change", "#leavePeriodDiv input[type=text]", function(){
    let str = $(this).val();
    let pattern = /^[0-9]+$/;
    if(!pattern.test(str)){
        alert("날짜는 숫자로 입력해주세요");
        $(this).val("");
    }
})
.on("blur", "#endDay", ()=>{
    let startDate = getStartDate($("#startYear").val(), 
                            $("#startMonth").val(), 
                            $("#startDay").val());

    let endDate = getEndDate($("#endYear").val(),
                            $("#endMonth").val(),
                            $("#endDay").val());
                            
    if(startDate == "Invalid Date" || endDate == "Invalid Date"){
        console.log("invalid date");
        return;
    }
    console.log("시작: "+startDate);
    console.log("종료: "+endDate);

    let leavePeriod = new Date(endDate.getTime()-startDate.getTime());
    leavePeriod = Math.floor(leavePeriod / (1000*60*60*24)+1);
    if(leavePeriod < 0) { 
        alert("종료날짜는 시작날짜 이후여야 합니다.");
        return;
    }
    console.log("기간: "+leavePeriod);
    if($("#leaveCategory2").is(":checked")){
        $("#leavePeriod").val(0.5);
    }else{
        $("#leavePeriod").val(leavePeriod);
    }
})
.on("change", "#leavePeriodDiv input[type=text]", function(){
    let id = $(this).attr("id");
    let value = $(this).val();
    if(id.includes("Year")) return;
    if(value.length == 1) $(this).val("0"+value);
})
.on("click", "input:radio[name=leaveCategory]", function(){
    $("#leavePeriod").val("");
    let checked = $(this).val();
    $("#selectedLeaveCategory").val(checked);
    if(checked == "반차"){
        $("#leavePeriod").val(0.5);
    }else{
        $(this).each((i, obj)=>{
            let value = $(obj).val().trim();
            console.log(value)
            if(value == "") return;
        })
        $("#endDay").trigger("blur");
    }
})
.on("submit", "#approvalForm", ()=>{
    if($("#edmsTitle").val().trim()==""){
        alert("제목을 작성해야 합니다.");
        return false;
    }
    if($("#approverMidName").val()=="" || $("#approverFinalName").val()==""){
        alert("결재선을 지정해주세요");
        return false;
    }

    if(confirm("AI확률 예측을 이용 하시겠습니까?")){
        let period = $("#leavePeriod").val();

        getData(parseInt(period), 2, 1);
        alert("확률 예측중입니다. 잠시 기다려주세요");

        return false;

    }else if(!confirm("상신 하시겠습니까?")) return false;

    let refList = [];
    $("#edmsRef a").each(function(i, el){
        refList.push($(el).data("value"));
    })
    if(refList.length > 0){
        $("#edmsRefList").val(refList);
    }
})
.on("click", "#btnSelectRef", ()=>{
    $.ajax({
            url: "/edms/emplist",
            type: "post",
            dataType: "json",
            success: (data)=>{
                console.table(data);
                $("#modalBody table").empty();
                data.forEach(el => {
                    let str = "<tr><td><span data-name="+el["empName"];
                    str += " data-id="+el["empNo"]+">";
                    str += "["+el["empDepart"]+"]";
                    str += el["empName"]+" "+el["empPosition"];
                    str += "</span></td></tr>";
                    $("#modalBody table").append(str);
                    $("#modalBody span").attr("onclick", "refSelect(this)");
                });
            }, complete: ()=>{
                $("#modalTitle").text("참조자 선택");
                $("#btnOpenModal").trigger("click");
            }
        })
})
function empInfo(ths){
    let selectedApprovalLine = $("#selectApprover option:selected").val();
    if(selectedApprovalLine == "mid"){
        $("#approverMidName").val($(ths).data("name"));
        $("#midId").val($(ths).data("id"));
        $("#btnModalClose").trigger("click");
    }else if(selectedApprovalLine == "final"){
        $("#approverFinalName").val($(ths).data("name"));
        $("#finalId").val($(ths).data("id"));
        $("#btnModalClose").trigger("click");
    }
}
function refSelect(ths){
    let count = 1;
    let flag = true
    $("#edmsRef").find("a").each(function(i, el){
        count += 1;
        if($(el).data("value") == $(ths).data("id")){
            // console.log("el value "+$(el).data("value"));
            // console.log("ths value "+$(ths).data("id"));
            $(el).remove();
            count -= 1;
            flag = false;
            return;
        }
    })
    // console.log(count)
    let a = $("<a>",{ href: "#"}).css("font-size", "12px")
    a.attr("id", "a"+$(ths).data("id"));
    a.attr("data-value",$(ths).data("id"));
    a.text($(ths).text());

    if(flag){
        if(count == 1){
        $("#edmsRef").append(a);
        }else if(count > 1){
            $("#edmsRef").append(a);
        }
    }

}
function getStartDate(y, m ,d){
    return new Date(y+"-"+m+"-"+d);
}
function getEndDate(y, m, d){
    return new Date(y+"-"+m+"-"+d);
}
function getData(leavePeriod, i, x){

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

  [ 3],
  [ 3],
  [ 3],
  [ 3],
  [ 3],
  [ 3],
  [ 3],
  [ 3],
  [ 3],
  [ 3],
  [ 3],
  [ 3],
  [ 3],
  [ 3],
  [ 3],

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
const 질의데이터=[[leavePeriod,2,1]];

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
        var _history = [];
        var fitParam = { 
          epochs: 300,
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

              if (data > 5) {
                // 반려확률 : 높음
                alert("반려 확률이 높습니다.");
              } else {
                // 반려확률 : 낮음
                alert("반려 확률이 낮습니다.");
              }
         console.log(myArray);
         console.log(myArray[0]);
        });  
}
</script>
</html>