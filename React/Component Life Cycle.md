# Component Life Cycle

react class component는 render 외에도 여러 함수를 내장하고 있다

이를 life cycle method라고 부르는데, 기본적으로 react가 component를 생성하고 삭제하는 방법이다

### life cycle mehod별 호출되는 함수

#### `Mounting`(component 생성)

- ##### constructor()

- ##### render()

- ##### componentDidMount()

#### `Updating`(state를 변경할 때)

- ##### render()

- ##### componentDidUpdate()

#### `Unmounting`(component가 떠날 때)

- ##### componentWillUnmount()



### life cycle method를 활용한 예제 세팅하기

```react
import React from 'react';

class App extends React.Component {
  state = {
    isLoading: true

  };
  componentDidMount() {
    setTimeout(() => {
      this.setState({ isLoading: false })
    }, 6000);
  }

  render() {
    const { isLoading } = this.state;
    return (
      <div>
        {isLoading ? "Loading..." : "We are ready"}
      </div>
    );
  }
}

export default App;
```

`componentDidMount`는 render 이후에 호출되는 함수임을 활용하여

6000밀리세컨드(6초) 후에 isLoading값을 false로 바꿔 "We are ready"라는 단어가 출력되게끔 만들었다