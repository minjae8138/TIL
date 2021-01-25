### `change` event

HTML tag중 select라는 것이 있다. 자주 쓰이는 tag임

##### 형식

```html
<label for="test">Label</label>
<select id="test">
  <option value="1">Option 1</option>
  <option value="2">Option 2</option>
</select>
```

![image-20210116231310282](C:\Users\82102\AppData\Roaming\Typora\typora-user-images\image-20210116231310282.png)

이때 javascript에서 select option의 value에 접근하기 위해서 event가 필요하다.

input과 change가 있는데 이번에는 change에 대해서만 정리한다.

change를 통해 select의 값이(option의 value)바뀔때마다 로컬스토리지에 저장할 수 있다.

즉 위의 Label에 해당하는 option의 선택에 따라 동적으로 로컬스토리지에 저장하기 위해 사용하는 것이다.



##### 예시>

--> html 코드

```html
<!-- html -->
<body>
    <h1>Where are you from?</h1>
    <select class = "country" name = "country">
      <option value="">--- Choose Your Country ---</option>
      <option value="korea">Korea</option>
      <option value="greece">Greece</option>
      <option value="turkey">Turkey</option>
      <option value="finaland">Finland</option>
    </select>
```

--> java script 코드

```javascript
// java script
const selectCountry = document.querySelector(".country");
function saveCountry() {
    localStorage.setItem("country", selectCountry.value)
}
selectCountry.addEventListener("change", saveCountry);
```

위와 같은 html에 select 구문이 작성되었을 때,

`element.addEventListener("change",function)` 구문을 활용해 이벤트를 발생시킬 수 있다.