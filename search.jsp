<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>search</title>
<script src="./jquery-3.6.0.js"></script>
</head>
<body>
	<h1>Check our informations</h1>
	<hr>
	<form method="post">
		School: <select name="s">
			<option value="A">A</option>
			<option value="B">B</option>
		</select><br>
		<label>serial number: <input type="text" id="s_n" name="id_number"></label><br>
		<label>name: <input type="text" id="h_n" name="name"></label><br>
		<label>students <input type="radio" name="rb" value="s"></label>
		<label>professor <input type="radio" name="rb" value="p"></label>
		<br>
		<input id="btn" type="submit" value="search"><br>
	</form>
	<div>
		<table id="board" border="1"></table>
	</div>
	
	<script>
		$('#btn').on("click",(e)=> {
			// serial number, name이 둘다 없으면, alert를 띄운다.
			const school = $('[name="s"]').val();
			const serial_number = $('#s_n').val();
			const name = $('#h_n').val();
			const rb = $('[name="rb"]').val();
				
			if(serial_number.length === 0 || serial_number == null || name.length === 0 || name == null){
				return alert("serial number 또는 name을 입력하세요!");
			}
				
			$ajax({
				type:'post',
				url:'http://localhost:8080/searchDo.jsp',
				data:{
					school:school,
					serial_number: serial_number,
					name: name,
					rb: rb
				},
				success:function(obj){
					//board 부분에 게시판 만들기
					var result = obj.boardList;
					var str =  "<tr> <th></th> <th></th> <th></th> <th></th> </tr>";
					$.each(result,function(){
						
					})
					
					$("#board").append(str);
				},
				error:function(){
					console.log("Error");
				}
			})
				
		})
	</script>
</body>
</html>