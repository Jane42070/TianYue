from django.db import models


# Create your models here.
# 为父类添加新的创建方法
# 用户信息管理类
class UserInfoManager(models.Manager):
    '''用户信息管理类'''
    def create_user(self, uid, upassword, uname, udate, uemail, uphone):
        '''创建用户'''
        model_class = self.model
        user = model_class()
        user.uid = uid
        user.upassword = upassword
        user.uname = uname
        user.udate = udate
        user.uemail = uemail
        user.uphone = uphone
        user.save()
        return user

    def create_user_in_linear_list(self, linear_list):
        '''通过列表或元祖创建用户'''
        model_class = self.model
        user = model_class()
        user.uid = linear_list[0]
        user.upassword = linear_list[1]
        user.uname = linear_list[2]
        user.udate = linear_list[3]
        user.uemail = linear_list[4]
        user.uphone = linear_list[5]
        user.save()
        return user


# 书信息管理类
class BookInfoManager(models.Manager):
    '''书信息管理类'''
    def create_book(self, bname, bout, bauthor, bdate, bpic, bintro, bcontent,
                    bprice, btype):
        '''创建图书'''
        model_class = self.model
        book = model_class()
        book.bname = bname
        book.bout = bout
        book.bauthor = bauthor
        book.bdate = bdate
        book.bpic = bpic
        book.bintro = bintro
        book.bcontent = bcontent
        book.bprice = bprice
        book.btype = btype
        book.save()
        return book

    def create_book_in_linear_list(self, linear_list):
        '''通过列表或元祖创建图书'''
        model_class = self.model
        book = model_class()
        book.bname = linear_list[0]
        book.bout = linear_list[1]
        book.bauthor = linear_list[2]
        book.bdate = linear_list[3]
        book.bpic = linear_list[4]
        book.bintro = linear_list[5]
        book.bcontent = linear_list[6]
        book.bprice = linear_list[7]
        book.btype = linear_list[8]
        book.save()
        return book


# 书评论管理类
class CommentInfoManager(models.Manager):
    '''书评论管理类'''
    def create_comment(self, ccomment, cstar, cuser, cbook):
        '''发布评论'''
        model_class = self.model
        comment = model_class()
        comment.ccomment = ccomment
        comment.cstar = cstar
        comment.cuser = cuser
        comment.cbook = cbook
        comment.save()
        return comment


# 重写 __str__ 的返回值
# 重写 Meta 下的默认数据库名
# 用户信息模型类
class UserInfo(models.Model):
    '''用户信息模型类'''
    # 用户名
    uid = models.CharField(max_length=20, unique=True, blank=True)
    # 用户密码
    upassword = models.CharField(max_length=20)
    # 用户昵称
    uname = models.CharField(max_length=20, default=uid, blank=True)
    # 用户性别 默认为男
    ugender = models.BooleanField(default=False)
    # 用户生日
    udate = models.DateField()
    # 用户邮箱
    uemail = models.CharField(max_length=40, blank=True)
    # 用户住址
    uaddr = models.CharField(max_length=100, default='未知')
    # 用户手机
    uphone = models.CharField(max_length=20, blank=True)
    # 用户简介
    ucomment = models.CharField(max_length=100,
                                blank=True,
                                default='这个人很懒，什么都没有写')

    objects = UserInfoManager()

    def __str__(self):
        return self.uid

    class Meta():
        db_table = 'user_info'


# 书信息模型类
class BookInfo(models.Model):
    '''书信息模型类'''
    # 书名
    bname = models.CharField(max_length=200, blank=True)
    # 出版社
    bout = models.CharField(max_length=40, blank=True, default='未知')
    # 作者
    bauthor = models.CharField(max_length=80, blank=True, default='不详')
    # 日期
    bdate = models.DateField(default='1970-01-01')
    # 封面
    bpic = models.CharField(max_length=200, default='暂无图片')
    # 简介
    bintro = models.TextField(max_length=1000, default='此书暂无简介')
    # 字数
    bcontent = models.CharField(max_length=20, default='0')
    # 价格
    bprice = models.DecimalField(default=20.00,
                                 max_digits=10,
                                 decimal_places=2,
                                 blank=True)
    # 分类
    btype = models.CharField(default='小说', max_length=20)

    objects = BookInfoManager()

    def __str__(self):
        return self.bname + ':' + self.btype

    class Meta():
        db_table = 'book_info'


# 书评论模型类
class CommentInfo(models.Model):
    '''书评论模型类'''
    # 评论
    ccomment = models.CharField(max_length=100)
    # 评级
    cstar = models.IntegerField(null=True)
    # 用户 id
    cuser = models.ForeignKey('UserInfo', on_delete=models.CASCADE)
    # 书 id
    cbook = models.ForeignKey('BookInfo', on_delete=models.CASCADE)

    objects = CommentInfoManager()

    def __str__(self):
        return self.cuser + ':' + self.cstar

    class Meta():
        db_table = 'comment_info'
