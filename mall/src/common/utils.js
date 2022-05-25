// 防抖函数,解决重复频繁调用问题
export function debounce(fn, delay) {
  let timer = null;
  return function (...args) {
    if (timer) {
      clearTimeout(timer);
    }
    timer = setTimeout(() => {
      fn.apply(this, args);
    }, delay);
  };
}

// 时间格式化（）
function padLeftZero(str) {
  return ("00" + str).substr(str.length);
}
export function formatDate(date, fmt) {
  if (/(y+)/.test(fmt)) {
    fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
  }

  let o = {
    "M+": date.getMonth() + 1,
    "d+": date.getDate(),
    "h+": date.getHours(),
    "m+": date.getMinutes(),
    "s+": date.getSeconds()
  };

  for (let k in o) {
    if (new RegExp(`(${k})`).test(fmt)) {
      let str = o[k] + "";
      fmt = fmt.replace(RegExp.$1, RegExp.$1.length === 1 ? str : padLeftZero(str));
    }
  }

  return fmt;
}

//时间戳转换器
export function formatDatechange(value) {
  if (typeof (value) == 'undefined') {
    return ''
  } else {
    let date = new Date(parseInt(value))
    let y = date.getFullYear()
    let MM = date.getMonth() + 1
    MM = MM < 10 ? ('0' + MM) : MM
    let d = date.getDate()
    d = d < 10 ? ('0' + d) : d
    let h = date.getHours()
    h = h < 10 ? ('0' + h) : h
    let m = date.getMinutes()
    m = m < 10 ? ('0' + m) : m
    let s = date.getSeconds()
    s = s < 10 ? ('0' + s) : s
    return y + '-' + MM + '-' + d + ' ' + h + ':' + m + ':' + s
  }
}

// 转义标签名
function htmlEscape(text) {
  return text.replace(/[<>"&]/g, function(match, pos, originalText){
    switch(match) {
      case "<": {
        return "&lt";
      }
      case ">": {
        return "&gt";
      }
      case "&": {
        return "&amp";
      }
      case "\"": {
        return "&quot;";
      }
    }
  });
}

//数组和对象的递归深拷贝
//深拷贝的两重需要解决的问题    1引用数据不在是地址指向  2多层引用数据也许需要深度赋值
export function deepCopyAdvanced(obj){
  if(obj instanceof Array){
    var copy = [];
    for(var i=0,len=obj.length;i<len;i++){
      copy[i] = typeof obj[i] =='object' ? deepCopyAdvanced(obj[i]) : obj[i];
    }
    return copy;
  }else if(obj instanceof Object){
    var copy = {};
    for(var key in obj){
      copy[key] = typeof obj[key] =='object' ? deepCopyAdvanced(obj[key]) : obj[key];
    }
    return copy;
  }

  return obj;
}

//时间选择输出语句
export function timehello(){
  //  拿到系统时间
  let hourtime = new Date().getHours();//获取当前小时数(0-23)
  let str = ''
  if(hourtime>=5&&hourtime<9)str='早晨好';
  if(hourtime>=9&&hourtime<12)str='上午好';
  if(hourtime>=12&&hourtime<18)str='下午好';
  if(hourtime>=18&&hourtime<20)str='傍晚好';
  if(hourtime>=20&&hourtime<23)str='晚间好';
  if(hourtime>=23||hourtime<5)str=`夜已深啦，尽早休息     ❤️️`;
  return str
}

//数组对象的模糊搜索    原数组 ，模糊查找关键字，数组对象的字段
export function mohuquerylistobj(list,keyWord,name) {
  var reg =  new RegExp(keyWord);
  var arr = [];
  for (var i = 0; i < list.length; i++) {
    if (reg.test(list[i][name])) {
      arr.push(list[i]);
    }
  }
  return arr;
}

//排序数组对象（改变原数组）
//list 要排序的数组   obj根据这个属性排序  num 正序还是逆序（1或-1）
export function sortarrayobj(list,obj,num) {
  let compare = function (prop) {
    return function (obj1, obj2) {
      var val1 = obj1[prop];
      var val2 = obj2[prop];
      if (val1 < val2) {
        return num;
      } else if (val1 > val2) {
        return -num;
      } else {
        return 0;
      }
    }
  }
    list.sort(compare(obj))
}