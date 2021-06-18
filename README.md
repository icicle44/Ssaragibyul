# Ssaragibyul(싸라기별), 별들을 위한 펀딩 서비스
------------
## 팀원 
오재승(조장), 한정만, 이선미, 김나혜, 박다인

------------
## 수행기간
2020년 5월 17일 ~ 6월 15일 (약 1달)

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
-  '싸라기별'은 '자잘하지만 매우 귀한 것'을 뜻하는 순우리말입니다. 싸라기별 프로젝트는 작지만 귀중한 각자의 참여로서 독립유공자 분들을 기억하고  <br>
    우리가 할 수 있는 방식으로 그들의 정신을 이어가고자 시작한 크라우드 펀딩 및 커뮤니티 제작하고자 시작하였습니다.
------------

## 설계의 주안점
- 독립 운동의 역사와 독립 운동가분들의 활동을 쉽게 알 수 있도록 독립 유공자 공훈록 검색 기능 제공. 
- 결제한 금액만큼 포인트를 충전하고 충전한 포인트로 펀딩과 기부에 참여할 수 있도록 함
- 쪽지 기능으로 회원 간 소통하거나 포인트를 주고 받을 수 있도록 함.
- 독립 운동과 관련된 사적지에 대한 정보 제공 및 사적지 방문 인증을 통해 포인트 적립할 수 있도록 하여
능동적으로 독립 운동 역사를 알고 회원들과 소통함과 동시에 그 적립된 포인트로 공익적인 펀딩 및 기부에 참여할 수 있도록 함.
- 서비스에 가입하면 펀딩, 기부 제안 및 참여할 수 있어서 회원 간 프로젝트 아이디어 공유 및 참여가 가능하도록 함.

------------
## 사용기술 및 개발환경
![jjjjjjjjjjjjjjjjj](https://user-images.githubusercontent.com/42002548/121833912-6140c800-cd08-11eb-89b6-110d0871c869.png)


Category | Detail
---- | ----
Laguage | HTML5, JS, CSS3, JQuery, JSP, Java, Spring, R
Library & API | googleMap, googleChart, chartJs, FullCanlendar 
IDE | VisualStudio Code, Eclpise, Jupyter Notebook
Server | Tomcat(v8.5)
Document | Google Drive, Figma, ERDCloud, diagrams.net
CI | Github, GIT
DataBase | AWS RDS, Oracle, sqldeveloper

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
    - 펀딩(제안, 참여, 수정, 취소) 기능 담당.
    - 조장, 문서 통합 작업, 펀딩페이지 프론트/백 기능 구현, 기부 백 보조, 펀딩 참여, 제안 기능 구현.  
<br>

- 한정만
  - 풀스택(프론트/백)
    - 메인 페이지 및 독립 유공자 페이지(방문인증, 검색, 지도) 담당.
    - 메인페이지 프론트/백, 별보러 가자 게시판 전체, 별들의 발자취 중 리스트, 상세조회, 공훈록 페이지구현.
<br>

- 이선미
  - 풀스택(프론트/백)
    - 메인 페이지 및 쪽지, 포인트(결제) 기능 담당.
    - 오픈API DB추출, 메인페이지 프론트/백, 쪽지페이지 프론트/백, 쪽지, 결제, 포인트 기능 구현. 
<br> 
   
- 김나혜
  - 풀스택(프론트/백)
    - 관리자 페이지(그래프, 차트, 조회) 담당.
    - 관리자 페이지 프론트/백, 그래프&캘린더 API 사용 및 CSS 수정, 부트스트랩 적용, 검색 기능 구현.
<br>

- 박다인
  - 풀스택(프론트/백)
    - 기부 기능, 마이페이지(회원가입,로그인) 담당
    - 기부 페이지 프론트/백, 마이페이지 프론트/백, 회원가입 페이지 프론트/백 기능 및 디자인(CSS, JS) 구현.
------------
## 주요 기능

![1  회원가입](https://user-images.githubusercontent.com/42002548/122520579-b9503500-d04e-11eb-93ad-97b4173a9921.png)
-   회원가입
<hr>
![2  비밀번호 찾기](https://user-images.githubusercontent.com/42002548/122520587-c0774300-d04e-11eb-8717-e9e87da8a773.png)
-   비밀번호 찾기
<hr>
![3  마이페이지(제안한 프로젝트)](https://user-images.githubusercontent.com/42002548/122520606-c79e5100-d04e-11eb-8878-e03c8b42eab5.png)
-   마이페이지(제안한 프로젝트)
<br>
![4  마이페이지(참여한 프로젝트)](https://user-images.githubusercontent.com/42002548/122520633-cff68c00-d04e-11eb-9a09-d694ef400139.png)
-   마이페이지(참여한 프로젝트)
<br>
![5  포인트](https://user-images.githubusercontent.com/42002548/122520659-db49b780-d04e-11eb-858c-40d1891f124d.png)
-   포인트
 <br>
![6  기부 리스트](https://user-images.githubusercontent.com/42002548/122520700-e997d380-d04e-11eb-928d-4862565e90dc.png)
-   기부 리스트
<br>
![7  기부 상세](https://user-images.githubusercontent.com/42002548/122520723-f0bee180-d04e-11eb-9e4f-932cd93723f1.png)
-   기부 상세
<br>
![8  기부 상세_댓글](https://user-images.githubusercontent.com/42002548/122520778-02a08480-d04f-11eb-9952-7290d245fd72.png)
-   기부 상세(댓글)
<br>
![9  기부 참여하기](https://user-images.githubusercontent.com/42002548/122520889-25cb3400-d04f-11eb-9d6c-c4e913398e4c.png)
-   기부 참여하기
<br>
![10  기부 제안하기](https://user-images.githubusercontent.com/42002548/122520913-2d8ad880-d04f-11eb-9f11-0ec2c9032495.png)
-   기부 제안하기
<br>
![11 펀딩 리스트](https://user-images.githubusercontent.com/42002548/122520947-37144080-d04f-11eb-9a57-373f0973d07c.JPG)
-   펀딩 리스트
<br>
![12  펀딩 리스트](https://user-images.githubusercontent.com/42002548/122521039-514e1e80-d04f-11eb-90d1-5d9b36c42f68.JPG)
-   펀딩 상세
<br>
![13  쪽지](https://user-images.githubusercontent.com/42002548/122521088-6034d100-d04f-11eb-8638-9b8f2a040c2f.JPG)
-   쪽지
<br>
![14  공훈록](https://user-images.githubusercontent.com/42002548/122521102-64f98500-d04f-11eb-873c-f7313f0e27c3.JPG)
-   공훈록
<br>
![15  별들의 발자취](https://user-images.githubusercontent.com/42002548/122521129-6aef6600-d04f-11eb-9342-0944f0e25ecb.JPG)
-   별들의 발자취
<br>
![16  별보러 가자](https://user-images.githubusercontent.com/42002548/122521160-72af0a80-d04f-11eb-8f20-8c5afcc5937a.JPG)
-   별보러 가자
<br>
![17  관리자 메인](https://user-images.githubusercontent.com/42002548/122521238-8c505200-d04f-11eb-9fd1-7429b4835866.JPG)
-   관리자 메인
<br>
![18  관리자 상세](https://user-images.githubusercontent.com/42002548/122521266-95412380-d04f-11eb-9cad-9afce2a6d741.JPG)
-   관리자 상세
------------
## Document
### 1. 유즈케이스
![싸라기별_유즈케이스(03안)_05_09](https://user-images.githubusercontent.com/42002548/121817298-7ba08480-ccbb-11eb-8c98-39aaa79d7cdb.png)

### 2. 플로우차트
![knknkjn](https://user-images.githubusercontent.com/42002548/121816008-28770380-ccb4-11eb-9573-ec501a98bfcf.png)

### 3. ERD
![hhhhhhhhhhh](https://user-images.githubusercontent.com/42002548/121816012-2b71f400-ccb4-11eb-84c1-7f4f2e4ccfa6.png)


