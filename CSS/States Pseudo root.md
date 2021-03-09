# states / pseudo element / root



### States

state에는 hover : 마우스를 올려 놓을 때,
active : 클릭할 때,
focus : 키보드로 선택했을 때,
visited : 링크를 방문했을 때,
focus-within : focused인 자식을 가진 부모 엘리먼트의 상태
가 있다.



### pseudo element

실제 존재하는 element는 아니지만, 특정 요소의 부분을 꾸미게 해줌.
예시>
::placeholder
::selection
::first-letter



### :root

:root 요소에 --variable-name 의 형태로 생성

ㄴ변수형식 --()-() 공백x

```css
:root{
--main-color : #F2F3F4 ;
} 
```

css 에서 이런식으로 변수 설정 할수있음
다른 속성에서 var(--main-color) 로 사용 할수 있다.