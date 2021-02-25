### Fetch `vs` Axios

axios는 fetch 위에 있는 작은 layer라고 생각하면 된다.

axios 설치방법 : npm i axios



### async await(비동기 처리)

**동기 `VS` 비동기**
동기 : 요청을 보낸 후 해당 응답을 받아야 다음 동작을 실행(ex.은행)
비동기 : 요청을 보낸 후 응답에 관계 없이 다음 동작을 실행(ex.카페)

자바스크립트는 연산이 끝날 때까지 코드의 실행을 멈추지 않음                                            순차적으로 다음 코드를 먼저 실행

클라이언트에서 서버로 데이터를 요청했을 때, 언제 응답이 올 줄 모르기 때문에 필요한 것이 비동기 처리

```react
componentDidMount(){
    const movies= axios.get("https://yts-proxy.now.sh/list_movies.json")
}
```

-> axios.get은 완료까지 시간이 필요, axios는 기본적으로 느림

따라서 아래와 같은 처리가 필요(비동기 처리)

```
getMovies = async() =>{
    const movies= await axios.get("https://yts-proxy.now.sh/list_movies.json")
  }

  componentDidMount() {
    this.getMovies();
  }
```

-> 비동기 처리 (axios.get은 시간이 걸리니 javascript야 기다려줘)

