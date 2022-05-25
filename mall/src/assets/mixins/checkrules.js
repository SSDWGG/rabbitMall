import {
    email,
    identifyingcode,
    upadasendemail
} from "@/network/login";

export const chexkrules = {
    //混入中同样的钩子函数会被优先于原钩子执行
    data() {
        return {}
    }, //混入的数据和元数据相同的情况下会被元数据覆盖，无需担心同名数据干扰
    methods: {
        checkusername(username) {
            //用户只能绑定一个邮箱，创建一个账号，（不为空,验证，）
            if (/^[A-Za-z0-9]{1,10}$/.test(username)) { //1  账号长度1-10 //仅支持字母数字下划线
                //console.log("账户规则验证成功");
                return 1 //验证成功返回1
            } else {
                this.$message.error("仅支持字母数字下划线And账号长度1-10")
                return 0
            }
            // return checkusername(username)

        }, //规则验证账号
        checkadress(adress) {
            if (/^.{6,30}$/.test(adress)) {
                return 1 //验证成功返回1
            } else {
                this.$message.error("地址长度为6-30")
                return 0
            }
        }, //规则地址
        checkage(age) {
            if (age > 10 && age < 200) {
                return 1 //验证成功返回1
            } else {
                this.$message.error("年龄区间为 10-200")
                return 0
            }
        }, //规则年龄
        checkpassword(password) {
            if (/^(?![^a-zA-Z]+$)(?!\D+$).{6,}$/.test(password)) {
                // console.log("密码规则验证成功");
                return 1
            } else {
                this.$message.error("仅支持6个以上任意字符，但必须包括字母和数字")
                return 0
            }
        }, //规则验证密码
        checkemail(email) {
            if (/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email)) {
                //console.log("邮箱规则验证成功");
                return 1
            } else {
                this.$message.error("~请输入正确的邮箱格式~")
                return 0
            }
        }, //规则验证邮箱
        checkidentify(identify) {
            if (/^[0-9]{6}$/.test(identify)) {
                // console.log("6位数验证码规则验证成功");
                return 1
            } else {
                this.$message.error("请输入正确的6位数字验证码")
                return 0
            }
        }, //规则验证验证码

        identifyingEmail(useremailname) {
            if (this.checkemail(useremailname)) { //输入框内容符合规则再发送请求
                email(useremailname).then(res => {
                    //console.log(res)
                    if (res.data == "success") {
                        this.$message.success("~文本邮件发送成功~")
                    } else if (res.data == "false") {
                        this.$message.error("~目标邮箱不存在~")
                    } else if (res.data == "failure") {
                        this.$message.error("~文本邮件发送异常！~")
                    } else if (!res) {
                        this.$message.error("~服务器未发送邮件~")
                    }
                })
            }
        }, //注册验证邮箱
        updateidentifyingEmail(useremailname) {
            if (this.checkemail(useremailname)) { //输入框内容符合规则再发送请求
                upadasendemail(useremailname).then(res => {
                    //console.log(res)
                    if (res.data == "success") {
                        this.$message.success("~文本邮件发送成功~")
                    } else if (res.data == "false") {
                        this.$message.error("~目标邮箱不存在~")
                    } else if (res.data == "failure") {
                        this.$message.error("~文本邮件发送异常！~")
                    } else if (res.data == "noemail") {
                        this.$message.error("~email未注册，请检查后重试~")
                    }
                })
            }
        }, //更新验证邮箱
        identifyingcode(code, email) {
            if (this.checkidentify(code)) { //输入框内容符合规则再发送请求
                identifyingcode(code, email).then(res => {
                    //console.log(res)
                    if (res.data) {
                        this.$message.success("验证码正确")
                        this.emailtag = false;
                    } else {
                        this.$message.warning("验证码错误")
                    }
                })
            }
        } //验证验证码

    },
}