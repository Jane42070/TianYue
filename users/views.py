from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from users.models import UserInfo, BookInfo, CommentInfo
from datetime import date
from PIL import Image, ImageDraw, ImageFont
from django.utils.six import BytesIO
import random

# request 就是 HttpRequest 的对象
# request 包含浏览器请求的信息


# Create your views here.
def index(request):
    '''首页'''
    recom_books = []
    books = BookInfo.objects.all()
    for i in range(4):
        recom_books.append(books[random.randrange(1, len(books))])

    print(recom_books)
    return render(request, 'users/index.html', {
        'books': books,
        'recom_books': recom_books,
    })


def login(request):
    '''登录页面'''
    print(request.path)
    if 'uid' in request.COOKIES:
        # 获取记住的用户名
        u_id = request.COOKIES['uid']
    else:
        u_id = ''
    return render(request, 'users/login.html', {'uid': u_id})


def show_args(request, num):
    '''捕获 url 参数'''
    return HttpResponse(num)


def test_ajax(request):
    '''显示 ajax 页面'''
    return render(request, 'users/test_ajax.html')


def ajax_handle(request):
    '''ajax 请求处理'''
    # 返回的 json 数据 {'res': 1}
    return JsonResponse({'res': 1})


def login_ajax(request):
    '''显示 ajax 登录页面'''

    return render(request, 'users/login_ajax.html')


def login_ajax_check(request):
    '''ajax 登录校验'''
    # 1. 获取用户名和密码
    # 2. 进行校验，返回 json 数据
    u_id = request.POST.get('uid')
    u_password = request.POST.get('upassword')
    print(u_id + ':' + u_password)

    # 获取用户输入的验证码
    ucode = request.POST.get('ucode')
    # 获取 session 中储存的验证码
    vcode = request.session['verifycode']
    print('用户输入验证码：' + ucode)
    print('图片验证码：' + vcode)

    if ucode != vcode:
        # 验证码错误
        return JsonResponse({'res': 2})

    # 实际开发：根据用户名和密码查找数据库
    # 模拟：smart 123
    user = UserInfo.objects.filter(uid=u_id)
    if user.exists():
        upassword = UserInfo.objects.get(uid=u_id).upassword
        if u_password == upassword:
            # 用户名和密码正确
            response = redirect('/index')
            response.set_cookie('uid', str(u_id), max_age=14 * 24 * 3600)
            return response
        else:
            return JsonResponse({'res': 0})
            #  return redirect('/login')
    else:
        print('用户名或密码错误')
        return JsonResponse({'res': 0})
        #  return redirect('/login')


# /set_cookie
def set_cookie(request):
    '''设置 cookie 信息'''
    response = HttpResponse('设置 cookie')
    # max_age 保存的秒
    response.set_cookie('num', 1, max_age=14 * 24 * 3600)
    #  expires=datetime.now() + timedelta(days=14))
    # 返回 response
    return response


# /get_cookie
def get_cookie(request):
    '''取出 cookie 的值'''
    # 取出 cookie num 的值
    num = request.COOKIES['num']
    return HttpResponse(num)


def register_id(request):
    '''注册账号'''
    return render(request, 'users/register.html', {})


def register(request):
    '''注册检查'''
    uid = request.POST.get('uid')
    upassword = request.POST.get('upassword')
    uname = request.POST.get('uname')
    udate = request.POST.get('udate')
    uemail = request.POST.get('uemail')
    uphone = request.POST.get('uphone')

    if uname == '' or udate == '':
        uname = uid
        udate = date.today()

    print(uname)
    print(udate)
    print(uemail)
    UserInfo.objects.create_user(uid, upassword, uname, udate, uemail, uphone)
    return render(request, 'users/login.html', {})


def reset_password(request):
    """重置密码"""
    return render(request, 'users/reset_pw.html', {})


def reset_password_check(request):
    '''重置密码检查'''
    uid = request.POST.get('uid')
    upassword = request.POST.get('upassword')
    password = request.POST.get('password')
    rpassword = request.POST.get('rpassword')
    user = UserInfo.objects.filter(uid=uid)
    if user.exists() and password == rpassword:
        user = UserInfo.objects.filter(uid=uid)[0]
        if upassword == user.upassword:
            user.upassword = password
            user.save()
            return JsonResponse({'res': 1})
        else:
            return JsonResponse({'res': 0})
    else:
        return JsonResponse({'res': 0})


def verify_code(request):
    # 引入随机函数模块
    import random
    # 定义变量，用于画面的背景色、宽、高
    bgcolor = (random.randrange(20, 100), random.randrange(20, 100), 255)
    width = 80
    height = 30
    # 创建画面对象
    im = Image.new('RGB', (width, height), bgcolor)
    # 创建画笔对象
    draw = ImageDraw.Draw(im)
    # 调用画笔的 point() 函数绘制噪点
    for i in range(0, 400):
        xy = (random.randrange(0, width), random.randrange(0, height))
        fill = (random.randrange(0, 255), 255, random.randrange(0, 255))
        draw.point(xy, fill=fill)
    # 定义验证码的备选值
    str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0'
    # 随机选取 4 个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]
    # 构造字体对象，MacOS 的字体路径为“/Library/Fonts/”
    font = ImageFont.truetype('/Library/Fonts/msyh.ttf', 18)
    # 构造字体颜色
    fontcolor = (255, random.randrange(0, 255), random.randrange(0, 255))
    # 绘制 4 个字
    draw.text((5, 2), rand_str[0], font=font, fill=fontcolor)
    draw.text((25, 2), rand_str[1], font=font, fill=fontcolor)
    draw.text((45, 2), rand_str[2], font=font, fill=fontcolor)
    draw.text((65, 2), rand_str[3], font=font, fill=fontcolor)
    # 释放画笔
    del draw
    # 存入 session，用于做进一步验证
    request.session['verifycode'] = rand_str
    #  print(rand_str)
    #  print(request.session['verifycode'])
    # 内存文件操作
    buf = BytesIO()
    # 将图片保存在内存中，文件类型为 png
    im.save(buf, 'png')
    # 将内存中的图片数据返回给客户端，MIME 类型为图片 png
    return HttpResponse(buf.getvalue(), 'image/png')


def url_reverse(request):
    return render(request, 'users/url_reverse.html', {})


def admin_index(request):
    '''后台管理'''
    return render(request, 'users/admin_index.html', {})


def book_detail(request, bid):
    '''书籍详情'''
    book = BookInfo.objects.get(id=bid)
    print(book)
    return render(request, 'users/book_detail.html', {'book': book})


def read_book(request):
    '''读书'''
    return render(request, 'users/read_book.html', {})