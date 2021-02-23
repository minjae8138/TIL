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



### map

array의 각 item에 function을 적용하고 각 itme들의 array를 반환

```javascript
friends = ["dal","mark","lynn","tina"]
// map   function(current) 대신 current => 로 대체가능
friends.map(function(current){	
    return current
})
// 0 : "dal"
// 1 : "mark"
// 2 : "lynn"
// 3 : "tina"

friends.map(friends => {
    return friends + "❤"
})
// -> 각 이름뒤에 하트가 붙는다
```



### PropTypes

전달받은 props가 내가 원하는 props인지 확인해줌(에러 찾기에 용이함) 

```javascript
import PropTypes from "prop-types";

Food.propTypes = {
  name: PropTypes.string.isRequired, 	// name이 문자 & not null
  picture: PropTypes.string.isRequired, // picture이 문자 & not null
  rating: PropTypes.number.isRequired 	// rating이 숫자 & not null
}
```



### state(=class component)

동적 데이터를 처리하기 위해 필요한 것이 state

props는 활용할 수 없음

##### App이라는 class component 생성

```react
class App extends React.Component{
    render(){
        return <h1>Im a Class Component</h1>		
    }
}
```

return이 아닌 render 사용 -> react component에서 확장(extends)했기 때문에 render method를 내장하고 있기 때문

##### class component `vs` function component

function component는 무언가를 return하고 screen에 표시                                          class component는 react component로부터 확장되고 screen에 표시

즉, react는 **자동**으로 class component의 render method를 실행

```react
class App extends React.Component {
  state = {
    count: 0
  };
  add = () => {
    console.log("add")
  };
  minus = () => {
    console.log("minus")
  };
  render() {
    return (
      <div>
        <h1>The number is: {this.state.count}</h1>
        <button onClick={this.add}>Add</button>
        <button onClick={this.minus}>Minus</button>
      </div>
    );
  }
}
```

위에서 말했듯이 state는 동적데이터를 처리할 수 있음

state 안에 바꾸고 싶은 data를 넣으면 된다



state의 상태를 변경하려면 매번 render function을 호출해서 바꿔야한다.

```react
class App extends React.Component {
  state = {
    count: 0
  };
  add = () => {
    this.setState({ count: this.state.count + 1 });
  };
  minus = () => {
    this.setState({ count: this.state.count - 1 });
  };
  render() {
    return (
      <div>
        <h1>The number is: {this.state.count}</h1>
        <button onClick={this.add}>Add</button>
        <button onClick={this.minus}>Minus</button>
      </div>
    );
  }
}

export default App;

```



### 현재 state의 current 사용법

위 코드에서 this.state.count 부분을 수정했다

```react
class App extends React.Component {
  state = {
    count: 0
  };
  add = () => {
    this.setState({ count: this.state.count + 1 });
  };
  minus = () => {
    this.setState({ count: this.state.count - 1 });
  };
  render() {
    return (
      <div>
        <h1>The number is: {this.state.count}</h1>
        <button onClick={this.add}>Add</button>
        <button onClick={this.minus}>Minus</button>
      </div>
    );
  }
}

export default App;

```

이렇게 수정하면 state를 set할 때, 외부의 상태에 의존하지 않고 처리할 수 있음

