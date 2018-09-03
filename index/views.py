import json
import os
import re
import django.utils.timezone as timezone
from django.core import serializers
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from .models import *
from .forms import *
#Create your views here.

def register_views(request):
    if request.method == 'GET':
        return render(request, 'register.html')
    else:
        # 接收提交的数据并注册回数据库
        uphone = request.POST['uphone']
        upwd = request.POST['upwd']
        uname = request.POST['uname']
        uemail = request.POST['uemail']
        address = request.POST['address']
        dic = {
            'uphone': uphone,
            'upwd': upwd,
            'uname': uname,
            'uemail': uemail,
            'address': address,
        }
        Users(**dic).save()
        uid = Users.objects.get(uphone=uphone).id
        request.session['id'] = uid
        request.session['uphone'] = uphone
        return HttpResponseRedirect('/')


def login_views(request):
    if request.method == 'POST':
        # 处理post请求
        # 实现登录操作
        uphone = request.POST['uphone']
        upwd = request.POST['upwd']
        uList = Users.objects.filter(uphone=uphone, upwd=upwd)
        # 判断登录成功　or 失败
        if uList:
            print(uphone+'登录')            
            # 从cookie 中获取登录页面之前的 url
            url = request.COOKIES.get('url','/')
            #bug:从注册页面转来的话，返回注册页面会出错
            #使用正则表达re里的sub方法，替换可能存在的register为空
            pattern = r'register/'
            url = re.sub(pattern,'',url,1,flags=0)
            resp = HttpResponseRedirect(url)
            # 从cookie中将url删除出去
            if 'url' in request.COOKIES:
                resp.delete_cookie('url')
            expires = 60 * 60 * 24 * 365
            # 登录成功
            # 将登录信息保存进　session
            request.session['uphone'] = uphone
            request.session['id'] = uList[0].id
            # 是否记住密码
            if 'isSaved' in request.POST:
                # 将登录信息保存进cookie
                resp.set_cookie('id', uList[0].id, expires)
                resp.set_cookie('uphone', uphone, expires)
            return resp        
        else:
            # 登录失败
            # 继续展示登录页面
            form = LoginForm()
            return render(request, 'login.html', locals())
    else:
        # 处理get请求
        # 获取原地址（请求此方法的地址）
        url = request.META.get('HTTP_REFERER','/')
        # 通过 url 构建相应对象
        resp = HttpResponseRedirect(url)
        # 判断　session 中是否有　id 和 uphone
        if 'id' in request.session and 'uphone' in request.session:
            # session中有登录信息,直接去首页
            return resp
        else:
            # session中没有登录信息
            if 'id' in request.COOKIES and 'uphone' in request.COOKIES:
                # 曾经登录过,而且保存了信息,取出数据保存进session
                uid = request.COOKIES['id']
                uphone = request.COOKIES['uphone']
                request.session['id'] = uid
                request.session['uphone'] = uphone
                return resp
            else:
                # cookies中也没有登录信息
                form = LoginForm()
                resp = render(request, 'login.html', locals())
                # 将url 保存进 cookie
                resp.set_cookie('url',url)
                return resp


def checkphone_views(request):
    # 1.接收前端提交过来的数据 - uphone
    uphone=request.GET['uphone']
    # 2.查询uphone在数据表中是否存在
    u_list=Users.objects.filter(uphone=uphone)
    # 3.如果存在 响应 : {"status":1},如果不存在 响应:{"status":0}
    if u_list:
        s = 1
        msg = '手机号码已被注册'
    else:
        s = 0
        msg = '此号码验证可用'
    dic = {"status":s,"msg":msg}
    return HttpResponse(json.dumps(dic))

def index_views(request):
    print(os.path.abspath(__file__))
    # 读取所有的分类
    list_types=GoodsType.objects.all()

    return render(request,'index.html',locals())


def all_type_goods_views(request):
    page = int(request.GET['page'])
    type_num = int(request.GET['type'])-1
    # 查询所有的类型
    type=GoodsType.objects.all()[type_num]
    #将type序列化成json字符串
    type_json=json.dumps(type.to_dict())
    #获取type下的所有产品，利用Django一对多映射一类自动生成的goods_set属性，排除isActive=false的，并倒序，取所需页面的5件商品
    g_list=type.goods_set.filter(isActive__exact=True).order_by("-id")[0+5*(page-1):5+5*(page-1)]    
    #计算页面总数，为5的倍数直接除5，否则除5加1
    if len(type.goods_set.filter(isActive__exact=True))%5 == 0:
        g_page_num = len(type.goods_set.filter(isActive__exact=True))/5
    else:
        g_page_num = len(type.goods_set.filter(isActive__exact=True))//5 + 1
    #将g_list序列化成json的字符串
    g_list_json = serializers.serialize('json',g_list)
    # 创建一个字典,将type_json和g_list_json封装
    dic = {
        "type":type_json,
        "goods":g_list_json,
        "pages":g_page_num,
        "index_num": page,
    }
    return HttpResponse(json.dumps(dic))

def check_login_views(request):
    if 'id' in request.session and 'uphone' in request.session:
        loginStatus = 1
        id = request.session.get('id')
        uname = Users.objects.get(id=id).uname
        dic = {
            "loginStatus":loginStatus,
            "uname":uname
        }
        return HttpResponse(json.dumps(dic))
    else:
        # session中没有登录信息
        #查询COOKIES中是否包含登录信息
        if 'id' in request.COOKIES and 'uphone' in request.COOKIES:
            user_id = request.COOKIES['id']
            uphone = request.COOKIES['uphone']
            request.session['id']=user_id
            request.session['uphone']=uphone
            uname = Users.objects.get(id=user_id).uname
            loginStatus = 1
            dic = {
                "login_Status":loginStatus,
                "uname":uname
            }
            return HttpResponse(json.dumps(dic))
        else:
            dic = {
                "loginStatus":0
            }
            return HttpResponse(json.dumps(dic))

def logout_views(request):
    if 'id' in request.session and 'uphone' in request.session:
        # 将id和uphone的值从session中移除出去
        del request.session['id']
        del request.session['uphone']
        #记录原地址
        url = request.META.get('HTTP_REFERER','/')
        resp = HttpResponseRedirect(url)
        #判断cookie中是否包含登录信息，再决定是否删除
        if 'id' in request.COOKIES and 'uphone' in request.COOKIES:
            resp.delete_cookie('id')
            resp.delete_cookie('uphone')
        return resp
    return HttpResponseRedirect('/')

# 添加 或 更新 购物车的内容
def add_cart_views(request):
    #接收数据
    user_id = request.session.get('id')
    good_id = request.POST['good_id']
    good_count = 1
    #查询库存，看商品数量是否为0
    good = Goods.objects.get(id=good_id)
    if good.aoi == 0:
        dic = {
            'status':0,
            'statusText':'库存不足，添加购物车失败'
        }
        return HttpResponse(json.dumps(dic))
    else:
        #查看购物车中是否有相同的产品，如果有更新数量，没有新加一条
        cart_list = CartInfo.objects.filter(user_id=user_id,good_id=good_id)
        if cart_list:
            #已经有商品了，更新数量即可
            cartinfo = cart_list[0]
            #对增加后的数量进行判断，超过库存就提示更新失败
            if cartinfo.ccount + good_count > good.aoi:
                dic = {
                    'status':0,
                    'statusText':'库存不足，添加购物车失败'
                }
                return HttpResponse(json.dumps(dic))
            else:#库存安全，可以增加
                cartinfo.ccount = cartinfo.ccount + good_count            
                cartinfo.save()
                dic = {
                    'status':1,
                    'statusText':'更新数量成功'
                }
                return HttpResponse(json.dumps(dic))
        else:
            #无商品，新增记录,默认增加一件
            cartinfo = CartInfo()
            cartinfo.good_id = good_id
            cartinfo.user_id = user_id
            cartinfo.ccount = good_count
            cartinfo.save()
            dic = {
                'status':1,
                'statusText':'添加购物车成功'
            }
            return HttpResponse(json.dumps(dic))

def update_cart_views(request):
    #接收数据
    user_id = request.session.get('id')
    good_id = request.GET['good_id']
    new_count = request.GET['new_count']
    #更新数量前对库存再次进行判断，防止用户在修改用数量期间库存再次减少
    good = Goods.objects.get(id = good_id)
    if int(new_count) > good.aoi:
        dic = {
            'status':0,
            'statusText':'库存不足,修改数量失败'
        }
        return HttpResponse(json.dumps(dic))
    else:
        try: 
            cartinfo = CartInfo.objects.get(user_id=user_id,good_id=good_id)
        except Exception:
            dic = {
                'status':0,
                'statusText':'购物车信息异常,修改失败\n请刷新重试'
            }
            return HttpResponse(json.dumps(dic))
        else:    
            cartinfo.ccount = new_count
            cartinfo.save()
            dic = {
                'status':1,
                'statusText':'修改数量成功'
            }
            return HttpResponse(json.dumps(dic))


def delete_cart_views(request):
    #接收数据
    user_id = request.session.get('id')
    good_id = request.GET['good_id']
    #查看购物车中是否有相同的产品，如果有更新数量，没有新加一条
    #使用try防止购物车信息在其他位置被删除
    try:
        cart_info = CartInfo.objects.get(user_id=user_id,good_id=good_id)
    except Exception:
        dic = {
            'status':0,
            'statusText':'购物车信息异常,删除失败\n请刷新重试'
        }
        return HttpResponse(json.dumps(dic))        
    else:
        cart_info.delete()
        dic = {
            'status':1,
            'statusText':'删除成功'
        }
        return HttpResponse(json.dumps(dic))

def loadcart_views(request):
    user_id = request.session.get('id')
    cart_list = CartInfo.objects.filter(user_id=user_id)
    all_list = []
    for cart_info in cart_list:       
        good = Goods.objects.filter(title=cart_info.good.title)
        good_json = serializers.serialize('json',good)
        dic = {
            'good':good_json,
            'gcount':cart_info.ccount,
        }
        all_list.append(dic)
    return HttpResponse(json.dumps(all_list))
    
def cart_views(request):
    return render(request,'cart.html')

def check_cart_views(request):
    user_id = request.session.get('id')
    cart_list = CartInfo.objects.filter(user_id=user_id)
    ccount = 0
    for cart_info in cart_list:
        ccount += cart_info.ccount
    dic = {
            'ccount':ccount,
        }    
    return HttpResponse(json.dumps(dic))

def balance_views(request):
    user_id = request.session.get('id')
    user = Users.objects.get(id=user_id)
    msg = request.GET['msg']
    address = user.address
    all_list = []
    '''判断之前的跳转网页是否为detail,若为detail，则直接从good映射中查询商品信息，
    否则从购物车类中查询信息'''
    url = request.META.get('HTTP_REFERER','/')
    pattern = r'detail/\d+$'   
    if re.search(pattern,url):
        gid = msg.split(' ')[0]
        gcount = msg.split(' ')[1]
        good = Goods.objects.get(id=gid)
        dic = {
                'name':good.title,
                'picture':good.picture,                
                'gcount':gcount,
                'gprice':good.price * int(gcount)
            }
        all_list.append(dic)
        msg = 'D ' + msg
    else:
        for i in msg.split(' '):
            cart_info = CartInfo.objects.get(user_id=user_id,good_id=i)
            dic = {
                'name':cart_info.good.title,
                'picture':cart_info.good.picture,
                'gcount':cart_info.ccount,
                'gprice':cart_info.good.price * cart_info.ccount
            }
            all_list.append(dic)
    return render(request,'balance.html',locals())

def confirm_balance_views(request):
    user_id = request.session.get('id')
    msg = request.GET['msg']
    if msg.split(' ')[0] == 'D':#此请求为详细页面的单一产品下单请求
        try:
            #查询商品信息,使用try，防止出错
            good = Goods.objects.get(id = msg.split(' ')[1])            
            #使用Goods类内封装的update_aoi函数，数量不足会报异常
            #此函数使用乐观锁，若修改操作期间发现version不匹配会返回0，操作不会成功
            updated = good.update_aoi(msg.split(' ')[1],int(msg.split(' ')[2]))
            if updated:
                #增加订单记录
                order = Orders()
                order.good_id = msg.split(' ')[1]
                order.user_id = user_id
                order.ccount = msg.split(' ')[2]
                order.save()
                dic = {
                'id':order.id,
                'status':1,
                'statusText':'下单成功'
                }
                return HttpResponse(json.dumps(dic))
            else:
                dic = {
                    'status':0,
                    'statusText':'抱歉，商品信息可能已有更新，下单失败'
                }
                return HttpResponse(json.dumps(dic))
        except Exception as e:
            print(e)
            dic = {
                    'status':0,
                    'statusText':'库存不足或商品信息错误,下单失败'
                }
            return HttpResponse(json.dumps(dic))            
    else:#此请求为购物车批量下单请求
        all_list = []
        for i in msg.split(' '):
            #遍历每条购物车信息，依次下单，使用all_list收集下单结果最后一起返回
            try:
                #减少相应库存,使用try，防止出错
                cart_info = CartInfo.objects.get(user_id=user_id,good_id=i)
                updated = cart_info.good.update_aoi(i,cart_info.ccount)
                if updated:
                    #增加订单记录，删除购物车
                    order = Orders()
                    order.good_id = i
                    order.user_id = user_id
                    order.ccount = cart_info.ccount
                    order.save()
                    cart_info.delete()
                    dic = {'id':order.id,'status':1}
                    all_list.append(dic)
                else:
                    print("乐观锁触发，下单失败")
                    dic = {'gid':i,'status':0}
                    all_list.append(dic)
            except Exception:
                print("购物车信息错误或库存不足，下单失败")
                dic = {'gid':i,'status':0}
                all_list.append(dic)
        return HttpResponse(json.dumps(all_list))

def store_center_views(request):
    orderlist = Orders.objects.all()
    all_list = []
    for i in orderlist:
        dic = {
            'oid':i.id,
            'gname':i.good.title,
            'gcount':i.ccount,
            'gprice':i.ccount*i.good.price,
            'uname':i.user.uname,
            'comment':i.comment,
            'create_date':i.create_date,
            'done_date':i.done_date,
            'isDone':i.isDone
        }
        all_list.append(dic)
    return render(request,'store_center.html',locals())

def detail_views(request,gid):
    good = Goods.objects.get(id=gid)
    dic = {
        'gid':gid,
        'title':good.title,
        'picture':good.picture,
        'price':good.price,
        'aoi':good.aoi
    }
    return render(request,'detail.html',locals())

def check_aoi_views(request):
    gid = request.GET['good_id']
    good = Goods.objects.get(id = gid)
    dic = {
        "aoi":good.aoi
    }
    return HttpResponse(json.dumps(dic))

def pay_views(request):
    user_id = request.session.get('id')
    order_ids = request.GET['order_ids']
    totalprice = 0
    for oid in order_ids.split(' '):
        totalprice += Orders.objects.get(id = oid).good.price * Orders.objects.get(id = oid).ccount
    return render(request, 'pay.html', locals())

def pay_ok_views(request):
    user_id = request.session.get('id')
    order_ids = request.GET['order_ids']
    for oid in order_ids.split(' '):
        order = Orders.objects.get(id = oid)
        order.isDone = True
        order.done_date = timezone.now()
        order.save()
    list_types=GoodsType.objects.all()
    return render(request,'index.html',locals())

def user_orders_views(request):
    user_id = request.session.get('id')
    user = Users.objects.get(id = user_id)
    orders = user.orders_set.all()   
    all_list = []
    for order in orders:
        dic = {
            'time':order.create_date,
            'id':order.id,
            'picture':order.good.picture,
            'title':order.good.title,
            'price':order.good.price,
            'count':order.ccount,
            'totalprice':order.good.price * order.ccount,
            'isDone':order.isDone,
            'comment':order.comment,
            'confirm_reciept':order.confirm_reciept
        }
        all_list.append(dic)
    return render(request, 'user_orders.html', locals())

def confirm_reciept_views(request):
    order_id = request.GET['order_id']
    order = Orders.objects.get(id=order_id)
    order.confirm_reciept = True
    order.save()
    return HttpResponseRedirect('/user_orders/')

def comment_views(request,oid):
    order = Orders.objects.get(id=oid)
    comment = request.GET['comment']
    order.comment = comment
    order.save()
    return HttpResponseRedirect('/user_orders/')