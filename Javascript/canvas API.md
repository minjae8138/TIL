### canvas API

JS와 HTML의 <canvas>를 통해 그래픽을 그리기 위한 수단을 제공한다



#### 선 그리기

- `beginPath()` --> 경로생성

- `moveTo(x,y)` --> 선 시작 좌표

- `lineTo(x,y)` --> 선 끝 좌표

- `stroke()` --> 선 그리기
- `strokeStyle` --> 선 색깔
- `lineWidth` --> 선 넓이



```javascript
const canvas = document.getElementById("jsCanvas")
const ctx = canvas.getContext("2d")

// 드로잉 픽셀사이즈에 대한 정의(캔버스 크기를 가져온다)
// 임의로 숫자값을 줘도 되지만, 캔버스 크기와 다르면 이상하게 그려짐
// 캔버스 크기가 500X500이면, 각각 500의 값을 주면 이상없지만 나중에 크기가 변한다면 오류가 생김, 아래처럼 크기자체를 가져오면 동적인 변화에도 오류없이 처리 가능
canvas.width = document.getElementsByClassName("canvas")[0].offsetWidth;
canvas.height = document.getElementsByClassName("canvas")[0].offsetHeight;

ctx.strokeStyle = "#2c2c2c";
ctx.lineWidth = 2.5;

let painting = false;

function onMouseMove(event){
    const x = event.offsetX
    const y = event.offsetY
    if (!painting){			// 선이 없을 경우
        ctx.beginPath() 	// 경로 생성
        ctx.moveTo(x,y)		// 시작 좌표 설정
    }else{					
        ctx.lineTo(x,y)		// 끝 좌표 설정
        ctx.stroke()		// 그리기
    }   
}

// canvas painting 제어에 대한 함수 정의

// 마우스 클릭시
function onMouseDown(event){
    painting=true;
}

// 마우스 클릭 후 뗏을때
function onMouseUp(event){
    painting=false;
}

// 마우스가 특정범위(여기선 canvas)를 벗어낫을 때
function onMouseLeave(event){
    painting = false;
}

if (canvas){
    addEventListener("mousemove",onMouseMove)
    addEventListener("mousedown",onMouseDown)
    addEventListener("mouseup",onMouseUp)
    addEventListener("mouseleave",onMouseLeave)
}
```



#### 화면 색 채우기

- fillStyle --> 면(배경) 색깔
- fillRect(x좌표, y좌표, 사각형너비, 사각형높이) --> 색이 채워진 직사각형 그리기

```javascript
const CANVAS_SIZE = 500;

function changeColor(event){
    const color = event.target.style.backgroundColor;
    ctx.strokeStyle = color;
    ctx.fillStyle = color;
}

function paintAll(event){
    if (filling){
        ctx.fillRect(0,0,CANVAS_SIZE,CANVAS_SIZE);
    }
}
```



#### 이미지 저장

- toDataURL

```javascript
function handleSave(event){
    const image = canvas.toDataURL("image/jpeg"); 	// png도 가능
    const link = document.createElement("a");		// anchor 태그 생성
    link.href = image ; 		// href로 주소를 설정해줘야 다운로드 가능
    link.download = "PaintJS" 	// 아무 이름이나 설정
    link.click();
}
```

