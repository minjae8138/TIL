# FUNCTIONS



### #2.0 Arrow Functions

자바스크립트에서 함수의 모습을 개선한 것



##### 기존 코드와의 차이

기존방식1

```javascript
const names = ['kim','lee','park'];

function addHeart(item){
    return item + "❤";
}

const hearts = names.map(addHeart);

console.log(hearts)

// ['kim ❤', 'lee ❤', 'park ❤']
```



기존방식2

```javascript
const names = ['kim','lee','park'];

const hearts = names.map(function(item) {
	return item + "❤";
});

console.log(hearts)

// ['kim ❤', 'lee ❤', 'park ❤']
```



Arrow Functions

=>

```javascript
const names = ['kim','lee','park'];

const hearts = names.map(item => {
	return item + "❤";
});

console.log(hearts)

// ['kim ❤', 'lee ❤', 'park ❤']
```

이처럼 => (arrow)를 사용하여 가독성을 높였다



##### implicit return( beautiful javascript💥)

: 코드가 복잡하지 않을 때 간단하게 리턴하는 코딩 방식(함수나 다른 로직이 없을 경우 유용)

```javascript
const names = ['kim','lee','park'];

const hearts = names.map(item => item + "❤");

console.log(hearts)
```

implicit return 방식을 통해 {}와 =>를 지워서 훨씬 간결한 모습으로 코딩을 할 수 있다



### #2.1 'this' in Arrow Functions

arrow function을 사용하지 않아야 할 경우를 알아보자



대부분 arrow function을 사용할 수 있지만, 'this'를 사용할 때는 x

arrow function 안에 있는 this는 window를 참조하기 때문(자바스크립트 룰)



html로 버튼 태그를 생성했다고 가정하자

```javascript
const button = document.querySelector("button");

button.addEventListener("click",() => {
    console.log(this);
    this.style.backgroundColor = "red";
})

// 오류 발생
// this가 button html이 아닌 window를 가리키게 됨
// console.log(window)와 동일한 결과

const button = document.querySelector("button");

button.addEventListener("click",function() {
    console.log(this);
    this.style.backgroundColor = "red";
})

// 제대로 동작함!
```

this를 사용할 때는, arrow function 사용 x



##### 또 다른 예시코드

```javascript
// arrow function
const kim = {
    name: "kim",
    age:20,
    addYear:() => {
        this.age++;
    }
};

console.log(kim);
kim.addYear();
kim.addYear();
console.log(kim);

// age: 20
// age: 20
// addYear 함수 적용x, this를 arrow function내에 사용했기 때문


// 일반 function
const kim = {
    name: "kim",
    age:20,
    addYear(){
        this.age++;
    }
};

console.log(kim);
kim.addYear();
kim.addYear();
console.log(kim);

// age: 20
// age: 22
// addYear 함수가 잘 적용됨
```



### #2.2 Arrow Functions in the Real World

arrow function 연습



Array.prototype 관련 함수 활용

1. `Array.prototype.find() ` : 첫번째 엘리먼트 값을 리턴하는 함수

   ```javascript
   const emails = {
       "abc@naver.com",
       "abc@gmail.com",
       "abc@daum.net",
       "abc@hanmail.com"
   }
   
   const findMail = emails.find(itme => true);
   console.log(findMail)
   // abc@naver.com
   
   const findMail = emails.find(item => item.includes("@gmail"));
   console.log(findMail)
   // abc@gmail.com
   ```

2. `Array.prototype.filter() `: 함수의 조건을 만족하는 모든 엘리먼트 리턴하는 함수

   ```javascript
   const emails = {
       "abc@naver.com",
       "abc@gmail.com",
       "abc@daum.net",
       "abc@hanmail.com"
   }
   
   const noGmaill = emails.filter(item => !item.includes("@gmail"))
   console.log(noGmail);
   
   // ["abc@naver.com",  "abc@daum.net","abc@hanmail.com"]
   ```

3. `Array.prototype.forEach()` :  각 array의 엘리먼트 마다 주어진 함수를 실행

   ```javascript
   const emails = {
       "abc@naver.com",
       "abc@gmail.com",
       "abc@daum.net",
       "abc@hanmail.com"
   }
   
   emails.forEach(email => {
   	console.log(email.split("@")[0])
   })
   
   // abc
   // abc
   // abc
   // abc
   
   const cleand = emails.map(email => email.split("@")[0]);
   console.log(cleand)
   // 위와 같은 결과가 나옴
   ```

   

   ##### 값이 아닌 object 리턴하기

   ```javascript
   const emails = {
       "abc@naver.com",
       "abc@gmail.com",
       "abc@daum.net",
       "abc@hanmail.com"
   }
   
   // implicit return 형식
   const cleand = emails.map((email,index) => ({username: email.split("@")[0],index}));
   console.log(cleand)
   
   // ({}) 이런식으로 ()로 {}를 감싸주면 object도 implicit return 형식이 가능
   ```

   

### #2.3 Default Values

기본값 설정



 함수에 "kim"이라는 기본 이름값을 주어 값이 없이 호출할 경우 kim을 출력하게끔 구현한 코드

```javascript
const DEFAULT = "kim"

function sayHi(aName = DEFAULT){
    return "Hello" + aName 
}

// arrow function 형식
const sayHi((aName = DEFAULT) => "Hello" + aName);

console.log(sayHi())
// Hello kim

console.log(sayHi("lee"))
// Hello lee
```





