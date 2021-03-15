# Animation



Animation 응용 코드

```css
@keyframes hideSplash{
    from{
        opacity:1;
    }
    to{
        opacity:0;
        visibiliy:hidden;
    }
}

#splash-screen{
    ~~
    ~~
    animation: hidesplash 0.4s ease-in-out forwards
    animation-delay: 2s;
}
```

--> 첫 화면 접속시 #splash-screen에 해당하는 화면이 나오고 2.4초 뒤에 투명화 + 엘리먼트 없애기(숨김)

- forwards: keyframe의 마지막 속성 값 유지
- animation-delay 애니메이션이 작동되기까지 기다리게 하는 것
- visibility:hidden; 실제로 html을 없애는 건 아님. (js로 해야함)