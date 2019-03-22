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
							
							var responseMessage = this.responseText;
							if(responseMessage==='SUCCESS'){
								responseMessage = "로그인 되었습니다.";
								history.go(0);
							}
							alert(responseMessage);
							
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
