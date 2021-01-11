# OOP(Object-Oriented-Programming)

패키지(pakage) > 모듈(module) > 클래스(class) > 함수(function)



## class

- 함수의 모임

- 역할 : 여러개의 함수와 변수를 묶어서 객체를 생성할 수 있는 템플릿

- 구성 : 멤버 = 변수 + 메서드(함수) , 생성자(초기화)

- 형식

  ```python
  class <클래스명> :
      변수 - 자료저장
      초기화 - 객체생성시 호출되는 함수
      def 함수이름() - 자료처리
  ```

   

#### class의 특징 4가지

- 상속
- 다형성
- 은닉화
- 추상화



1. ##### 상속

   부모클래스에서 정의된 함수와 변수를 가져와서 사용할 수 있다.

   ```python
   # 상속을 활용한 코드
   # 상위클래스
   class Person(object) :
       def __init__(self,name,age,address):
           self.name = name
           self.age = age
           self.address = address
       def perInfo(self):
           return self.name + "\t" + str(self.age) + "\t" + self.address
   # 하위클래스 
   class StudentVO(Person) :
       def __init__(self,name,age,address,stuId):
           super().__init__(name,age,address) # 부모의 메모리 영역으로 보낸다
           self.stuId = stuId
       def stuInfo(self):
           return super().perInfo()+"\t"+self.stuId
   class TeacherVO(Person) :
       def __init__(self,name,age,address,subject):
           super().__init__(name,age,address)
           self.subject = subject
       def teaInfo(self):
           return super().perInfo()+"\t"+self.subject
   class ManagerVO(Person) :
       def __init__(self,name,age,address,dept):
           super().__init__(name,age,address)
           self.dept = dept
       def empInfo(self):
           return super().perInfo() + "\t"+ self.dept
   ```

   StudentVO, TeacherVO, MangerVO 클래스가 Person 클래스를 상속받는다.

   `super()__init__(부모클래스의 변수1,변수2...)` -> 부모클래스의 변수를 가져옴과 동시에

   메모리를 부모클래스로 할당할 수 있음(메모리 절약)



2. ##### 은닉(encapsulatino/information hiding)

   변수나 함수 앞에 __를 붙여서 은닉시킬 수 있다

   ```python
   # 은닉을 활용한 코드
   class HidingClass(object) :
       def __init__(self,name,dept,num):
           self.utype = self.__class__.__name__
           self.name = name
           self.dept = dept
           self.num = num
       def getDept(self):
           return self.__dept # dept 변수에 대한 정보은닉
       def __getInfo(self):
           return "__로 시작했기 때문에 해당 함수는 외부에서 접근 불가"
   ```

   ```python
   # 은닉코드에 접급하는 경우
   hiding = HidingClass("홍길동","교육팀",100)
   print(hiding.name) # 접근가능
   print(hiding.dept) # 접근불가
   print(hiding.num) # 접근가능
   print('call getDept ', hiding.getDept()) # 접근불가
   print('call __getInfo ', hiding.__getInfo()) # 접근불가
   
   ```



3. ##### 다형성

   상위 클래스에 정의된 함수를 하위클래스 해당 함수로 재정의(method overriding)

   > ```python
   > # 상속을 활용한 코드
   > class Person(object) :
   >     def __init__(self,name,age,address):
   >         self.name = name
   >         self.age = age
   >         self.address = address
   >     def perInfo(self):
   >         return self.name + "\t" + str(self.age) + "\t" + self.address
   > class StudentVO(Person) :
   >     def __init__(self,name,age,address,stuId):
   >         super().__init__(name,age,address) 
   >         self.stuId = stuId
   >     def stuInfo(self):
   >         return super().perInfo()+"\t"+self.stuId
   >     def perInfo(self): ## overriding 부분 - 위의 함수를 복사해서 함수명만 변경
   >         return super().perInfo() + "\t" + self.stuId
   > 
   > class TeacherVO(Person) :
   >     def __init__(self,name,age,address,subject):
   >         super().__init__(name,age,address)
   >         self.subject = subject
   >     def teaInfo(self):
   >         return super().perInfo()+"\t"+self.subject
   >     def perInfo(self): ## overriding
   >         return super().perInfo()+"\t"+self.subject
   > 
   > class ManagerVO(Person) :
   >     def __init__(self,name,age,address,dept):
   >         super().__init__(name,age,address)
   >         self.dept = dept
   >     def empInfo(self):
   >         return super().perInfo() + "\t"+ self.dept
   >     def perInfo(self): ## overriding
   >         return super().perInfo() + "\t"+ self.dept
   > ```

   

   

