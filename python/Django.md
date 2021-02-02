### Terminal 부분



##### 프로젝트 시작

`django-admin startproject`



##### 장고의 웹 서비스 실행을 위해서는 manage.py로 접근해야함

`dir/w`를 했을때 manage.py가 보여야한다

`cd ..` `cd 이동할폴더` 를 사용하여 이동한다.

##### 앱 생성

`python manage.py startapp ooo`

차트앱 생성(예시)

`python manage.py startapp chartApp`



##### 서버실행 명령어

`python manage.py runserver`

##### 서버종료 명령어

ctrl + c



##### static 위치 지정 - 각각의 app에 흩어져 있는 static file을 한 곳으로 모으는 작업

`python manage.py collectstatic`

##### orm을 통한 데이터베이스 관리를 위한 계정 생성 및 접근 - model 생성 후 admin 등록

```django
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser
```



