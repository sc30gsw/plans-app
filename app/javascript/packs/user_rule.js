function rule(){
  const userId = document.getElementById("user_id");
  const password = document.getElementById("user_password");
  userId.addEventListener("click", () => {
    const userNameRule = document.getElementById("username-rule");
    userNameRule.innerHTML = "半角英数字16文字まで"
  })
  
  password.addEventListener("click", () => {
    const passwordRule = document.getElementById("password-rule");
    passwordRule.innerHTML = "半角英数字(両方含む)8文字以上"
  })
};
window.addEventListener("load", rule);