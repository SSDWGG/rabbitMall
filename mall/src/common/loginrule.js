//规则验证账号输入内容
export function checkusername(username) {
    //用户只能绑定一个邮箱，创建一个账号，（不为空,验证，）
    if (/^[A-Za-z0-9]{1,10}$/.test(username)) { //1  账号长度1-10 //仅支持字母数字下划线
        //console.log("账户规则验证成功");
        return 1 //验证成功返回1
    } else {
        // alert("仅支持字母数字下划线And账号长度1-10")
        this.$message.error("仅支持字母数字下划线And账号长度1-10")
        return 0
    }
}
//规则验证密码输入内容
export function checkpassword(password) {
    if (/^(?![^a-zA-Z]+$)(?!\D+$).{6,}$/.test(password)) {
        // console.log("密码规则验证成功");
        return 1
    } else {
        this.$message.error("仅支持6个以上任意字符，但必须包括字母和数字")
        return 0
    }
}
//规则验证邮箱输入内容
export function checkemail(email) {
    if (/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email)) {
        //console.log("邮箱规则验证成功");
        return 1
    } else {
        this.$message.error("~请输入正确的邮箱格式~")
        return 0
    }
}
//规则验证验证码输入
export function checkidentify(identify) {
    if (/^[0-9]{6}$/.test(identify)) {
        // console.log("6位数验证码规则验证成功");
        return 1
    } else {
        this.$message.error("请输入正确的6位数字验证码")
        return 0
    }
}