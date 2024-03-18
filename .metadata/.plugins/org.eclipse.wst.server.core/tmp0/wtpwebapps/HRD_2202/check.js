function validateJoinForm() {
	if(document.frm.custname.value.length == 0){
		alert("회원 성명이 입력되지 않았습니다.")
		frm.custname.focus()
		return false
	}
	if(document.frm.phone.value.length == 0){
		alert("회원 전화번호가 입력되지 않았습니다.")
		frm.phone.focus()
		return false
	}
	if(document.frm.address.value.length == 0){
		alert("회원 주소가 입력되지 않았습니다.")
		frm.address.focus()
		return false
	}
	if(document.frm.joindate.value.length == 0){
		alert("회원 가입날자가 입력되지 않았습니다.")
		frm.joindate.focus()
		return false
	}
	if(document.frm.grade.value.length == 0){
		alert("회원 등급이 입력되지 않았습니다.")
		frm.grade.focus()
		return false
	}
	if(document.frm.city.value.length == 0){
		alert("회원 도시코드가 입력되지 않았습니다.")
		frm.city.focus()
		return false
	}
	
	success();
	return true;
}

function success() {
	alert("회원 등록이 완료되었습니다.")
	// 추가 작업을 수행할 수 있음 (예: 페이지 이동)
}
