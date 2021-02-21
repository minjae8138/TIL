## React

유저가 쓰는 모든 요소를 생성한다는 것

자바스크립트와 함게 그것을 만들고 html로 밀어넣는다

즉, elemnet를 넣는 역할

여기서 react가 널리 사용되는 이유

-> **react는 component를 사용해서 HTML처럼 작성하려는 경우에 필요**



소스코드에 처음부터 HTM L을 넣지 않고, HTML에서 HTML을 추가하거나 제거할 수 있음

작성한 component(html,css,js 코드 조각) 를 빈 html에 밀어넣는다

이게 가능한 이유는 virtual dom 때문

**componen :  html을 반환하는 함수** -> function과 application으로 이루어짐





javascript와 HTML 사이의 조합을 **jsx**라고 부른다

즉, **javascript 안의 HTML**을 뜻한다 -> component를 어떻게 생성하고 만드는지에 대한 것

jsx는 react에서만 사용하는 개념.

나머지는 기존 javascript 개념을 사용한다



아래코드는 jsx를 사용하기 위해서 필요한 commponent의 기본 형태이다

```react
import React from "react"
function App(){
	return(
        <>~~~</>
	)
}
export default App ;
```

이게 없으면 react는 jsx가 있는 component를 이해하지 못함



**react application은 한 번에 하나의 component만 rendering할 수 있음**

따라서 모든 것은 component는 application 안에 들어가야함

```react
import React from "react";
import ReactDOM from "react-dom";
import App from "./App"

ReactDOM.render(<App/>),document.gerElementById("potato")
```



**application 안에 여러 component를 넣을 수 있다**

Potato라는 새로운 컴포넌트와의 결합

```react
import React form "react"
import Potato from "./Potato"; // Potato는 또 다른 component

function App() {
  return (
      <div >
          <h1>hello</h1>
          <Potato/>
      </div>
  )
}

export default App;

```







