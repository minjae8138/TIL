# Pseudo Selectors

좀더 세부적으로 엘리먼트를 선택할 수 있다.


선택의 복잡한 과정을 pseudo selector로 가능함

```css
div:first-child {
background-color: tomato;
}

/* pseudo selector */
div:last-child {
background-color: teal;
}
```

id나 class를 따로 만드는것보다 이렇게 지정하는게 훨씬 좋은 방법이다.
css에서만 선택을 하면 되니까  html코드를 고칠 필요가 없기 때문!!

n번째 태그 수정하기 nth-child(n) 

```css
span:nth-child(2) {
background-color: teal;
}
span:nth-child(even) { //span의 짝수번째 엘리먼트 제어
background-color: teal;
}
```

even은 짝수! odd는 홀수!

```css
span:nth-child(5n + 1) {
background-color: silver;
}
```

이런 식으로 n을 사용할 수도 있다. 규칙적으로 제어할 때 매우 편리!



### 다양한 Pseudo Selectors

- "~"는 span이 p의 형제인데, 바로 뒤에 오지 않을 때 쓸 수 있다.
- Attribute selectors 특성 선택자
- 그냥 input과 required input이 있다면, input:required{}를 통해서, required input에만 속성을 적용시킬 수 있다.
-  input{} 을 통해, [input 이름]에 해당하는 input 속성을 따로 줄 수 있다.
- 여기서, input[placeholder="First name"]은 First name에만 속성을 주지만, input[placeholder~="name"]은 name이 들어가는 모든 input에 속성을 부여할 수 있다
-  "~="은 name을 포함하고 있다는 의미가 되는 것이다.
- a[href$=".org"] → "$="는 ".org"로 끝나는 모든 anchor를 선택할 수 있다.
  \- attribute selectors를 이용하면, class를 지정할 필요 없이 CSS만으로 각각의 속성을 부여해줄 수 있다.



### combinations



1) div에 속하는 모든 span을 찾아서 그것만 효과를 주는 방법

```css
div span {
text-decoration : underline;
}
```

이렇게하면 div밑에 있는 모든 span이 효과를 가진다.
직접적인 부모가 아니어도 밑에있는 것들을 모두 css가 찾는다.

2)  div 바로 아래의 span만 찾는 방법

```css
div > span {
text-decoration : underline;
}
```


이렇게하면 바로 밑!!! 을 찾게 되므로 바로 밑의 자식에 접근할 수 있다/



3) 형제에게 효과를 주는방법

```css
p + span {
	ccolor: black;
}
```

+를 사용하면 그 다음 엘리먼트에 접근할 수 있다.


※ > 를 사용하면 direct child를 찾고, + 를 사용하면 바로 코드상 밑에 있는 sibling을 찾게된다.

