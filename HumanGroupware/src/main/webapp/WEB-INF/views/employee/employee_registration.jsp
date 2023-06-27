<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 부서 변경</title>
<link type="text/css" rel="stylesheet" href="/resources/css/employee_registration.css">
</head>
<body>
<!-- 사원관리 / 상세 -->
<div class="inquiry_main">
		<a>부서/직급 변경</a>
	</div>
<div>
	
	<div class="employee_all">
		<div>
			<div class="employee_people">
				<div class="image" id="image">
					<img src="/resources/img/people.png">
				</div>				
				<div class="test">
					<div class="input_box_name">
						<a class="a_box_name">사 원 명</a>
						<select id = a_box_name name = a_box_name class = box_name_select>
							<option value = "선택">선택</option>
						</select>
					</div>
					<div class="input_box_name">
						<a class="a_box_name">연 락 처</a>
						<input type=text id="employee_phone" class="input_type" disabled>
					</div>
					<div class="input_box_name">
						<a class="a_box_name">이 메 일</a>
						<input type=text id="employee_email" class="input_type" disabled>
					</div>
					<div class="input_box_name">
						<a class="a_box_name">아 이 디</a>
						<input type=text id="employee_id" class="input_type" disabled>
					</div>
					
				</div>
			</div>
			<div class="test2">
				<div class="emp_depart_box">
					입 사 일 자<input type=date id=entering_date class="input_box_result">
				</div>
				
				<div class="emp_depart_box">
					<a id=employee_team1>부 서</a>
					<input type="text" id="employee_team2"  value="" class="input_box_result" disabled>
					<select id="select_team" name="select_team" class="input_box_select">
						<option value="1">선택</option>
					</select>
	
				</div>
				<div class="emp_depart_box">
					<a id=employee_position1>직 급</a>
					<input type="text" id="employee_position2" value=""class="input_box_result" disabled>
					<select id="select_position" name="select_position" class="input_box_select">
						<option value="1">선택</option>
					</select>
				</div>
				
				<div class="emp_depart_box">
					<a id=employee_form>고 용 형 태</a>
					<input type="text" id="employee_form2"  value=""class="input_box_result" disabled>
					<select id="select_form" name="select_form" class="input_box_select">
						<option value="1">선택</option>
					</select>
				</div>
							
				<div>
					<input type=hidden id=emp_position1>
					<input type=hidden id=emp_depart1>
					<input type=hidden id = emp_imgimg>
				</div>
			</div>
			<div>
				<input type="button" value="등록" id=employee_insert3 class="insert_btn">
			</div>
	</div>
</div>
</div>

			
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	loadExemployee();
	loadDep_name();
	loadPos_name();
	loadJob_type();
	loadNameChoose();
})
// select 직접입력 
	// 직급
	$('#select_position').change(function(){
		   $("#select_position option:selected").each(function () {
				if($(this).val()== '1'){
					 $("#employee_position2").val('');
					 $("#employee_position2").attr("disabled",true); 
				}else{ 
					 $("#employee_position2").val($(this).text());
					 $("#employee_position2").attr("disabled",true);
					 loadExemployee();
				}});
	});
	// 고용형태
	$('#select_form').change(function(){
		   $("#select_form option:selected").each(function () {
				if($(this).val()== '1'){
					 $("#employee_form2").val('');
					 $("#employee_form2").attr("disabled",true); 
				}else{ 
					 $("#employee_form2").val($(this).text());
					 $("#employee_form2").attr("disabled",true);
					 loadExemployee();
				}});
	});
	// 부서
	$('#select_team').change(function(){
		   $("#select_team option:selected").each(function () {
				if($(this).val()== '1'){
					 $("#employee_team2").val('');
					 $("#employee_team2").attr("disabled",true); 
				}else{ 
					 $("#employee_team2").val($(this).text());
					 $("#employee_team2").attr("disabled",true);
					 loadExemployeeDep();					 
				}});
	});
	// 이름
	$('#a_box_name').change(function(){
		loadEmployeeData();
	})
	
	// 사원 정보 업데이트 ( update ) department_insert0  employee_insert
	$('#employee_insert3').on("click",function(){
 		$.ajax({
			url:'/employee_update0',
			data:{emp_join:$('#entering_date').val(),
				   emp_position:$('#emp_position1').val(),
				   emp_depart:$('#emp_depart1').val(),
				   emp_id:$('#employee_id').val()},
			type:'post',
			dataType:'text',
			beforeSend:function(){
		        let emp_position = $.trim($('#emp_position1').val());
		        let employee_team = $.trim($('#employee_team2').val());
		           if(emp_position==""||emp_position==null){
		              alert('직급, 고용형태를 잘못 선택하셨습니다.');
		              return false;
		           }
		           if(employee_team==""||employee_team==null){
			              alert('부서를 미선택 하셨습니다.');
			              return false;
			           }
			},
			success:function(data){
				if(data=="ok"){
					let position = $("#employee_position2").val();
					let form = $("#employee_form2").val();
					let team = $("#employee_team2").val();
					alert('정보 입력이 완료되었습니다.');
					location.reload();
				}else{
					alert('알수 없는 오류가 발생하였습니다.')
					location.reload();
				}
			}
		})
	})
	
// 한글, 영어만 입력가능
	function employee_kor(e)  {
		e.value = e.value.replace(/[^가-힣]/ig, '')
	}

// select option (부서, 직급, 고용형태) 불러오기
	// 부서명 불러오기 ( select )
	function loadDep_name(){
		$.ajax({url:'/department_select0',
				 type:'post',
				 dataType:'json',
				 success:function(data){
					 for(let i=0; i<data.length; i++){
						 team0 = data[i];
						 let option= '<option value='+team0['dep_name']+'>'+team0['dep_name']+'</option>'; 
						 $('#select_team').append(option);
					 }},
	})}
		
	// 직급명 불러오기 ( select )
	function loadPos_name(){
		$.ajax({url:'/position_select0',
				 type:'post',
				 dataType:'json',
				 success:function(data){
					 for(let i=0; i<data.length; i++){
						 position0 = data[i];
						 let option='<option value='+position0['position_name']+'>'+position0['position_name']+'</option>';
						 $('#select_position').append(option);
					 }},
	})}
	
	// 고용형태 불러오기 ( select )
	function loadJob_type(){
		$.ajax({url:'/form_select0',
				 type:'post',
				 dataType:'json',
				 success:function(data){
					 for(let i=0; i<data.length; i++){
						 form0 = data[i];
						 let option='<option value='+form0['job_type']+'>'+form0['job_type']+'</option>';
						 $('#select_form').append(option);
					 }},
	})}
	
	// 직원 이름 불러오기 ( select )
	function loadNameChoose(){
		$.ajax({url:'/name_select27',
			type:'post',
			 dataType:'json',
				success:function(data){
					for(let i=0; i<data.length; i++){
						name23 = data[i];
						let option='<option value = '+name23['emp_no']+'>'+name23['emp_name']+' '+name23['position_name']+'</option>';
						$('#a_box_name').append(option);
						let name_no = name['emp_no'];
						console.log(name_no);
					}
				}})
	}
	
	// 직급, 고용형태 position_id 확인 ( hidden ) emp_depart1
	function loadExemployee(){
		$.ajax({url:'/exemploye_select1',
			 type:'post',
			 dataType:'json',
			 data:{position_name:$('#employee_position2').val(), job_type:$('#employee_form2').val()},
			 success:function(data){
				 for(let i=0; i<data.length; i++){
					 ex0 = data[i];
					 let ex= ex0['position_id']
					 $('#emp_position1').val(ex);
				 }},
})}
	function loadExemployeeDep(){
		$.ajax({url:'/exemployee_select2',
			 type:'post',
			 dataType:'json',
			 data:{dep_name:$('#employee_team2').val()},
			 success:function(data){
				 for(let i=0; i<data.length; i++){
					 ex0 = data[i];
					 let ex= ex0['dep_id']
					 $('#emp_depart1').val(ex);
				 }},
})}
	
	function loadEmployeeData(){
		 $('#image').empty();
		$.ajax({url:'/employeeData_select',
				 type:'post',
				 data:{emp_id:$('#a_box_name').val()},
				 dataType:'json',
				 success:function(data){
					 for(let i=0; i<data.length; i++){
						 name_select = data[i];
						 let mobile = name_select['emp_mobile'];
						 let email = name_select['emp_email'];
						 let id = name_select['emp_id'];
						 let startDate = name_select['emp_join'];
						 let img05 = name_select['emp_img'];
						 let depart = name_select['dep_name'];
						 let pos_name = name_select['position_name'];
						 let jobType = name_select['job_type'];
						 let positionId = name_select['position_id'];
						 let dep_id = name_select['dep_id'];
						 $('#entering_date').val(startDate);
						 $('#employee_phone').val(mobile);
						 $('#employee_email').val(email);
						 $('#employee_id').val(id);
						 $('#employee_team2').val(depart);
						 $('#employee_position2').val(pos_name);
						 $('#employee_form2').val(jobType);
						 $('#emp_position1').val(positionId);
						 $('#emp_depart1').val(dep_id);
						 $('#select_form').val(jobType);
						 $('#select_position').val(pos_name);
						 $('#select_team').val(depart);
						 let val = $('#a_box_name').val();
						 if( img05 == null){
							 let impo = '<img src="/resources/img/people.png">';
							 $('#image').append(impo);
						 }else{
							 $('#emp_imgimg').val(img05);
							 path = $('#emp_imgimg').val();
							 new_path = path.split("static")[1]
							 let img = '<img src="/resources'+new_path+'">';
							 $('#image').append(img);
							 console.log(img);
						 }
					 }
				 }})
	}

</script>
</html>