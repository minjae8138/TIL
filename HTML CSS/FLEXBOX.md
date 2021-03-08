# FLEXBOX



특징

- 자식 엘리먼트에는 어떤 것도 적지 않는다(부모 엘리먼트만 명시)

  - ```html
    <style>
        body{
            display : flex ;
        }
        div{
            width: 300px;
            height: 300px
        }
    </style>
    
    <body>
        <div></div>
        <div></div>
        <div></div>
    </body>
    ```

    div 태그에 대해 flexbox를 적용하고 싶을 때는 부모 엘리먼트인 body에 적용시키면 된다.

- 주축(main axis) - 수평(->default)
  교차축(cross axis) - 수직(->default)

  - 속성에 따라 축의 방향이 다름(default 방향 변경 가능)

    - `justify-content` -> main axis 에서 움직임
    - `align-items` -> cross axis 에서 움직임

  - `flex-direction` 을 통해 축을 변경할 수 있다.

    ```css
     body{
            display : flex ;
         	justify-content: space-between;
         	flex-direction: column;
         	align-itemsL center;
        }
        div{
            width: 300px;
            height: 300px
            background-color: blue;
        }
    ```

    `justify-content`는 위에 언급한 것처럼 default가 row(수평)이지만,
    `flex-direction: column`를 통해 column(수직) 방향으로 바꿀 수 있다.