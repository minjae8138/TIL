# Jupter 가상환경 만들기

##### conda create -n 가상환경이름 python=3.x

##### conda env list        // 리스트 확인

##### conda activate 생성할폴더이름     // 재접속시 이 코드만 실행하면 된다
##### ex - conda activate tensor_ai



#### 새로운 주피터 환경생성

```python

conda install jupyter
```

#### 기존 주피터(anaconda3)에 kernel 설치

```python
pip install ipykernel
python -m ipykernel install --user --name 가상환경이름 --display-name "보이고싶은 kernel이름"
```

#### 커널 삭제

`jupyter kernelspec uninstall 커널이름`

#### 가상환경 제거

`conda env remove --name 가상환경이름`



### 파이썬 패키지 설치

##### pip install tensorflow==2.2

##### conda install pandas

##### conda install -c conda-forge matplotlib

##### conda install -c anaconda seaborn

##### conda install -c anaconda scikit-learn