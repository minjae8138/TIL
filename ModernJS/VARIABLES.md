# VARIABLES



### #1.0 let and const

기존의 var는 임의로 변수를 바꿀 수 있기 때문에 긴 코드를 다루거나 다른 사람과 협업할 때 변수가 겹친다면 에러가 발생할 수 있다

```javascript
var name = "kim"
...
...
...
var name = "lee"
```

위의  간단한 코드예시를 보도 기존의 name이 쉽게 바뀐 것을 알 수 있다. 이러면 앞에 사용된 수 많은 name 관련 코드들의 내용이 달라져서 에러가 날 수 있음



const는 변하지 않는 상수를 의미, 절대 바뀌지 않을 값에 대해 const 사용

let은 변하는 값일 경우에 let을 사용

평소에는 const를 사용하고 필요할 경우만 let으로 사용하는 습관을 가지자!!

다만!! const를 사용하더라도, 그 내부의 값은 수정될 수 있으니 주의해야 한다

(이를 방지할 수 있는 코딩도 가능함)

```javascript
const person = {
	name : "kim"
};

// person = "mike"  --> 에러
person.name = "mike" // --> 가능
```



### #1.1 Dead Zone

var를 사용할 때 나타나는 또 다른 문제점은 hoisting(호이스팅)에 의해 에러 나야 하는 구문이 에러가 나지 않는 다는 것이다.

`hoisting : 자바스크립트가 프로그램을 실행하기 전에 이것들을 어딘가로 이동시키는 것`

즉, 변수들은 프로그램 시작 전 무조건 위로 올라가게끔 설정된 것이라고 보면 된다 

이후에 브라우저에 실행되기에 무조건 위에서 아래로의 실행순이라고 할 순 없는 이유!!

반면, let과 const를 통해 분류해서 사용하면 이러한 문제가 해결된다

```javascript
console.log(hello)
var hello = "hello"
// 원래라면 에러가 나야하지만, 자바스크립트 hosisting에 의해 var를 위로 올려준다

var hello;
console.log(hello);
hello = "hello";
// 이런 식으로 javascript가 내부적으로 코드를 바꾸기에 에러가 나는 것이 아닌
// undefined라고 나올 뿐이어서 긴 코드 속 오류를 찾기 어려움
```

```javascript
console.log(hello)
let hello = "hello"
// 에러 발생
// let을 사용하면 자바스크립트는 hoisting하지 않음 -> dead
// 단, let이 hoisting 자체가 되지 않는 것은 아니고 초기화를 하면 hoisted 된다!!
```

--> temporal dead zone(TDZ) : 위의 예시처럼 초기화되지 않은 변수가 있는 곳

let을 사용하여 TDZ에 있더라도, 초기화를 하는 순간 TDZ에서 나와 사용할 수 있음

즉, TDZ에 있는지 아닌지를 알려줘서 let 을 사용하는 것이 유용함



### #1.2 Block Scope

var와 const와 let의 또 다른 차이는  scope(유효 범위)이다

`scope : 버블이 variable들이 접근가능한지 아닌지를 감지`

var -> function scope (함수 단위)

let, const -> block scope (대괄호 단위({}) )

```javascript
if (true) {
	const hello = "hello";
}
console.log(hello)

// 에러, hello is not defined
// block scope
```

--> 이것이 block scope이다. 블록{} 밖에서는 hello가 정의되지 않았기에 이런 에러가 발생

{} 안에 const나 let이 사용되면 그 안에서만 정의되고 사용할 수 있음

더 큰 범위에서 사용x, block 안에서 보호받을 수 있음

```javascript
if (true) {
	var hello = "hello";
}
console.log(hello)

// hello

function x(){
    var hello = "hello";
}
console.log(hello)

// 에러, hello is not defined
// function scope
```

--> 이것이 function scope를 갖는 var의 모습

function 안에서는 제한할 수 있지만,  if, try, catch, for 등등 많은 곳에서 문제가 생길 수 있음



