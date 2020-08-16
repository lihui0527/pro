#-*- coding : utf-8 -*-
# from django.shortcuts import render
from django.shortcuts import render,redirect
from . import models
import datetime,time
from django.core.paginator import Paginator
# from sklearn.externals import joblib
import  numpy as np
from django.http import HttpResponseRedirect,HttpResponse
from django.db.models import Avg, Max, Min, Count, Sum
# Create your views here.
from django.http import HttpResponse
import hashlib
import joblib
from django.conf import settings
from django.contrib import messages
def page_permission_denied(request):
    from django.shortcuts import render
    return render(request, '403.html')


def page_not_found(request):
    from django.shortcuts import render
    return render(request, '404.html')


def page_inter_error(request):
    from django.shortcuts import render
    return render(request, '500.html')


def index(req):
    return render(req,"login.html")

def login(req):
    if req.method == "POST":
        username = req.POST.get("username")
        password = req.POST.get("password")
        return HttpResponse('username')

def login1(req):
    if req.method == 'POST':
        username = req.POST.get("username")
        password = req.POST.get("password")
        # md5 = hashlib.md5()  # 2,获取md5() 方法
        # md5.update(password.encode())  # 3. 对字符串的字节类型加密
        # password = md5.hexdigest()
        if models.Users.objects.filter(username=username, password=password):
            user = models.Users.objects.get(username=username, password=password)
            info = {
                "username": user.username,
                "userid": user.uid,
            }
            req.session['uid'] = user.uid
            req.session['user_name'] = user.username
            req.session['password'] = user.password
            req.session['user_head_img'] = user.head_img
            req.session.set_expiry(60 * 10)
            messages.success(req,"登录成功")
            return render(req, "index.html", info)
        elif models.Administer.objects.filter(username=username, password=password):
            user = models.Administer.objects.get(username=username, password=password)
            info = {
                "user_name": user.username,
                "user_uid": user.aid,
            }
            req.session['administer_id'] = user.aid
            req.session['user_name'] = user.username
            req.session['password'] = user.password
            req.session.set_expiry(60 * 10)

            user1 = models.Users.objects.all()
            # req.session['user_head_img'] = user.head_img
            info1 = {
                # "user_name": user1.username,
                "user1": user1,
                "user_name": user.username,
                "len": len(user1),
                # "user_head_img": user.head_img
            }
            messages.success(req,"登录成功")
            return render(req, "admin.html", info1)
        else:
            info = {
                "mes": "账号或密码输入错误！",
                "class": "alert alert-danger alert-dismissable"
            }
            messages.error(req,"登录失败")
            return render(req, "login.html", info)
    elif req.method == "GET":
        if req.session.get("username"):
            user_name = req.session.get("username")
            password = req.session.get("password")
            user = models.Users.objects.get(name=username, password=password)
            info = {
                "user_name": user.username,
                "user_id": user.uid,
                # "user_head_img": user.head_img
            }
            return render(req, "login.html", info)
        else:
            info = {
                "mes": "请登录后再尝试操作！",
                "class": "alert alert-danger alert-dismissable"
            }
            return render(req, "login.html", info)
    else:
        return redirect("login.html")



def registe(req):
    return render(req,"Register.html")

import hashlib
def registe1(req):
    username = req.POST.get("username")
    password = req.POST.get("password")
    email = req.POST.get("email")
    number = req.POST.get("number")
    head_file = req.FILES["head_file"]
    head_file_save_path = "static/images/user_head/" + str(username) + "-" + str(time.time()) + ".jpg"
    # md5 = hashlib.md5()  # 2,获取md5() 方法
    # md5.update(password.encode())  # 3. 对字符串的字节类型加密
    # password = md5.hexdigest()
    user1 = {"username": username,
             "password": password,
             "email": email,
             "head_img":head_file_save_path,
             "number": number,
             "register_time":datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") }
    with open(head_file_save_path, 'wb') as path:
        for c in head_file.chunks():
            path.write(c)
    title = "你好"+username
    msg = "您已成功注册"
    email_from = settings.EMAIL_FROM
    reciever = [
                email
                ]
    # 发送邮件
    if send_mail(title, msg, email_from, reciever):
        if models.Users.objects.create(**user1):
            info = {
                "mes": "注册成功！请登录~",
                "class": "alert alert-success alert-dismissable"
            }
            messages.error(req,"注册成功")
            return render(req, "login.html", info)
        else:
            info = {
                "mes": "注册失败！",
                "class": "alert alert-danger alert-dismissable"
            }
            messages.error(req,"注册失败")
            return render(req, "register.html", info)
    else:
        messages.error(req,"注册失败")
        return render(req, "register.html", info)

def traceData_del(req):
    id = req.GET['id']
    uid = req.session.get("uid")
    if models.TraceResult.objects.filter(id=id,uid=uid).delete():
        messages.success(req,"删除成功")
        return redirect("/user/traceData")
    else:
        messages.error(req,"删除失败")
        return redirect("/user/traceData")

def traceData(req):
    # uid = req.GET['uid']
    uid = req.session.get("uid")
    # return HttpResponse(uid)
    if uid: 
        data =  models.TraceResult.objects.filter( uid = uid)
        pindex = req.GET.get("pindex")
        # 分页
        pageinator = Paginator(data, 2)
        if pindex == "" or pindex == None:
            pindex = 1
        # else:
        #     pindex = 0
        page = pageinator.page(pindex)
        info1 = {
                    # "user_name": user1.username,
                    "data": data,
                    # "user_name": user.username,
                    "len": len(data),
                    "page": page,
                    # 'paginator': paginator,
                    # "user_head_img": user.head_img
                }
        return render(req,"traceData.html",info1)

    else:
        info ={
            "mes": "请登录后再尝试操作！",
            "class": "alert alert-danger alert-dismissable"
        }
        messages.error(req,"请登录后再尝试操作")
        return render(req,"traceData.html",info)


def nowData1(req):
    uid = req.session.get("uid")
    if uid:
        data = models.PredictResult.objects.filter( uid = uid)
        # return HttpResponse(data[uid][0])
        pindex = req.GET.get("pindex")
        # 分页
        pageinator = Paginator(data, 2)
        if pindex == "" or pindex == None:
            pindex = 1
        # else:
        #     pindex = 0
        page = pageinator.page(pindex)
        info1 = {
                    # "user_name": user1.username,
                    "data": data,
                    # "user_name": user.username,
                    "len": len(data),
                    "page": page,
                    # 'paginator': paginator,
                    # "user_head_img": user.head_img
                }
        return render(req,"nowData1.html",info1)
    else:
        info ={
            "mes": "请登录后再尝试操作！",
            "class": "alert alert-danger alert-dismissable"
        }
        messages.error(req,"请登录后再尝试操作")
        return render(req,"login.html",info)

def nowData_del(req):
    id = req.GET['id']
    uid = req.session.get("uid")
    if models.PredictResult.objects.filter(id=id,uid=uid).delete():
        messages.success(req,"删除成功")
    # data = models.PredictResult.objects.filter(uid=uid)
    # # req.session['user_head_img'] = user.head_img
    # info1 = {
    #     # "user_name": user1.username,
    #     "data": data,
    #     # "user_name": user.username,
    #     "len": len(data),
    #     # "user_head_img": user.head_img
    # }
        return redirect("/user/nowData1")
    else:
        messages.error(req,"删除失败")
        return redirect("/user/nowData1")

    # return render(req,"index.html")
# def page1(req,data):

def nowData_filter(req):
    protocol_type = req.POST.get("protocol_type")
    logged_in = req.POST.get("logged_in")
    uid = req.session.get("uid")
    if protocol_type and logged_in:
        data = models.PredictResult.objects.filter(uid=uid,protocol_type = protocol_type,logged_in = logged_in)
        pindex = req.GET.get("pindex")
            # 分页
        pageinator = Paginator(data, 2)
        if pindex == "" or pindex == None:
            pindex = 1
        # else:
        #     pindex = 0
        page = pageinator.page(pindex)
        info1 = {
                    # "user_name": user1.username,
                    "data": data,
                    # "user_name": user.username,
                    "len": len(data),
                    "page": page,
                    # 'paginator': paginator,
                    # "user_head_img": user.head_img
                }
        messages.success(req,"查找成功")
        return render(req,"nowData1.html",info1)
    elif protocol_type and not logged_in:
        data = models.PredictResult.objects.filter(uid=uid,protocol_type = protocol_type)
        pindex = req.GET.get("pindex")
            # 分页
        pageinator = Paginator(data, 2)
        if pindex == "" or pindex == None:
            pindex = 1
        # else:
        #     pindex = 0
        page = pageinator.page(pindex)
        info1 = {
                    # "user_name": user1.username,
                    "data": data,
                    # "user_name": user.username,
                    "len": len(data),
                    "page": page,
                    # 'paginator': paginator,
                    # "user_head_img": user.head_img
                }
        messages.success(req,"查找成功")
        return render(req,"nowData1.html",info1)
    elif logged_in or not protocol_type:
        data = models.PredictResult.objects.filter(uid=uid,logged_in = logged_in)
        pindex = req.GET.get("pindex")
            # 分页
        pageinator = Paginator(data, 2)
        if pindex == "" or pindex == None:
            pindex = 1
        # else:
        #     pindex = 0
        page = pageinator.page(pindex)
        info1 = {
                    # "user_name": user1.username,
                    "data": data,
                    # "user_name": user.username,
                    "len": len(data),
                    "page": page,
                    # 'paginator': paginator,
                    # "user_head_img": user.head_img
                }
        messages.success(req,"查找成功")
        return render(req,"nowData1.html",info1)
    else:
        messages.error(req,"查找失败")
        return render(req,"login.html")



def historyData2(req):
    return render(req,"historyData2.html")

def dataPhoto(req):
    return render(req,"dataPhoto.html")

def pollutionTracing(req):
    return render(req,"pollutionTracing.html")

def pollutionTracing1(req):
    uid = req.session.get("uid")
    if uid:
        duration = req.POST.get("duration")
        # protocol_type = req.POST.get("protocol_type")
        flag = req.POST.get("flag")
        wrong_fragment = req.POST.get("wrong_fragment")
        urgent = req.POST.get("urgent")
        hot = req.POST.get("hot")
        num_failed_logins = req.POST.get("num_failed_logins")
        # logged_in = req.POST.get("logged_in")
        num_root = req.POST.get("num_root")
        # root_shell = req.POST.get("root_shell")
        is_guest_login = req.POST.get("is_guest_login")
        count = req.POST.get("count")
        srv_count = req.POST.get("srv_count")
        diff_srv_rate = req.POST.get("diff_srv_rate")
        srv_diff_host_rate = req.POST.get("srv_diff_host_rate")
        dst_host_count = req.POST.get("dst_host_count")
        dst_host_srv_count = req.POST.get("dst_host_srv_count")
        dst_host_same_srv_rate = req.POST.get("dst_host_same_srv_rate")
        dst_host_diff_srv_rate = req.POST.get("dst_host_diff_srv_rate")
        msg = [duration,  flag, wrong_fragment, urgent, hot,
            num_failed_logins,  num_root,  is_guest_login,
            count, srv_count, diff_srv_rate, srv_diff_host_rate,
            dst_host_count, dst_host_srv_count,
            dst_host_same_srv_rate, dst_host_diff_srv_rate]
        msg = np.array(msg).reshape(1, -1)
        model2 = joblib.load("C:/Users/Administrator.DESKTOP-U4T0OC3/Desktop/pro/user/logged_in.m")
        model1 = joblib.load("C:/Users/Administrator.DESKTOP-U4T0OC3/Desktop/pro/user/protocol_type.m")
        model3 = joblib.load("C:/Users/Administrator.DESKTOP-U4T0OC3/Desktop/pro/user/root_shell.m")
        preds1 = model1.predict(msg)
        preds2 = model2.predict(msg)
        preds3 = model3.predict(msg)
        # return HttpResponse(preds2)
        post_data = {
                        "uid" : uid,
                        "duration": duration,
                        "protocol_type_result": preds2[0],
                        "flag": flag,
                        "wrong_fragment" : wrong_fragment,
                        "urgent": urgent,
                        "hot" : hot,
                        "num_failed_logins" : num_failed_logins,
                        "logged_in_result" : preds1,
                        "num_root" : num_root,
                        "root_shell_result" : preds3,
                        "is_guest_login" :is_guest_login,
                        "count" : count,
                        "srv_count" :  srv_count,
                        "diff_srv_rate": diff_srv_rate,
                        "srv_diff_host_rate" :srv_diff_host_rate,
                        "dst_host_count" : dst_host_count,
                        "dst_host_srv_count": dst_host_srv_count,
                        "dst_host_same_srv_rate" :dst_host_same_srv_rate,
                        "dst_host_diff_srv_rate" : dst_host_diff_srv_rate,
                        "date_time" : datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                        # "result" : result,
                    }
        if models.TraceResult.objects.create(**post_data):
            info = {
                "mes": "注册成功！请登录~",
                "class": "alert alert-success alert-dismissable"
            }
            messages.success(req,"提交成功")
            return render(req, "pollutionPredict.html", info)
        else:
            info = {
                "mes": "注册失败！",
                "class": "alert alert-danger alert-dismissable"
            }
            messages.error(req,"提交失败")
            return render(req, "pollutionPredict.html", info)
        # a=[preds3,preds2,preds1]
        # return HttpResponse(a)
        # return render(req,"pollutionTracing.html")
    else: 
        info ={
            "mes": "请登录后再尝试操作！",
            "class": "alert alert-danger alert-dismissable"
        }
        messages.error(req,"请登录后再尝试操作！")
        return render(req,"pollutionTracing.html",info)

def pollutionPredict(req):
    return  render(req,"pollutionPredict.html")

def pollutionPredict1(req):
    uid = req.session.get("uid")
    if uid:
        duration = req.POST.get("duration")
        protocol_type = req.POST.get("protocol_type")
        flag = req.POST.get("flag")
        wrong_fragment = req.POST.get("wrong_fragment")
        urgent = req.POST.get("urgent")
        hot = req.POST.get("hot")
        num_failed_logins = req.POST.get("num_failed_logins")
        logged_in = req.POST.get("logged_in")
        num_root = req.POST.get("num_root")
        root_shell = req.POST.get("root_shell")
        is_guest_login = req.POST.get("is_guest_login")
        count = req.POST.get("count")
        srv_count = req.POST.get("srv_count")
        diff_srv_rate = req.POST.get("diff_srv_rate")
        srv_diff_host_rate = req.POST.get("srv_diff_host_rate")
        dst_host_count = req.POST.get("dst_host_count")
        dst_host_srv_count = req.POST.get("dst_host_srv_count")
        dst_host_same_srv_rate = req.POST.get("dst_host_same_srv_rate")
        dst_host_diff_srv_rate = req.POST.get("dst_host_diff_srv_rate")
        
        msg = [duration, protocol_type, flag, wrong_fragment, urgent, hot,
            num_failed_logins, logged_in, num_root, root_shell, is_guest_login,
            count, srv_count, diff_srv_rate, srv_diff_host_rate, dst_host_count, dst_host_srv_count,
            dst_host_same_srv_rate, dst_host_diff_srv_rate]
        msg = np.array(msg).reshape(1, -1)
        model = joblib.load("C:/Users/Administrator.DESKTOP-U4T0OC3/Desktop/pro/user/data.m")
        result = model.predict(msg)
        # return HttpResponse(result)
        #/root/pro/user
        post_data = {
                        "uid" : uid,
                        "duration": duration,
                        "protocol_type": protocol_type,
                        "flag": flag,
                        "wrong_fragment" : wrong_fragment,
                        "urgent": urgent,
                        "hot" : hot,
                        "num_failed_logins" : num_failed_logins,
                        "logged_in" : logged_in,
                        "num_root" : num_root,
                        "root_shell" : root_shell,
                        "is_guest_login" :is_guest_login,
                        "count" : count,
                        "srv_count" :  srv_count,
                        "diff_srv_rate": diff_srv_rate,
                        "srv_diff_host_rate" :srv_diff_host_rate,
                        "dst_host_count" : dst_host_count,
                        "dst_host_srv_count": dst_host_srv_count,
                        "dst_host_same_srv_rate" :dst_host_same_srv_rate,
                        "dst_host_diff_srv_rate" : dst_host_diff_srv_rate,
                        "date_time" : datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                        "result" : result[0],
                    }
        if models.PredictResult.objects.create(**post_data):
            info = {
                "mes": "注册成功！请登录~",
                "class": "alert alert-success alert-dismissable"
            }
            messages.success(req,"提交成功")
            return render(req, "pollutionPredict.html", info)
        else:
            info = {
                "mes": "注册失败！",
                "class": "alert alert-danger alert-dismissable"
            }
            messages.error(req,"提交失败")
            return render(req, "pollutionPredict.html", info)
    else:
        info = {
                "mes": "请登录后再尝试操作！",
                "class": "alert alert-danger alert-dismissable"
            }
        messages.error(req,"请登录后再尝试操作！")
        return render(req, "pollutionPredict.html", info)

def userSystem(req):
    uid = req.session.get("uid")
    if uid:
        user_data = models.Users.objects.get(uid=uid)
        info = {
            "user_name": req.session.get("username"),
            "user_head_img": req.session.get("user_head_img"),
            "user_data": user_data,
            "number": user_data.number,
        }
        return  render(req,"userSystem.html",info)
    else:
        request.session.flush()
        messages.error(req,"请登录后在操作")
        return redirect('/user/login1')

def user_update(req):
    uid= req.session.get("uid")
    username = req.POST.get("username")
    email = req.POST.get("email")
    number = req.POST.get("number")
    head_file = req.FILES["head_file"]
    head_file_save_path = "static/images/user_head/" + str(username) + "-" + str(time.time()) + ".jpg"
    # md5 = hashlib.md5()  # 2,获取md5() 方法
    # md5.update(password.encode())  # 3. 对字符串的字节类型加密
    # password = md5.hexdigest()
    user1 = {"username": username,
             "email": email,
             "head_img": head_file_save_path,
             "number": number,
             }
    user_data = models.Users.objects.filter(uid=uid).update(username=username,
                                                           email= email,number= number,
                                                           head_img= head_file_save_path)
    if user_data:
        with open(head_file_save_path, 'wb') as path:
            for c in head_file.chunks():
                path.write(c)
        if models.Users.objects.filter(uid=uid):
            user = models.Users.objects.get(uid=uid)
            req.session.flush()
            info = {
                "username": user.username,
                "userid": user.uid,
                "user_data":user,
            }
            req.session['uid'] = user.uid
            req.session['user_name'] = user.username
            req.session['password'] = user.password
            req.session['user_head_img'] = user.head_img
            req.session.set_expiry(60 * 10)
        messages.success(req,"修改成功")
        return  render(req,"userSystem.html",info)
    else:
        messages.error(req,"修改失败")
        return  redirect('/user/userSystem')

def setSystem(req):
    return  render(req,"setSystem.html")

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage, InvalidPage
def list(req):
    # pindex=""
    user1 = models.Users.objects.all()
    # users = User.objects.all()
    pindex = req.GET.get("pindex")
    # 分页
    pageinator = Paginator(user1, 2)
    if pindex == "" or pindex == None:
        pindex = 1
    page = pageinator.page(pindex)
    # 值1：所有的数据
    # 值2：每一页的数据
    # 值3：当最后一页数据少于n条，将数据并入上一页
    # paginator = Paginator(user1, 2, 3)

    # try:
    #     # GET请求方式，get()获取指定Key值所对应的value值
    #     # 获取index的值，如果没有，则设置使用默认值1
    #     num = req.GET.get('index', '1')
    #     # 获取第几页
    #     number = paginator.page(num)
    # except PageNotAnInteger:
    #     # 如果输入的页码数不是整数，那么显示第一页数据
    #     number = paginator.page(1)
    # except EmptyPage:
    #     number = paginator.page(paginator.num_pages)

    # 将当前页页码，以及当前页数据传递到index.html
    # return render(request, 'index.html', {'page': number, 'paginator': paginator})
    # req.session['user_head_img'] = user.head_img
    info1 = {
        # "user_name": user1.username,
        "user1": user1,
        # "user_name": user.username,
        "len": len(user1),
        "page": page,
        # 'paginator': paginator,
        # "user_head_img": user.head_img
    }
    return  render(req,"list.html",info1)

def info(req):
    return  render(req,"info.html")

def dele(req):
    uid = req.GET['uid']
    models.Users.objects.filter(uid=uid).delete()
    user1 = models.Users.objects.all()
    # req.session['user_head_img'] = user.head_img
    info1 = {
        # "user_name": user1.username,
        "user1": user1,
        # "user_name": user.username,
        "len": len(user1),
        # "user_head_img": user.head_img
    }
    return render(req,"list.html",info1)
def del_all(req):
        # 先判断发过来的是否是post请求
    if req.method == "POST":
        # 得到要删除的id列表
        values = req.POST.getlist('vals')
        for i in values:
            # 如果id不为空，获取该字段，并将其删除，我们只删除book表，publisher表不变
            if i != '':
                book_obj = models.Users.objects.get(id=i)
                book_obj.delete()
            else:
                return redirect("/user/index")
        return redirect('/user/list')

from django.core.mail import send_mail, send_mass_mail
 
def send_my_email(req):
    title = "美团骑手offer"
    msg = "恭喜你成为美团骑手"
    email_from = settings.DEFAULT_FROM_EMAIL
    reciever = [
        '3207196028@qq.com'
    ]
    # 发送邮件
    send_mail(title, msg, email_from, reciever)
    return HttpResponse("ok")
import uuid
import hashlib
 
def get_random_str():
    uuid_val = uuid.uuid4()
    uuid_str = str(uuid_val).encode("utf-8")
    md5 = hashlib.md5()
    md5.update(uuid_str)
    return md5.hexdigest()
    # return uuid_str

def unlock(req):
    
    # return HttpResponse(str)
    req.session.flush()
    return render(req,"unlock.html")

def unlock1(req):
    
    # if req.POST.get("predict"):
    #     username = req.POST.get("username")
    #     email = req.POST.get("email")
    #     predict = req.POST.get("predict")
    #     if predict == req.session.get("str"):
    #         return HttpResponse("ok")

    # else:
    str=get_random_str()
    str= str[:6]
    req.session['str'] = str
    username = req.POST.get("username")
    email = req.POST.get("email")
    # md5 = hashlib.md5()  # 2,获取md5() 方法
    # md5.update(password.encode())  # 3. 对字符串的字节类型加密
    # password = md5.hexdigest()
    info=''
    if models.Users.objects.filter(username=username , email= email):
        user = models.Users.objects.get(username=username, email= email)
        info = {
            "username": user.username,
            "userid": user.uid,
            "email" : email,
        }
        req.session['username'] = username
        req.session['email'] = email
        title = "验证码"
        msg = str
        email_from = settings.EMAIL_FROM
        reciever = [
            email
        ]
    # 发送邮件
        send_mail(title, msg, email_from, reciever)
        # messages.success(req,"")
        messages.success(req,"验证码已发送")
        return render(req,"unlock1.html",info)
    else:
        req.session.flush()
        messages.error(req,"找不到邮箱或用户名")
        return redirect('/user/unlock')
        # return HttpResponse("ok")
        # return render(req,"unlock.html")

def unlock2(req):
    username = req.POST.get("username")
    email = req.POST.get("email")
    predict = req.POST.get("verdict")
    # return HttpResponse(predict)
    if predict == req.session.get("str"):
        user = models.Users.objects.get(username=username, email= email)
        uid = user.uid
        req.session["uid"] = uid
        info = {
            "username": user.username,
            "userid": user.uid,
            "email" : email,
        }
        # req.session.flush()
        return render(req,"unlock2.html",info)
        # return HttpResponse("成功，等待继续更新")
    else:
        # return HttpResponse("shibai，等待继续更新")
        return redirect("/user/unlock")

def unlock3(req):
    uid = req.session.get("uid")
    # return HttpResponse(uid)
    username = req.POST.get("username")
    email = req.POST.get("email")
    password = req.POST.get("password")
    if models.Users.objects.filter(uid=uid).update(password = password):
        req.session.flush()
        messages.success(req,"修改成功")
        return render(req,"login.html")
    else:
        req.session.flush()
        messages.error(req,"修改失败")
        return redirect('/user/unlock')
    
    # req.session.flush()
    
def Logout(req):
    req.session.flush()
    return redirect("/user/index")
