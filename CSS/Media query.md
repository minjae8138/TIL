# media query

화면 크기나 상태에 따라 제어할 수 있는 반응형 CSS 라이브러리



#### 스크린 크기 변화에 따른 배경색 변화

```css
@media screen  and (max-width: 1200px) {
    background-color : red;
}
```

-->  화면 사이즈가 1200 이하 일때 배경색을 빨강색으로 한다는 코드



#### 핸드폰 가로모드, 세로모드 제어

```css
@media screen  and (max-width: 1200px) and (orientation:landscape) {
    background-color : red;
}
```

--> 화면 사이즈가 1200이하이고 가로모드일 때 배경색을 빨강색으로

세로는 portrait



#### 특정 엘리먼트 접근

```html
-- html

<body>
    <div>
        blablabla
    </div>
</body>
```

```css
-- css

@media screen and (min-width: 600px) and (max-width: 1200px){
    div{
        display: none
    }
}
```

이러면 600~1200  사이에 있을땐 blabla라는 글이 보이지 않게 된다



이 밖에도 추가적인 기능들이 있다!!