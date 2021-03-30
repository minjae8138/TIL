# PROMISES



### #8.0 Async

javascript는 동시에 여러 가지를 수행한다

규칙에 따라 순서대로 실행되지만, 앞에 코드가 실행되지 않았다고 뒤에 코드가 실행되지 않는 것이 아님.

비동기성(async) : 실행을 멈추지 않는다



fetch를 통해 API로부터 데이터를 가져온다

```javascript
const hello = fetch("http://google.com")
// 잘못된 코드 -> 에러

console.lgo("lala")
cossole.log(hello)

// 위에서 에러가 났지만, 끝까지 실행하고 돌아와서 에러가 났다고 말함
// lala는 출력됨
```



### #8.1 Creating Promises

Promise : 비동기 작업이 가져올 미래의 완료 혹은 실패하는 결과 값을 나타낸다.

Promise를 만들 때는 실행할 수 있는 function을 넣어야한다.

excutor

Promise의 핵심은 아직 모르는 value와 함께 작업이 가능하다는 것

```javascript

const a = new Promise((resolve, reject)=>{
  setTimeout(resolve,3000,"Yes you are")
})

console.log(a);

setInterval(console.log, 1000, a);

// 3초간 pending 형식의 promise가 출력
// 이후로는 1초 단위로 resolved(혹은 fullfilled) 형식의 promise 출력
```



### #8.2 Using Promises

**`then`**과 **`catch`**를 활용한다.

##### `then` : promise가 실행된 이후의 행동 명령

```javascript
const a = new Promise((resolve, reject)=>{
  setTimeout(resolve,3000,"Yes you are")
})

a.then(value=>console.log(value));
// value는 resolve로부터 값을 가져온다
// 여기선 Yes you are
```

##### `catch` : error catch

```javascript
const a = new Promise((resolve, reject)=>{
  setTimeout(reject,3000,"nope!!!")
})

a
.then(result=>console.log(result)) // promise가 resolve 되면 rusult 출력
.catch(error=>console.log(error)) // promise가 reject 되면 error 출력

// then과 catch는 순차적 실행이 아님
// then이 실행되면 catch는 실행x, 그 반대도 마찬가지
```



### #8.3 Chaining Promises

결과값이 여러 개 나와야 하는 등 경우에 따라 여러 개의 promise를 사용할 일이 있다.(예를 들어 API로부터 data를 받아오는 경우)

이 때 필요한 개념이 chaining promises다.

```javascript
const a = new Promise((resolve, reject)=>{
  resolve(2);
})

a
.then(number => {
    console.log(number*2)
})
.then(othernumber=>{
    console.log(othernumber*2)
})
```

 4, 8 이 나와야할 것 같지만 4, NaN이 출력된다

`console.log(othernumber)`를 찍어보면 undefined라고 나오는 것을 알 수 있다.

즉, othernumber가 제대로 인식이 안되기 때문이다.



이를 해결하기 위해서는 then에  **return 값**을 주어야 한다.

```javascript
const a = new Promise((resolve, reject)=>{ 
    resolve(2);
})

a.then(number => {
    console.log(number*2);
    return number * 2
})
.then(othernumber=>{
    console.log(othernumber*2)
})
```



chaing promise에도 catch 구문을 사용할 수 있다

```javascript
const a = new Promise((resolve, reject)=>{ 
  resolve(2);
})

const timesTwo = number => number*2; // return number*2

a
.then(timesTwo)
.then(timesTwo)
.then(timesTwo)
.then(timesTwo)
.then(timesTwo)
.then(()=>{
  throw Error("somthing is wrong")
})
.then(lastNumber => console.log(lastNumber))
.catch(error=>console.log(error));

// Error: something is wrong 출력
```



### #8.4 Promise.all

주어진 모든 Promise를 실행한 후 진행되는 하나의 Promise를 반환

여러 개의 Promise로부터 값을 가져와야할 때, 일일이 `then`을 사용하기 보단 `Promise.all`을 통해 한 번에 처리할 수 있다.



```javascript
const p1 = new Promise(resolve =>{
  setTimeout(resolve,3000,"First")
})

const p2 = new Promise((resolve,reject) =>{
  setTimeout(reject,3000,"Second")     // reject를 통해 error 발생
})

const p3 = new Promise(resolve =>{
  setTimeout(resolve,3000,"Third")
})

const motheroPromise = Promise.all([p1,p2,p3]); // p1,p2,p3 한번에 처리

motheroPromise
.then(values=>console.log(values))
.catch(error => console.log(error)); // catch 구문
```

--> second를 출력해서 p2에 에러가 발생함을 알 수 있다.

하나라도 에러가 나면, 다른 것도 실행이 안된다.

이처럼 여러 개를 한 번에 처리하면서 어디서 에러가 발생하는지를 알 수 있어서 유용함



### #8.5 Promise.race

`Promise.all`과 달리 하나라도 resolve되거나 reject되면 해당 Promise만 실행

가장 먼저 실행되는 것만 실행된다. 말그대로 Race!!



```javascript
const p1 = new Promise(resolve =>{
  setTimeout(resolve,5000,"First")
})

const p2 = new Promise((resolve,reject) =>{
  setTimeout(resolve,3000,"Second")
})

const p3 = new Promise(resolve =>{
  setTimeout(resolve,3000,"Third")
})

const motheroPromise = Promise.race([p1,p2,p3]);

motheroPromise
.then(values=>console.log(values))
.catch(error => console.log(error));

// Second 출력
```



### #8.6 finally

Promise가 완료 혹은 실패했을 때 실행할 구문을 명령

보통 API를 호출할 때 사용



```javascript
const p1 = new Promise((resolve,reject) =>{
  setTimeout(reject,3000,"First")
})

p1
.then(value=>console.log(value))
.catch(error =>console.log(`${error}💥`))
.finally(()=>console.log("Im done!!"))

// First💥
// Im done!!
```

resolve나 reject에 상관없이 마지막에 finally에 해당하는 부분을 수행



### #8.7 Real world Promises

Promise를 return하는 fetch  이용



```javascript
fetch("https://yts.mx/api/v2/list_movies.json")
.then((response) => {
	return response.json();
})
.then(json => console.log(json))
.catch((e) => console.log(`💨${e}`));
```





