# Ssaragibyul(싸라기별), 별들을 위한 펀딩 서비스
------------
## 팀원 
오재승(조장), 한정만, 이선미, 김나혜, 박다인

------------
## 수행기간
2020년 3월 22일 ~ 4월 20일 (약 한달)

------------


## Contetns

1. [개요](#개요)
2. [설계의 주안점](#설계의-주안점)
3. [사용기술 및 개발환경](#사용기술-및-개발환경)
4. [프로젝트 기능 구현](#프로젝트-기능-구현)
5. [주요기능](#주요기능)
6. [Document](#Document)

------------

## 개요
+ 강아지와 사람의 건강을 챙기기 위한 온라인 산책 기록 커뮤니티 플랫폼.
------------

## 설계의 주안점
- 반려견과 함께하는 산책과 러닝위주의 목표치를 설정 및 달성하고 기록할 수 있게 한다.
- 소통과 정보를 필요로 하는 이용자를 위한 커뮤니티 활성화한다.
- 채팅 기능 구현으로 함께할 파트너를 구할 수 있도록 한다.
- 비로그인, 반려견이 있는 회원, 반려견이 없는 회원에 맞게 다른 서비스를 제공한다.

------------
## 사용기술 및 개발환경
![image](https://user-images.githubusercontent.com/81937349/118357070-29345100-b5b3-11eb-9a8f-e692a8b2ba48.png)
Category | Detail
---- | ----
Laguage | HTML5, JS, CSS3, JQuery, JSP, Java
Library & API | Kakaomap, OpenWeather, Easy-pie-chart
IDE | VisualStudio, Eclpise
Server | Tomcat(v8.5)
Document | Google Drive, Figma, ERDCloud, diagrams.net
CI | Github
DataBase | AWS RDS, Oracle 

------------
## 프로젝트 기능 구현


- 공통
    - 프로젝트 주제 선정 및 기획 
    - 플로우차트, 유스케이스 다이어그램 설계
    - DB & 클래스, 시퀸스 다이어그램 설계
    - 메인 페이지 프론트/백 기초 구현
<br>

- 오재승
  - 조장(풀스택)
    - 관리자 페이지(회원 목록 조회, 회원 삭제, 회원 수정, 각 게시판 수정/삭제) 담당.
    - 문서 작업, 산책일기 달력 구현 및 카카오 MAP API 연결, 관리자 페이지 백 기능 구현.
<br>

- 홍찬희
  - 풀스택(프론트/백)
    - 산책 짝궁 페이지(1:1 채팅, 게시판_CRUD, 게시판 페이징 처리) 담당.
    - 유저간 채팅 기능, 관리자 페이지 프론트(CSS,JS) 및 산책 짝궁 게시판 기능 구현.
<br>  
   
- 이혜성
  - 풀스택(프론트/백)
    - 멍멍 이야기(태그별 게시판 페이징 처리, CRUD(이미지 포함), 댓글, 좋아요) 페이지 담당.
    - 메인페이지 백 보조, 커뮤니티(멍멍이야기) 검색(조회), 댓글, 좋아요 기능 구현.
<br>

- 신성진
  - 풀스택(프론트/백)
    - 퍼피런 이야기(공지사항_CRUD, 댓글, 페이징 처리) 페이지 담당.
    - 반려견 계산기 페이지, 공지사항(퍼피런 이야기) 페이지 상세 기능 구현.
 <br>  
   
- 김다빈
  - 풀스택(프론트/백)
    - 산책일기(지도 API, 목표 등록, 목표 설정, 게시판, 그래프, 달력) 페이지 담당.
    - 캘린더, 산책일기 게시판_CRUD, 공지사항 백 보조, 산책 기록 등록 및 달성 기능 구현.
<br>

- 이주연
  - 풀스택(프론트/백)
    - 마이페이지(회원가입, 로그인, 아이디찾기 회원 목록, 프로필 등록) 페이지 담당.
    - 메인 페이지 프론트(CSS,JS), 날씨, 그래프 API 연동, 마이페이지 페이지 기능 구현.
------------
## 주요 기능
1. 회원가입
![0001](https://user-images.githubusercontent.com/81956425/118357017-d8bcf380-b5b2-11eb-8bc1-57e70f51a482.jpg)

2. 마이페이지
![0002](https://user-images.githubusercontent.com/81956425/118356858-2553ff00-b5b2-11eb-9a61-109ae974c15f.jpg)
![0003](https://user-images.githubusercontent.com/81956425/118356816-048ba980-b5b2-11eb-9593-bca20d9adc97.jpg)
3. 산책기록
![0004](https://user-images.githubusercontent.com/81956425/118356817-05bcd680-b5b2-11eb-8fa5-c65e5d9044dc.jpg)
![0005](https://user-images.githubusercontent.com/81956425/118356818-05bcd680-b5b2-11eb-878e-b6403cf4f61c.jpg)
4. 산책일기
![0006](https://user-images.githubusercontent.com/81956425/118356819-06556d00-b5b2-11eb-9f19-cbf97207816d.jpg)
![0007](https://user-images.githubusercontent.com/81956425/118356820-06ee0380-b5b2-11eb-9286-94ffd09fb5e3.jpg)
5. 산책짝꿍
![0008](https://user-images.githubusercontent.com/81956425/118356821-06ee0380-b5b2-11eb-85b0-cca9938e157d.jpg)
6. 멍멍이야기(커뮤니티)
![0011](https://user-images.githubusercontent.com/81956425/118356935-7a901080-b5b2-11eb-9a33-623e809b9ac5.png)
![0012](https://user-images.githubusercontent.com/81956425/118356937-7bc13d80-b5b2-11eb-91ad-18db1451fedd.png)
7. 반려견 계산기
![0009](https://user-images.githubusercontent.com/81956425/118356822-07869a00-b5b2-11eb-9732-d82b5fdcfd87.jpg)
8. 관리자
![0010](https://user-images.githubusercontent.com/81956425/118356824-07869a00-b5b2-11eb-9566-4ab18402ea17.jpg)


------------
## Document
### 1. 유스케이스
![유스케이스](https://user-images.githubusercontent.com/81937349/118353075-c71e2080-b59f-11eb-85b5-9db49f2ff080.png)

### 2. ERD
![ERD_통합](https://user-images.githubusercontent.com/81937349/118353105-df8e3b00-b59f-11eb-9a3a-d53fd93c04d7.png)

