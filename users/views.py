from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from users.models import UserInfo, BookInfo, CommentInfo
from django.conf import settings
from django.core.paginator import Paginator
from datetime import date
from PIL import Image, ImageDraw, ImageFont
from six import BytesIO
import random

# request 就是 HttpRequest 的对象
# request 包含浏览器请求的信息


def login(request):
    '''登录页面'''
    print(request.path)
    if 'uid' in request.COOKIES:
        # 获取记住的用户 id
        u_id = request.COOKIES['uid']
        # 登录后 session 记住登录状态
        request.session['isLogin'] = 1
    else:
        u_id = ''
    return render(request, 'users/login.html', {'uid': u_id})


# Create your views here.
def index(request):
    '''首页'''
    recom_books = []
    books = BookInfo.objects.all()
    # 随机推送图书
    for i in range(4):
        recom_books.append(books[random.randrange(1, len(books))])

    print(recom_books)
    # 从 session 获取登录状态
    if 'isLogin' not in request.session or request.session['isLogin'] == 0:
        request.session['isLogin'] = 0
        isLogin = request.session['isLogin']
        return render(request, 'users/index.html', {
            'books': books,
            'recom_books': recom_books,
            'isLogin': isLogin,
        })
    else:
        isLogin = request.session['isLogin']
        # 获取登录的用户 id
        u_id = request.COOKIES['uid']
        user = UserInfo.objects.get(uid=u_id)
    #  print(f'isLogin: {isLogin}')
    return render(
        request, 'users/index.html', {
            'books': books,
            'recom_books': recom_books,
            'isLogin': isLogin,
            'user': user,
        })


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

    # 根据用户名和密码查找数据库
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
    else:
        print('用户名或密码错误')
        return JsonResponse({'res': 0})


def register_id(request):
    '''注册账号'''
    return render(request, 'users/register.html', {})


def register(request):
    '''注册检查'''
    # 接收 ajax POST 请求发送的数据
    uid = request.POST.get('uid')
    upassword = request.POST.get('upassword')
    uname = request.POST.get('uname')
    udate = request.POST.get('udate')
    uemail = request.POST.get('uemail')
    uphone = request.POST.get('uphone')

    # 如果昵称或者日期为空就默认为当前 id 和 今天
    if uname == '' or udate == '':
        uname = uid
        udate = date.today()

    print(uname)
    print(udate)
    print(uemail)
    if uid.isnumeric():
        UserInfo.objects.create_user(uid, upassword, uname, udate, uemail,
                                     uphone)
        return render(request, 'users/login.html', {})
    else:
        return render(request, 'users/login.html', {})


def reset_password(request):
    """重置密码"""
    return render(request, 'users/reset_pw.html', {})


def reset_password_check(request):
    '''重置密码检查'''
    # 取得网页 ajax 提交的值
    uid = request.POST.get('uid')
    uemail = request.POST.get('uemail')
    password = request.POST.get('password')
    rpassword = request.POST.get('rpassword')
    # 通过 uid 查找数据库中有无此对象，有则进行密码的对比
    user = UserInfo.objects.filter(uid=uid)
    if user.exists() and password == rpassword:
        user = UserInfo.objects.filter(uid=uid)[0]
        if uemail == user.uemail:
            user.upassword = password
            user.save()
            # 成功返回 { 'res': 1 }
            return JsonResponse({'res': 1})
        else:
            # 失败返回 { 'res': 0 }
            return JsonResponse({'res': 0})
    # 无此对象，失败
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
    # 内存文件操作
    buf = BytesIO()
    # 将图片保存在内存中，文件类型为 png
    im.save(buf, 'png')
    # 将内存中的图片数据返回给客户端，MIME 类型为图片 png
    return HttpResponse(buf.getvalue(), 'image/png')


def book_detail(request, bid):
    '''书籍详情'''
    # 获取 id 对应的图书
    book = BookInfo.objects.get(id=bid)
    print(book)
    # 获取登录状态
    isLogin = request.session['isLogin']
    if isLogin == 0:
        return render(request, 'users/book_detail.html', {
            'book': book,
            'isLogin': isLogin,
        })
    # 获取登录的用户 id
    u_id = request.COOKIES['uid']
    user = UserInfo.objects.get(uid=u_id)

    return render(request, 'users/book_detail.html', {
        'book': book,
        'isLogin': isLogin,
        'user': user,
    })


def read_book(request, bid):
    '''读书'''
    # 获取 id 对应的图书
    book = BookInfo.objects.get(id=bid)
    print('Reading book:' + book.bname)
    return render(request, 'users/read_book.html', {'book': book})


def user_index(request, u_id):
    '''用户个人界面'''
    # 获取用户信息
    user = UserInfo.objects.get(uid=u_id)
    return render(request, 'users/user_index.html', {
        'user': user,
    })


def logout(request):
    '''注销用户'''
    request.session['isLogin'] = 0
    return redirect('/index')


# 前端访问时，需要传递页码
def classify(request, btype, pindex):
    '''书籍分类浏览'''
    # 判断 pindex 是否为空
    if pindex == '':
        pindex = 1
    else:
        pindex = int(pindex)

    # 1. 查询出某一类的所有书籍
    type_books = BookInfo.objects.filter(btype=btype)
    # 2. 分页
    paginator = Paginator(type_books, 20)
    # 3. 获取第一页的内容
    # page 是 paginator 的实例对象
    # 返回当前页码
    print(paginator.num_pages)
    # 返回当页数
    print(paginator.page_range)
    page = paginator.page(pindex)
    print(page.object_list)
    # 展示分类菜单
    # 获取分类
    btypes = [book.btype for book in list(BookInfo.objects.all())]
    books_btype = list(set(btypes))
    books_btype.sort(key=btypes.index)
    # 判断登录状态
    isLogin = request.session['isLogin']
    # 获取登录的用户 id
    u_id = request.COOKIES['uid']
    user = UserInfo.objects.get(uid=u_id)
    # 4. 使用模板
    return render(
        request, 'users/classify.html', {
            'page': page,
            'btype': btype,
            'btypes': books_btype,
            'isLogin': isLogin,
            'user': user,
        })


#  def upload_pic(request):
#      '''上传图片'''
#      return render(request, 'users/upload_pic.html', {})

#  def handle_pic(request):
#      '''上传图片处理'''
#      # 1. 获取上传的图片
#      pic = request.FILES["pic"]
#      print(type(pic))
#      # 小文件放在内存中 < 2.5 mb
#      # return <class 'django.core.files.uploadedfile.InMemoryUploadedFile'>
#      # 大文件写入到临时文件
#      # return <class 'django.core.files.uploadedfile.TemporaryUploadedFile'>

#      # 2. 创建一个文件
#      save_path = '{}/users/{}'.format(settings.MEDIA_ROOT, pic.name)
#      with open(save_path, 'wb') as f:
#          # 3. 获取上传文件的内容并写入到创建的文件中
#          for content in pic.chunks():
#              f.write(content)
#              print(content)
#      print(pic.chunks())
#      PicTest.objects.create(pic='users/{}'.format(pic.name))
#      return HttpResponse("pic.name={}".format(pic.name))
