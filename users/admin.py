from django.contrib import admin
from users.models import UserInfo, BookInfo, CommentInfo


# Register your models here.
class UserInfoAdmin(admin.ModelAdmin):
    list_display = [
        'id', 'uid', 'upassword', 'uname', 'ugender', 'udate', 'uemail'
    ]
    # 每页显示 10 条数据
    list_per_page = 20
    actions_on_top = True
    # 根据用户性别筛选，显示右侧过滤栏
    list_filter = ['ugender']


class BookInfoAdmin(admin.ModelAdmin):
    list_display = ['id', 'bname', 'bauthor', 'btype', 'bdate', 'bprice']
    list_per_page = 30
    actions_on_top = True
    list_filter = ['btype']


class CommentInfoAdmin(admin.ModelAdmin):
    list_display = ['id', 'cbook', 'cuser', 'cstar', 'ccomment']


# 注册模型类
admin.site.register(UserInfo, UserInfoAdmin)
admin.site.register(BookInfo, BookInfoAdmin)
admin.site.register(CommentInfo, CommentInfoAdmin)
