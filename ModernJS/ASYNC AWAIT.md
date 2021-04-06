# ASYNC / AWAIT



### #9.0 Async Await

Async와 Await은 Promise의 업데이트이다.(보기 좋은 코드로)

앞서 배운 `then` `catch`는 구식방법 -> 반복이 많고 코드가 길어진다.

async/await은 Promise 밖에서 값을 가져올 수 있는 방법으로 코드를 간결하게 만든다

- then, then, then ... 의 chaining 형식을 피할 수 있음

await은 항상 async function 안에서만 사용할 수 있다



##### 기존방식

```javascript
const getMoviesPromise = () =>{
  fetch("https://yts.mx/api/v2/list_movies.json")
.then((response) => {
return response.json();
})
.then((potato) => console.log(potato))
}

getMoviesPromise();
```



##### Async / Await 방식

```javascript
const getMoviesAsync = async () =>{
  const response = await fetch("https://yts.mx/api/v2/list_movies.json")
  const json = await response.json();
  console.log(json);
}

getMoviesAsync();
```

두 개의 코드 모두 같은 json 형식의 데이터를 가져오지만, 코드 형태는 다른 것을 알 수 있다. 어느 것이 더 보기 좋은가?



### #9.1 try catch finally

javascript에도 try catch finally 구문이 추가되었음

async / await와 연계하여 사용가능



```javascript
const getMoviesAsync = async () =>{
  try{
    const response = await fetch("https://yts.mx/api/v2/list_movies.json")
  const json = await response.json();
  throw Error("Im hungry")
  } catch(e){
    console.log(`💥${e}`);
  } finally{
    console.log("We are done !!!")
  }
}

getMoviesAsync();
```



### #9.2 Parallel Async Await

Async(비동기) Parallel(병렬)

여러 개의 API를 병렬 형식으로 리턴하는 방법



```javascript
const getMoviesAsync = async () => {
  try {
  const [moviesResponse, upcomingResponse] = await Promise.all([
  fetch("https://yts.mx/api/v2/list_movies.json"),
  fetch("https://yts.mx/api/v2/movie_suggestions.json?movie_id=100"),
  ]);
  
  const [movies, upcoming] = await Promise.all([
  moviesResponse.json(),
  upcomingResponse.json(),
  ]);
      
  console.log(movies, upcoming);
  } catch (e) {
  console.log(e);
  } finally {
  console.log("we are done");
  }
  };
  
  getMoviesAsync();
```





