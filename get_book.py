#!/usr/local/bin/python3.8
# -*- coding: utf-8 -*-
'''规范 bname, bout, bauthor, bdate, bpic, bintro, bcontent, bprice'''
from users.models import BookInfo
import requests
import lxml
import time
import random


def spawn_book():
    '''产生书'''
    a1 = (1976, 1, 1, 0, 0, 0, 0, 0, 0)
    a2 = (2017, 12, 31, 23, 59, 59, 0, 0, 0)

    start = time.mktime(a1)
    end = time.mktime(a2)

    t = random.randint(start, end)
    date_touple = time.localtime(t)
    bdate = time.strftime("%Y-%m-%d", date_touple)

    url = 'http://www.ireader.com/index.php?ca=booksort.index'
    response = requests.get(url)

    if response.status_code == 200:
        # 字典存储类型数据 { '类型名': data-id }
        data_dict = {}
        context = lxml.etree.HTML(response.text)
        data_id = context.xpath(
            "//div[@class='difgenre']/div[@class='right']/ul/li/@data-id")
        data_id_name = context.xpath(
            "//div[@class='difgenre']/div[@class='right']/ul/li/a/text()")

        # data_id_name 得到的结果是 频道 + 类型 的分类，则需要 pop 掉频道的分类
        for i in range(len(data_id_name) - len(data_id)):
            data_id_name.pop(0)
        data_name_len = len(data_id_name)

        # 得到类型分类对应的 cid 号，以字典方式存储
        for i in range(data_name_len):
            data_dict.update({f'{data_id[i]}': data_id_name[i]})
        print(data_dict)

        # 通过 for 循环获取各个分类的页面
        for i in data_id:
            response = requests.get(
                f"http://www.ireader.com/index.php?ca=booksort.index&cid={i}")
            # 获取页面上的热门书籍
            context = lxml.etree.HTML(response.text)
            book_link = context.xpath("//ul[@class='newShow']/li/a/@href")
            btype = data_dict.get(i)
            print(f'正在爬取分类：{btype} 的热门书籍')

            # 循环获取各个分类页面的书籍信息
            for book_url in book_link:
                response = requests.get(book_url)
                book_context = lxml.etree.HTML(response.text)
                try:
                    bname = book_context.xpath(
                        "//div[@class='bookname']/h2/a/text()")[0]
                    b_info1 = book_context.xpath(
                        "//div[@class='bookinf01']/p/span/text()")
                    bprice_str = book_context.xpath(
                        "//div[@class='bookinf02']/div/p/i/text()")[0].split(
                            '：')[1]
                    bintro = book_context.xpath(
                        "//div[@class='bookinf03']/p/text()")[0].replace(
                            '\n', '').replace(' ', '')
                    bpic = book_context.xpath(f"//img[@alt='{bname}']/@src")[0]
                    bauthor = b_info1[0].split('：')[1]
                    bcontent = b_info1[1].split('：')[1]
                    bout = b_info1[2].split('：')[1]
                    bprice = float(''.join(
                        list(filter(str.isdigit, bprice_str)))) / 10
                    #  print('评分' + stars)
                except Exception:
                    print('获取出错')
                bookinfo = (bname, bout, bauthor, bdate, bpic, bintro,
                            bcontent, bprice, btype)
                print(bookinfo)
                BookInfo.objects.create_book_in_linear_list(bookinfo)
    else:
        return 0
