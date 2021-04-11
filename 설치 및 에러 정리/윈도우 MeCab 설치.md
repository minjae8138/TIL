# 윈도우 MeCab 설치



### 첫 번째 방법

[1. mecab-ko-msvc](https://github.com/Pusnow/mecab-ko-msvc/releases/tag/release-0.9.2-msvc-3) 

[2. mecab-ko-dic-msvc.zip](https://github.com/Pusnow/mecab-ko-dic-msvc/releases/tag/mecab-ko-dic-2.1.1-20180720-msvc-2)

-> 이 두가지 압축파일을 다운받는다

-> c드라이브에 mecab이라는 폴더를 생성 후 두 개의 압축파일을 mecab폴더에 푼다.



[3. wheel 파일](https://github.com/Pusnow/mecab-python-msvc/releases/tag/mecab_python-0.996_ko_0.9.2_msvc-2)

- 예시 - [mecab_python-0.996_ko_0.9.2_msvc-cp36-cp36m-win_amd64.whl](https://github.com/Pusnow/mecab-python-msvc/releases/download/mecab_python-0.996_ko_0.9.2_msvc-2/mecab_python-0.996_ko_0.9.2_msvc-cp36-cp36m-win_amd64.whl)
- 예시처럼 파이썬 버전에 맞는 휠 파일 설치(내 경우 myenv 파이썬 버전인 3.7로 설치)

anaconda prompt 실행

-> pip install python-0.996_ko_0.9.2_msvc-cp36-cp36m-win_amd64.whl



### 두 번째 방법



cmd/Terminal에서 

->pip install eunjeon

* visual studio builder ~~~~ 이런 식의 오류가 나면, 에러 창에 뜨는 사이트에 접속해서 빌더를 설치하면 된다



굉장히 쉬운 방법이지만, 내 경우 파이참에서는 위 방식으로 성공했으나 주피터 환경에서는 되지 않아서 첫 번째 방법을 통해 설치함 