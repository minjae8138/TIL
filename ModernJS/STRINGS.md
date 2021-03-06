# STRINGS



### #3.0 template literal

자바스크립트에서 variable을 가진 문자열 쓰는 방법에 대한 개선



##### 백틱(`) 

``으로 문장을 감싸고 변수명은 ${}로 처리

```javascript
// 일반적인 코드
const sayHi = (aName = "kim") => "Hello" + aName + "Welcome!"
console.log(sayHi())

// 백틱(`)사용
const sayHi = (aName = "kim") => `Hello ${aName} Welcome!`
console.log(sayHi())
```



변수뿐 아니라 계산식이나 함수도 가능

```javascript
const add = (a,b) => a+b;
console.log(`hello how are you ${add(6,6)}`);

// 12
```



### #3.1 HTML Fragments part 1

template literal의 장점은 javascript 안에서 html을 쓸 수 있다는 것



일반적인 코드

```javascript
const wrapper = document.querySelector(".wrapper")

const addWelcome = () => {
    const div = document.createElement("div");
    const h1 = document.createElement("h1");
    h1.innerText = "Hello";
    div.append(h1);
    wrapper.append(div);
};

setTimeout(addWelcome, 5000);
```

하지만 HTML 요소가 많고 복잡해지면, 가독성이 안좋다



template literal 활용

``을 사용하면 줄 바꿈도 자동 인식

```javascript
const wrapper = document.querySelector(".wrapper")

const addWelcome = () => {
    const div = `
		<div class="hello">
			<h1 class="title">Hello</h1>
		</div>	
	`;
    wrapper.innerHTML = div;
};

setTimeout(addWelcome, 5000);

// 위 코드와 같은 겨로가
// className 등의 추가 요소를 넣었음에도 훨씬 간결하고 기존의 HTML코드를 가져와서 이해하기도 좋다
```



### #3.2 HTML Fragments part 2



일반 코드

```javascript
const wrapper = document.querySelector(".wrapper")

const friends = ["me","lyn", "dal", "mark"]

const ul = document.createElement("ul");
friends.forEach(friend => ul.append(`<li>${friend}</li>`));
wrapper.append(ul);
```



template literal 활용 코드

```javascript
const wrapper = document.querySelector(".wrapper")

const friends = ["me","lyn", "dal", "mark"]

const list = `
	<ul>
		${friends.map(friend => `<li>${friend}<li>`).join(" ")}
	</ul>
`;

wrapper.innerHTML = list;
```

array 형식이기에  ,(콤마)가 딸려와서 join을 통해 처리



### #3.3 Cloning Styled Components

styled components는 리액트를 위한 라이브러리 패킷으로

Javascript에서 CSS를 사용하고 HTML을 얻을 수 있다.



```javascript
const styled = (css) => console.log(css);

styled`border-radius: 10px;
color:blue`;

// styled()에서 ()를 빼도 동작함
```



```javascript
const styled = aElement => {
    const el = document.createElement(aElement);
    return args => {
        const styles = arg[0];
        el.style = styles;
        return el;	
    }
}

const title = styled("h1")`
	background-color: red;
	color: blue;
`;

const subtitle = styled("span")`
	color: green;
`

title.innerText = "We just cloned"
subtitle.innerText = "Styled Components"

document.body.append(title, subtitle);
```



### #3.4 More String Improvements



#### 4가지 String Method

#### - `string.includes`

```javascript
const isEmail = email => email.includes("@")

console.log(isEmail("abc@naver.com"))

// true
```

#### - `string.repeat` 

```javascript
const CC_NIMBER = "3030";

const displayName = `${"*".repeat(10)}${CC_NUMBER}`

console.log(displayName)

// **********3030
```

#### - `string.startsWith`

```javascript
const name = "Mr.Mike";

console.log(name.startsWith("Mr"))

// true
```

#### -`string.endsWith`

```javascript
const name = "Mr.Mike";

console.log(name.startsWith("Mike"))

// true
```
