<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/user/register.jsp"
		method="post">
		<table>

			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" id="ID" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" id="PASS" /></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" id="PASS2" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="NAME" /></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" id="PHONE" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" id="EMAIL" /></td>
			</tr>
			<tr>
				<td colspan=2><input type="button" value="가입" /></td>
			</tr>

		</table>


	</form>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		var id = $("#ID"), pass = $("#PASS"), pass2 = $("#PASS2"), nameForm = $("#NAME"), phone = $("#PHONE"), email = $("#EMAIL");

		$(document).ready(function() {
			$(":button").click(formCheck)
		})

		function formCheck() {
			////공백체크
			if (id.val() == "") {
				return alert("아이디를 입력해주세요");
			}
			;
			if (pass.val() == "") {
				return alert("비밀번호를 입력해주세요");
			}
			;
			if (pass2.val() == "") {
				return alert("비밀번호 확인을 입력해주세요");
			}
			;
			if (nameForm.val() == "") {
				return alert("이름을 입력해 주세요 ");
			}
			;

			if (email.val() == "") {
				return alert("이메일을 입력해주세요");
			}

			////비밀번호 체크
			if (pass.val().length < 8) {
				return alert("비밀번호를 8자리 이상 입력해주세요")
			} else if (pass2.val().length < 8) {
				return alert("비밀번호 확인을 8자리 이상 입력해주세요")
			}

			if (pass.val() != pass2.val()) {
				return alert("비밀번호가 일치하지 않습니다.")
			}

			if (email.val().indexOf("@") == -1) {
				return alert("이메일 형식이 잘못되었습니다.")
			}
			////전화번호체크
			var phoneNum = Number($("#PHONE").val());
			if (phone.val() == "") {
				return alert("전화번호를 입력해주세요 ")
			}

			if (phone.val().indexOf("-") > -1) {
				return alert("전화번호에 '-'를 입력할수 없습니다.");

			}
			if (isNaN(phoneNum)) {
				return alert("전화번호는 숫자만 입력해주세요 ")

			}

			$("form").submit();
		}
	</script>
</body>
</html>