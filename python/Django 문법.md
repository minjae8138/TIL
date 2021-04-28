```
# user_id = UserTb.objects.get(user_id=request.session['user_id'])
# print(user_id)
# # BookTb로부터 로그인된 user_id에 해당하는 Book정보를 가져온다
# book_info = BookTb.objects.values_list().filter(user=user_id) # multiple_value를 가져오고 slicing을 위해 values_list()를 사용
# # print("book_info-----------",book_info)
# n_len = len(book_info)
#
# # ContentTb의 text만 추출하기 위해  여기선 values로 받아왔음
# contents = ContentTb.objects.values().filter(book = book_info[n_len-1][0])
# books = BookTb.objects.all()
# context = {'contents': contents,
#            'books': books}
# return render(request, 'page2.html', context)
```

values()  vs values_list()

getlist

filter

request.session으로 db 데이터 가져오기