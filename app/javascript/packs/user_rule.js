function rule(){
  const userId = document.getElementById("user_id");
  const password = document.getElementById("user_password");
  userId.addEventListener("click", () => {
    const userNameRule = document.getElementById("username-rule");
    const userMessage = "半角英数字のみ16文字以内"
    const userHTML = `
      <p>${userMessage}</p>`;
    userNameRule.insertAdjacentHTML("afterend", userHTML);
    userNameRule.remove();
  })
  
  password.addEventListener("click", () => {
    const passwordRule = document.getElementById("password-rule");
    const passwordMessage = "半角英数字(両方含む)8文字以上"
    const passwordHTML = `
      <p>${passwordMessage}</p>`;
    passwordRule.insertAdjacentHTML("afterend", passwordHTML);
    passwordRule.remove();
  })
};
window.addEventListener("load", rule);