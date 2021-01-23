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



