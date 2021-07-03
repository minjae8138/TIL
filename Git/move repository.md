## 원격저장소 기록을 그대로 옮기는 방법

### 저장소 미러링하기 

1. 터미널 혹은 git bash 열기
2. 복사하고자 하는 저장소(ex-gitlab)의 bare clone 생성
- `git clone --bare 옮기고싶은깃주소`
3. 새로운 저장소(github)로 mirror-push를 진행
  - ` cd old-repository.git
 git push --mirror https://github.com/exampleuser/new-repository.git`
4. 1번과정에서 클론된 저장소 삭제(선택)

### 100MB가 넘는 크기의 파일을 포함한 저장소 미러링 하는 경우

깃헙의 정책상 100MB가 넘어가는 파일은 오류가 발생하여 push가 불가능하기에 추가적인 작업이 필요하다.

1. git lfs와 BFG Repo Cleaner를 설치
2. 복사하고자 하는 저장소(gitlab)의 clone을 생성
- ` git clone --mirror <https://gitlab.com/exampleuser/old-repository.git>`
3. 커밋 히스토리 내에서 large file을 찾아 트랙킹
- ` git filter-branch --tree-filter 'git lfs track "*.{zip,jar}"' -- --all`
4. BFG를 이용하여 해당 파일들을 git lfs로 변경
- ` java -jar ~/usr/bfg-repo-cleaner/bfg-1.13.0.jar --convert-to-git-lfs '*.zip'
 java -jar ~/usr/bfg-repo-cleaner/bfg-1.13.0.jar --convert-to-git-lfs '*.jar'`
5. 새로운 저장소(github)로 mirror-push를 진행.
- ` cd old-repository.git
 git push --mirror <https://github.com/exampleuser/new-repository.git>`
6. 1번과정에서 클론된 저장소 삭제(선택)
