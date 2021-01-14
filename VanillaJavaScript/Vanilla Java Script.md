# Vanilla Java Script



### ES란?

##### ES (ECMA Script)는 specification(설명서)에 대한 업데이트라고 보면 된다.

es5,es6 등 es뒤에 붙은 숫자는 specification에 대한 버전을 나타낸다.



### Vanilla JS의 중요성

##### 바닐라 JS를 잘 이해하면 다른 프레임워크 활용에 좋음

바닐라JS는 브라우저에서 제공하는 java script 를 뜻한다. 즉, 어떤 라이브러리도 사용하지 않는 순수 JS다.

대부분은 어려운 바닐라JS를 모르고 다음 단계로 넘어간다. 하지만!! 진짜 JS를 잘 다루기 위해서는 react,node보다 바닐라JS를 잘 해야한다.

##### 예시>

포토샵을 잘한다고 사진을 잘 찍는 것이 아님. 좋은 사진을 위해서는 여러 편집 툴을

잘 활용하는 것도 좋지만, 사진을 잘 찍는 것이 가장 중요하다.

프론트 엔드의 프로그래밍 언어는 JS가 유일하다. 그렇기 때문에 바닐라JS를 제대로 익히면 다른 프레임워크나 라이브러리를 새로 익히는데 큰 어려움이 없고 큰 무기가 될 수 있다.



### 개발하면서 알게 된 내용들(~ing)



##### HTML 코드를 핸들링 할 때,

- `addEventListener("이벤트",함수)` -> 함수에 괄호가 없으면, 이벤트 실행시 함수가 호출되고 괄호가 있다면, 이벤트와 상관없이 즉각 호출됨
- window 함수
  - window창 전체에 대해 이벤트 수행
  - id나 tag에 대한 적용이 아니라 전체적으로 적용하고 싶을 때 활용

```javascript
// h1 tag의 내용을 수정하고 싶을 때
const H1 = document.querySelector("h1");
// 예를 들어, 텍스트 우클릭시 텍스트 내용을 변경하고 싶다고 가정하면
function handleRightClick(event){
    H1.innerHTML = "change";
}
//H1.addEventListener("contextmenu",handleRightClick); //H1 tag에 대해서만 적용
window.addEventListener("contextmenu",handleRightClick); //window 전체에 적용
```

- 한 변수에 비슷한 기능의 함수들 담기

  ```javascript
  //const colors = ["#1abc9c", "#3498db", "#9b59b6", "#f39c12", "#e74c3c"];
  const superEventHandler = {
    handleMouseOver: function () {
      h2.innerHTML = "The mouse is here!";
      h2.style.color = colors[0];
    },
    handleMouseLeave: function () {
      h2.innerHTML = "The mouse is gone";
      h2.style.color = colors[1];
    },
    handleResize: function () {
      h2.innerHTML = "You just resized!";
      h2.style.color = colors[2];
    }
  };
  ```

  - object 형식을 활용하여 위의 코드처럼 담을 수 있다.

  