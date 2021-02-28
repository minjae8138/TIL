## react-router-dom

- 네비게이션



설치 : npm install react-router-dom



router : url을 가져가 확인하고 어떤 컴포넌트를 가져올지 명령에 따라 실행하는 역할

react-router-dom : 다른 종류의 라우터들의 집합(BrowserRouter,HashRouter 등등)

* BrowserRouter가 url주소는 깔끔하게 나오지만, 깃헙 등등에 사용하기 까다로움
* HashRouter 고고



기본적인 Router 활용 코드

```react
function App() {
  return <HashRouter>
    <Navigation />
    <Route path="/" exact={true} component={Home} />
    <Route path="/about" component={About} />

  </HashRouter>
}
```

url 경로와 component를 설정해준다!



### `<Link to>` VS `<a href>`

`<a href></a>` 대신 `<Link to></Link>`를 활용할 수 있다

`<a href>`는 HTML이기에 항상 새로고침이 되어 react 작동을 무시한다

그렇기에 react를 작동시키고 싶을 때는 `<Link to>` 태그를 사용하면 된다 

* Link는 반드시 Router 안에서 실행시켜야한다
* 그렇지 않으면, 실행x

