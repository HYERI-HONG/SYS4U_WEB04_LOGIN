var empManager = (()=>{
	
	return {
		logManager : x=>{
			
			document.getElementById("loginBtn").onclick = function(){
				var loginForm = document.loginForm;
				var id = loginForm.id.value;
				var pw = loginForm.password.value;
				
				
				if(id===''||pw===''){
					alert("아이디, 비밀번호를 입력하세요.");
				}else{
					var xhr = new XMLHttpRequest();
					xhr.onreadystatechange = function() {
						if (this.status === 200 && this.readyState === 4) {
							
							if(this.responseText==='NoExists'){
								alert("존재하지 않는 아이디, 비밀번호입니다.");
							}else if(this.responseText==='WRONG'){
								alert("아이디와 비밀번호가 일치하지 않습니다.")
							}else{
								alert("로그인되었습니다.")
								location.href = x+"/empList.do"
							}
						}
					}
					xhr.open("POST", x+"/empLogin.do", true);
					xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
					xhr.send("id="+id+"&password="+pw);
				
				}
			};
			document.getElementById("logoutBtn").onclick = function(){
				location.href = x+"/empLogout.do";
			};
			
		}
	};
	
})();
