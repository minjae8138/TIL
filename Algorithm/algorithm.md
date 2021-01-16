# algorithm

알고리즘에 대해 공부하면서 알게 된 내용 정리

### itertools의 product

평소 순열, 조합 문제를 풀 때 itertools의 combination, permutation을 많이 사용했지만,

product 함수는 처음 알게 되었다.

여러 개의 리스트에 대한 조합을 구할 때 유용한 함수다.

```python
from itertools import product
s=[ [ 'a', 'b', 'c'], ['d'], ['e', 'f'] ]
# >>> 이처럼 여러 개의 리스트에 대한 조합을 구하고자 할 때 product를 사용할 수 있다.
product_s = list(product(*s))
print(product_s)
# 결과값 >>> [('a', 'd', 'e'), ('a', 'd', 'f'), ('b', 'd', 'e'), ('b', 'd', 'f'), ('c', 'd', 'e'), ('c', 'd', 'f')]

# list(product(*s)) 대신 중첩 for문을 사용해도 된다
arr1 = ['a','b','c']
arr2 = ['d']
arr3 = ['e','f']
for_s = [[i,j,k] for i in arr1 for j in arr2 for k in arr3]
# 결과값 >>> [('a', 'd', 'e'), ('a', 'd', 'f'), ('b', 'd', 'e'), ('b', 'd', 'f'), ('c', 'd', 'e'), ('c', 'd', 'f')]
```

처음 여러 개의 리스트에 대한 조합을 구하려고 할 때는 생각이 안났는데 product의 로직을 보니 간단하게 중첩for문을 통해서도 해결할 수 있다는 것을 알게 되었다. for loof 만세!!

단, product에는 치명적 단점이 있다. 위에 나온것처럼 중첩for문으로 이루어진 로직이기에 시간복잡도에서 취약하다. 그래서 평소 알고리즘 문제에서는 product를 쓸 일이 거의 없을거라고 생각한다. 하지만 알아두면 언젠가는 써먹을 수 있을거 같다.



### SQL에서의 rows 구문과 누적집계

우연히 접한 SQL 알고리즘 문제에서 이동평균을 구하는 문제를 보고 당황해서 찾아보다가 알게 된 내용들이다.

다음의 코드들에 대해 리뷰하며 설명하겠다.

```sql
SELECT
  Year, amount,
  --- Calculate the 3-year moving average of medals earned
  AVG(amount) OVER
    (ORDER BY user_id ASC
     ROWS BETWEEN
     2 PRECEDING AND CURRENT ROW) AS Medals_MA
FROM Russian_Medals

```

##### 첫 번째, 누적집계

`집계함수() over(order by 컬럼명) ` -> 이렇게 작성하면 해당 컬럼에 대한 오름차순으로 누적집계가 이루어진다.

`avg(amount) over(order by user_id)` 

이런 식으로 id순으로 amount의 누적평균을 구할 수 있다.

##### 두 번째, rows 구문(이동 평균 구할 때 유용)

`rows 행 and 행` -> 두 행 사이의 행들을 선택

이렇게만 하는 무슨 말인지 이해하기 힘들 것이다. 위 코드를 예로 들면,

```sql
SELECT
  Year, amount,
  AVG(amount) OVER
    (ORDER BY user_id ASC
     ROWS BETWEEN
     2 PRECEDING AND CURRENT ROW) AS Medals_MA
     -- 여기서 preceding은 이전 행을 의미한다. 즉, 2 preceding은 2번째 전의 행
     -- current row는 현재 형을 의미한다.
     -- 즉 현재형부터 2번째 전의 행을 선택한다는 코드
FROM Russian_Medals
```

위에 적은 것처럼 `rows 행 and 행`을 통해 원하는 구간을 선택할 수 있고 이를 누적평균과 합한다면, 3칸마다의 누적평균 즉 이동평균에 대한 값들을 구할 수 있다~!!

SQL은 오랜만에 봐서인지 코딩 자체가 너무 생소했고, 이런 식으로 나올 수도 있다는 것을 알게 되었다. 참고로 해커랭크를 통해 푼 문제이다. 프로그래머스의 SQL은 간단해서 따로 SQL 문제를 다루지 않았는데, 앞으로 해커랭크의 SQL 문제도 가끔씩은 풀어봐야겠다!!







