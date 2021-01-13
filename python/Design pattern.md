# 디자인 패턴(design pattern) 정리



### Decorater Pattern

`함수의 인자로 다른 함수를 전달하는 과정에 적용하는 패턴(기능의 확장), @decorator `



아래 코드를 통해 데코레이터 패턴을 이해할 수 있다.

##### 문제

- typeChecker Decorator 만들기(인자의 유효성 검사)
- digit01, digit02 변수를 곱한값을 출력하는 함수 만들기
- typeChecker Decorator로 digit01, digit02가 정수가 아니라면 "only integer support" 출력

```python
def typeChecker(func) :
    def innerFunc(digit01,digit02) :
        # 유효성검사
        if type(digit01) != int or type(digit02) != int :
            print("only integer support")
            return
        return func(digit01,digit02)
    return innerFunc

# 사용
@ typeChecker
def div(digit01,digit02) :
    return digit01*digit02
msg = div(0.2,1)
print(msg)
```

#####  코드에 대한 설명

- 함수 typeChecker 내에 중첩함수 innerFunc를 만들어 유효성검사를 통해 값을 출력하는 코드를 작성 

- digit01, digit02를 곱하여 반환하는 div 함수를 만든다
- @typeChecker를 통해 div함수를 typeChecker( func)의 func으로 전달(기능의 확장)



##### 피라미터와 관계없이 모든 함수에 적용 가능한 decorator를 만들고 싶다면?

- 가변인자 - *args, **args를 활용한다
- 형식
  - `def 함수(*args, **kargs) :` -> 일반적인 형식(모든 변수를 받는 코드)
- 기본문법에서는 *면 튜플형식, **이면 딕셔너리 형식을 받아온다.



<예제1>

```python
def generalDeco(func) :
    def wrapper(*args, **kargs) : # 일반적인 제러레이터 형식(모든 변수를 받음)
        print('this is decorated')
        return func(*args,**kargs)
    return wrapper
@generalDeco
def userSquare(digit) :
    return digit * digit
print(userSquare(2))

@generalDeco
def userPlus(digit01, digit02) :
    return digit01 * digit02
print(userPlus(2,3))

@generalDeco
def userQuad(digit01, digit02, digit03, digit04) :
    return digit01 * digit02 * digit03 * digit04
print(userQuad(2,3,4,5))
```

각각의 인자수가 다른 함수들을 decorator를 통해 일괄적으로 처리하여 출력할 수 있다.



<예제2>

```python
def makeBold(func) :
    def wrapper(string) :
        return '<b>' + func(string) + '</b>'
    return wrapper

def makeFont(func) :
    def wrapper(string) :
        return '<i>' + func(string) + '</i>'
    return wrapper

@makeBold
@makeFont
def makeBoldFont(string) :
    return string

print(makeBoldFont('두개의 데코레이터를 활용하고 있습니다~~'))
```

```html
출력결과 : <b><i>두개의 데코레이터를 활용하고 있습니다~~</i></b>

위 출력결과처럼 가장 가까이에 있는 함수가 먼저 적용된다.
decorator순서를 @makeBold, @makeFont 로 해서 i tag가 먼저 적용되고 그 다음에 b tag가 적용된 것을 알 수 있다.

만약 @makeFont -> @makeBole 순으로 작성하였다면, 출력결과는 다음과 같을 것이다.
<i><b>두개의 데코레이터를 활용하고 있습니다~~</b></i>
```





