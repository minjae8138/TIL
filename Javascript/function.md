##### `ClassName`,`classList` 

- className으로 해당 객체의 클래스를 가져올 수 있음
  하지만 className은 하나의 클래스일때만 적용가능
- 여러 개의 클래스에 접근할 때는 classList 활용하기
  속성에는 add, remove, contains 등이 있음
  -->toggle이 유용함(add와 remove 한 번에 처리)

##### `window.innerwidth` : 브라우저 창의 크기

##### `body.style.backgroundcolor` : 배경의 색깔



### 형변환

##### `JSON.stringify()` : object -> json

##### `JSON.parse()`  :  json -> object

##### `parseint()` : int로 형변환

##### `parseFloat()` : float로 형변환



##### `for each` : array에 담겨있는 것들 각각에 한번식 함수를 실행시키는 함수

활용예시

```html
<div class="button">
          <button class="numbers" value="7">7</button>
          <button class="numbers" value="8">8</button>
          <button class="numbers" value="9">9</button>
          <button class="operator" value="+">+</button>
        </div>
        <div class="button">
          <button class="numbers" value="4">4</button>
          <button class="numbers" value="5">5</button>
          <button class="numbers" value="6">6</button>
          <button class="operator" value="-">-</button>
        </div>
        <div class="button">
          <button class="numbers" value="1">1</button>
          <button class="numbers" value="2">2</button>
          <button class="numbers" value="3">3</button>
          <button class="operator" value="*">*</button>
        </div>
```

```javascript
const numbers = main.querySelectorAll(".numbers")

function paintNum(event) {
    const numberBtn = event.target;
    const numberValue = numberBtn.value;
    number = `${number}${numberValue}`
    result.innerText = number
    currentValue = parseInt(number);
}

numbers.forEach(function (numberBtn) {
    numberBtn.addEventListener("click", paintNum);
});
```

html 코드를 보면 numbers라는 class에 여러 개의 값(숫자)이 들어있음을 알 수 있다.

이를 control하기 위해 queryselectAll로 불러온 후 각각의 객체에 대해 이벤트를 적용하기 위해서 사용하는 것이 forEach 메서드이다.

`numbers.forEach(function (numberBtn) {
    numberBtn.addEventListener("click", paintNum);
});`

numbers에 있는 각각의 버튼들에 대해 클릭을 하면 paintNum이라는 함수를 각각 작동한다.

##### `filter` :  각각의 item마다 실행시키는 함수값이 true인 item들만 필터링해서

##### 										새로운 array를 만듦

##### `Array.from()` : 유사배열객체를 array로 변환시켜서 array 관련 메서드를 적용할 수 있게 만들어준다.

활용예시

```javascript
const numbers = main.querySelectorAll(".numbers")
// 다음은 위의 forEach 메서드를 설명하는 예시에서 나온 코드이다.
//console.log(numbers)를 실행해보면 nodeList를 반환한다.
// 반면  Array.from()을 활용하면
const numbers = Array.from(main.querySelectorAll(".numbers"))
// console.log(numbers)를 실행했을때 array가 반환됨을 알 수 있다.
// 즉, array 관련 메서드를 활용해 접근할 수 있다.
```

참조사이트 : https://developer.mozilla.org/ko/docs/Web/API/NodeList#%EB%A9%94%EC%84%9C%EB%93%9Cmethods



##### `switch case 구문 ` : if else 구문과 비슷하지만, 조건식이 대신 값이 들어간다는 차이점이 있다.

활용예시

```javascript
switch (currentOperation) {
    case "+":
      return intValueA + intValueB;
    case "-":
      return intValueA - intValueB;
    case "/":
      return intValueA / intValueB;
    case "*":
      return intValueA * intValueB;
    default:
      return;
  }
```

위 코드는 미니프로젝트로 진행한 계산기 코드의 일부이다.
각각의 연산기호에 따라 다른 값을 리턴하는 함수안에 들어간 `switch case 구문`!!



### Array 관련 함수들



#### Array 메서드

##### `Array.from()`

- 위에서 언급한 메서드

- 유사 배열 혹은 반복간으한 객체로부터 새로운 array 인스턴스를 만든다

  ```js
  function f(){
      const args = Array.from(arguments);
      console.log(args);
  }
  f(1,2,3); // [1,2,3]
  ```

##### `Array.isArray()`

- 인자로 전달받은 객체가 배열이면 true, 그렇지 않으면 false를 리턴하여 해당 객체가 배열인지 아닌지 확인하는 메서드

  ```js
  Array.isArray([1,2,3]); // true
  Array.isArray({foo:123}); // false
  Array.isArray('foobar'); // false
  ```



#### push, pop, shift, unshift - 원본 배열을 수정하는 메서드

```javascript
let arr = [1,2,3];

// 배열의 마지막 요소 제거, 제거된 요소 리턴
arr.pop(); // 3   --> 파이썬과 달리 제거 순서를 설정할 수 없음(무조건 마지막 요소 제거)

// 배열 마지막에 요소 추가, 배열의 크기 리턴
arr.push("new");  //3
console.log(arr); // [1,2,'new']

// 배열의 첫번째 요소 제거, 제거된 요소 리턴
arr.shift(); // 1

// 배열의 처음에 요소 추가, 배열의 크기 리턴
arr.unshift("new"); //3
console.log(arr); // ['new',2,'new']
```



#### splice - 배열 요소 추가 삭제

```javascript
arr.splice(start, deletecount, el);

let arr = [1,5,7];
arr.splice(1,0,2,3,4); // [], arr: [1,2,3,4,5,7]
arr.splice(1,2); // [2,3], arr: [1,4,5,7]
```



#### reverse - 배열 요소 순서 반전

```js
let arr = [1,3,5,7];
arr.reverse(); // [7,5,3,1]
```

#### sort - 배열 요소 정렬

```js
// 잘못된 정렬 예
let arr = [11,1,115,42,12];
arr.sort();  // [1,11,115,12,42]
// 내부적으로 숫자를 문자열로 변환 후 값을 비교하기 때문에 이러한 결과가 나옴

// 대부분 sort함수의 인자값으로 비교 함수를 전달하여 정렬함
let arr = [11,1,115,42,12];
arr.sort(function(a,b){
    return a-b;
})
// [1,11,12,42,115]
// a-b의 결과값이 0보다 작으면 a를 낮은 색인으로 보내고
// 결과값이 0이면 그대로, 0보다 크면 b를 낮은 색인으로 보낸다
```

