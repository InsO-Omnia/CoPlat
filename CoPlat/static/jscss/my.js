/**
 * Created by Zetta on 2016/7/3.
 */

function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays*24*60*60*1000));
	var expires = "expires="+d.toUTCString();
	document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(c_name)
{
	if (document.cookie.length>0)
	{
		c_start=document.cookie.indexOf(c_name + "=");
		if (c_start!=-1)
		{
			c_start=c_start + c_name.length+1;
			c_end=document.cookie.indexOf(";",c_start);
			if (c_end==-1) c_end=document.cookie.length;
			return document.cookie.substring(c_start,c_end);
		}
	}
	return "";
}

function clearCookie(name) {
	setCookie(name, "", -1);
}

function getJsonLength(jsonObj){
	var length = 0;
	for(var item in jsonObj){
		length++;
	}
	return length;
}

function adminQuit(cname){
	clearCookie(cname);
	alert('已成功退出');
	window.location.href = './loginadmin.html'
}

function teacherQuit(cname){
	clearCookie(cname);
	alert('已成功退出');
	window.location.href = './login.html'
}

function studentQuit(cname){
	clearCookie(cname);
	alert('已成功退出');
	window.location.href = './login.html'
}

function adminReady(){
	var userid = getCookie('adminid');
	if(userid == ''){
		alert('未以管理员身份登录系统，请登录！');
		window.location.href = './loginadmin.html';
		return;
	}
	var userinfo = $('#userinfo');
	var str = '';
	str = str + '<div> 欢迎您，' + userid + '</div><br>';
	str = str + '<button class="btn btn-default" onclick="adminQuit(\'adminid\')">' + '退出登录' + '</button>';
	userinfo.empty();
	userinfo.append(str);
}

function teacherReady(){
	var userid = getCookie('teacherid');
	if(userid == ''){
		alert('未登录系统，请登录！');
		window.location.href = './login.html';
		return;
	}
	var userinfo = $('#userinfo');
	var str = '';
	str = str + '<div> 欢迎您，' + userid + '</div><br>';
	str = str + '<button class="btn btn-default" onclick="teacherQuit(\'teacherid\')">' + '退出登录' + '</button>';
	userinfo.empty();
	userinfo.append(str);
}

function studentReady(){
	var userid = getCookie('studentid');
	if(userid == ''){
		alert('未登录系统，请登录！');
		window.location.href = './login.html';
		return;
	}
	var userinfo = $('#userinfo');
	var str = '';
	str = str + '<div> 欢迎您，' + userid + '</div><br>';
	str = str + '<button class="btn btn-default" onclick="studentQuit(\'studentid\')">' + '退出登录' + '</button>';
	userinfo.empty();
	userinfo.append(str);
}

function getFileFormat(filename){
	var x = filename.lastIndexOf('.');
	var format = filename.substr(x, filename.length);
	return format;
}

function checkFileType(type, format){
	var result = true;
	switch (type){
		case 'handouts':
			if(format != '.ppt' && format != '.pptx' && format != '.pdf'){
				result = false;
			}
			break;

		case 'documentation':
			if(format != '.doc' && format != '.docx' && format != '.pdf'){
				result = false;
			}
			break;

		case 'vedio':
			if(format != '.mp4'){
				result = false;
			}
			break;

		case 'uncategoried':
			result = true;
			break;

		default:
			result = false;
			break;
	}
	return result;
}

function checkDate(st, et, weeks){
	//YYYY-MM-DD
	var s = new Date();
	var e = new Date();
	var syear = st.substring(0,4);
	var smonth = st.substring(5,7);
	var sday = st.substring(8,10);
	var eyear = et.substring(0,4);
	var emonth = et.substring(5,7);
	var eday = et.substring(8,10);
	s.setFullYear(syear);
	s.setMonth(smonth - 1);
	s.setDate(sday);
	s.setHours(0);
	s.setMinutes(0);
	s.setSeconds(0);
	s.setMilliseconds(0);
	e.setFullYear(eyear);
	e.setMonth(emonth - 1);
	e.setDate(eday);
	e.setHours(23);
	e.setMinutes(59);
	e.setSeconds(59);
	e.setMilliseconds(999);
	var datemillseconds = e.getTime() - s.getTime();
	var weekmillseconds = (weeks * 7) * 24 * 60 * 60 * 1000 - 1;
	if((weekmillseconds - datemillseconds) == 0){
		return true;
	}
	else{
		return false;
	}
}
