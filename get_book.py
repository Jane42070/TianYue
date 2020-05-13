#!/usr/local/bin/python3.8
# -*- coding: utf-8 -*-
'''规范 bname, bout, bauthor, bdate, bpic, bintro, bcontent, bprice'''
import requests
import lxml
from lxml import etree
import time
import random


def spawn_book(bid):
    '''产生书'''
    a1 = (1976, 1, 1, 0, 0, 0, 0, 0, 0)
    a2 = (2017, 12, 31, 23, 59, 59, 0, 0, 0)

    start = time.mktime(a1)
    end = time.mktime(a2)

    t = random.randint(start, end)
    date_touple = time.localtime(t)
    bdate = time.strftime("%Y-%m-%d", date_touple)

    url = f'http://www.ireader.com/index.php?ca=bookdetail.index&bid={bid}'
    #  print(url)
    response = requests.get(url)
    if response.status_code == 200:
        context = lxml.etree.HTML(response.text)
        try:
            bname = context.xpath("//div[@class='bookname']/h2/a/text()")[0]
            #  stars = context.xpath("//div[@class='bookname']/span/text()")[0]
            b_info1 = context.xpath("//div[@class='bookinf01']/p/span/text()")
            bprice = context.xpath(
                "//div[@class='bookinf02']/div/p/i/text()")[0].split('：')[1]
            bintro = context.xpath(
                "//div[@class='bookinf03']/p/text()")[0].replace('\n',
                                                                 '').replace(
                                                                     ' ', '')
            bpic = context.xpath(f"//img[@alt='{bname}']/@src")[0]
            bauthor = b_info1[0].split('：')[1]
            bcontent = b_info1[1].split('：')[1]
            bout = b_info1[2].split('：')[1]
            bprice = int(''.join(list(filter(str.isdigit, bprice)))) / 10
            #  print('评分' + stars)
        except Exception:
            return 0
        return (bname, bout, bauthor, bdate, bpic, bintro, bcontent, bprice)
    else:
        return 0
