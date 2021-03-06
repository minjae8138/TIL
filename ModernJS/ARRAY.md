# ARRAY



### #4.0 Array.from() and Array.of()



##### `Array.of ()` : 어떤 것을 array로 만들고자 할 때 사용

```javascript
const friends = Array.of("one","two",3, true)
console.log(friends)

// ["one","two",3, true]
```



##### `Array.from()` : array-like-object를 array로 변환

<HTML 일부코드>

```html
 <body>
    <button class="btn">1</button>
    <button class="btn">2</button>
    <button class="btn">3</button>
    <button class="btn">4</button>
    <button class="btn">5</button>
    <button class="btn">6</button>
    <button class="btn">7</button>
    <button class="btn">8</button>
    <button class="btn">9</button>
    <button class="btn">10</button>
    <script src="app.js"></script>
  </body>
```

<JS 코드>

array-like-object 다루기

```javascript
// --------------- case1
const btn = document.getElementsByClassName("btn");
console.log(btn)
// 결과값 : HTMLCollection(10) [button.btn, button.btn, button.btn, button.btn, button.btn, button.btn, button.btn, button.btn, button.btn, button.btn]
// 얼핏 array 같지만, HTMLColection 형태

// ---------------- case2
const btn = document.querySelectorAll("button");
console.log(btn)
// 결과값 : NodeList(10) [button.btn, button.btn, button.btn, button.btn, button.btn, button.btn, button.btn, button.btn, button.btn, button.btn]
// 마찬가지로 NodeList 형식(많이 보이는 타입임)

Array.from(btn).forEach(btn => {
    btn.addEventListener("click",()=> console.log("good!!!"))
})
// 이처럼 Array.from(btn)을 통해 btn을 array 문법으로 처리할 수 있다
```



### #4.1 Array.find() and Array.findIndex() and Array.fill()



##### `Array.find()` : 조건에 맞는 값을 찾을 때 사용

```javascript
const emails = [
    "abc@naver.com",
    "def@gmail.com",
    "ghi@daum.net",
    "jkl@hanmail.com"
]

const target = emails.find(email = > email.includes("ab"));
console.log(target)
// abc@naver.com

const target = emails.find(email => true);
console.log(target);
// abc@naver.com
```



##### `Array.findIndex()` : 특정 인덱스 위치를 찾을 때 사용

```javascript
const emails = [
    "abc@naver.com",
    "def@gmail.com",
    "ghi@daum.net",
    "jkl@hanmail.com"
];

const target = emails.findIndex(email = > email.includes("ef))
console.log(target)
// 1  (def@gmail.com이 1번째 인덱스이기 때문)

```



##### `Array.fill()` :  array를 가져와서 주어진 value로 채우는 것

`Array.fill(value, start, end)` -> start, end는 상황에 따라 생략가능

```javascript
const emails = [
    "abc@naver.com",
    "def@gmail.com",
    "ghi@daum.net",
    "xxx@hanmail.com"
];

const check = () => emails.findIndex(email => email.includes("ef"))

let target = check();

if (target !== -1){
    emails.fill("*".repeat(5), target);
}

console.log(emails);

// 3번째 인덱스인 "xxx@hanmail.com"이 *****로 바뀌어 출력

```

