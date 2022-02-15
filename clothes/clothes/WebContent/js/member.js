function idCheck() {
	if(document.frm.userid.value == "") {
		alert("아이디를 입력하여 주십시요.");
		document.frm.userid.focus();	// 포커스를 아이디 입력 태그로 이동
		return;
	}
	// 정규표현식을 사용해서 아이디에 대한 유효성 검사를 할 수 있음.
	// 아이디 중복체크를 수행하는 새로운 팝업창을 띄웠다.
	// 현재 경로가 '/'(현재 url은 /join.do)이므로, url="idCheck.do" 을 사용 가능
	var url = "idCheck.do?userid=" + document.frm.userid.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
	// 다른 방법 : Ajax를 사용해서 서버와 통신해서 아이디 중복체크를 할 수 있음
	// 별도로 윈도우 팝업창을 띄우지 않음
}


function idok(userid) {
	// opener: joinForm.jsp, document: idCheck.jsp
	// 아이디 중복체크한 값으로 userid를 반영
	opener.frm.userid.value = document.frm.userid.value;
	// 중복확인이 성공되었다는 것을 표시
	opener.frm.reid.value = document.frm.userid.value;
	self.close();	// 팝업창을 닫는다.
}

function joinCheck(){

	if(document.frm.name.value.length==0){
		alert("이름을 입력해주세요!");
		frm.name.focus();
		return false;
		}
		
	var name=document.getElementById("name").value;
	var reg=/^[가-힣]{1,5}$/;
	if(reg.test(name)==false){
		alert("5자이내 한글을 입력해주세요.")
		frm.name.focus();
		return false;
		}
		
	if(document.frm.userid.value.length==0){
		alert("아이디를 입력해 주세요!");
		frm.userid.focus();
		return false;
	}
	if(document.frm.reid.value.length==0){
		alert("아이디 중복검사를 진행해 주세요!")
		return false;
	}
	if(document.frm.pwd.value.length==0){
		alert("비밀번호를 입력해주세요!");
		frm.pwd.focus();
		return false;
	}

	if(document.frm.pwd.value!=document.frm.pwd_check.value){
		alert("비밀번호가 일치하지 않습니다.비밀번호를 다시입력해 주세요!")
		frm.pwd_check.focus();
		return false;
	}
	var pwd=document.getElementById("pwd").value;
	var reg =  /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if (reg.test(pwd)==false){
		alert("비밀번호 형식이 올바르지 않습니다.")
		frm.pwd.focus();
		return false;
	}
	if(document.frm.email.value.length==0){
		alert("이메일 주소를 입력해 주세요!");
		frm.email.focus();
		return false;
	}
	var email = document.getElementById("email").value;
	var reg =/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if(reg.test(email)==false){
			alert("이메일 형식이 올바르지 않습니다.")
			frm.email.focus();
			return false;
		}
	if(document.frm.address.value.length==0){
		alert("주소를 입력해 주세요!");
		frm.address.focus();
		return false;
	}
	var reg=/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
	var phone=document.getElementById("phone").value;
	if(reg.test(phone)==false){
		alert("하이픈을 포함해주세요 ex)010-1111-1111")
		frm.phone.focus();
		return false;
	}
		}
	
function loginCheck(){
	if(document.frm.userid.value.length==0){
		alert("아이디를 입력해주세요!");
		frm.userid.focus();
		return false;
	}
	if(document.frm.pwd.value.length==0){
		alert("비밀번호를 입력해주세요!");
		frm.pwd.focuse();
		return false;
	}
}

function updateCheck(){
	if(document.frm.pwd.value.length==0){
	alert("비밀번호를 입력해주세요!");
	frm.pwd.focus();
	return false;
	}
	var pwd=document.getElementById("pwd").value;
	var reg =  /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	if (reg.test(pwd)==false){
	alert("비밀번호 형식이 올바르지 않습니다.")
	frm.pwd.focus();
	return false;
	}
	if(document.frm.email.value.length==0){
	alert("이메일 주소를 입력해 주세요!");
	frm.email.focus();
	return false;
	}
	var email = document.getElementById("email").value;
	var reg =/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if(reg.test(email)==false){
			alert("이메일 형식이 올바르지 않습니다.")
			frm.email.focus();
			return false;
	}
	if(document.frm.address.value.length==0){
	alert("주소를 입력해 주세요!");
	frm.address.focus();
	return false;
	}
	var reg=/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
	var phone=document.getElementById("phone").value;
	if(reg.test(phone)==false){
		alert("하이픈을 포함해주세요 ex)010-1111-1111")
		frm.phone.focus();
		return false;
	}
	}



	
