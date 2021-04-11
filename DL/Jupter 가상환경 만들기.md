# Jupter 가상환경 만들기

##### conda create -n tensor_ai python=3.8

##### conda env list        // 리스트 확인

##### conda activate 생성할폴더이름     // 재접속시 이 코드만 실행하면 된다
##### ex - conda activate tensor_ai



선택1 - 새로운 주피터 환경생성

```python
pip install tensorflow==2.2

conda install jupyter
```



선택2 - 기존 주피터(anaconda3)에 kernel 설치

```python
pip install ipykernel
python -m ipykernel install --user --name myvenv --display-name "PythonHome_p36"
```



### 파이썬 패키지 설치
##### conda install pandas

##### conda install -c conda-forge matplotlib

##### conda install -c anaconda seaborn

##### conda install -c anaconda scikit-learn