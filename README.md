# VOCA APP With FLUTTER



## 1. 프로젝트 소개

일본어와 영어를 비롯한 단어 공부와 자격증 공부까지 모바일로 쉽게 할 수 있도록 하는 것을 목표로 한 애플리케이션


## 2. 기능 소개

### 2-1. 로그인 및 회원가입


#### 2-1-1. 로그인

- 로그인 페이지

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%B5%9C%EC%A2%85_%EB%A1%9C%EA%B7%B8%EC%9D%B8.gif?raw=true">

유저가 아이디와 비밀번호를 입력한 후 Sign In 버튼을 눌렀을 떄, 사용자가 입력한 데이터와 일치하는 유저가 존재할 경우 서버로부터 Json Web Token 을 발급받습니다. 해당 토큰은 서버로부터 데이터를 받는데 사용됩니다.

#### 2-1-2. 회원가입

- 회원가입 페이지

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%B5%9C%EC%A2%85_%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85.gif">

회원가입 후, 회원 정보 설정페이지에서 유저 프로필 이미지와 공부할 언어(최대 2가지)를 선택할 수 있습니다.

- 유저 정보 설정 페이지

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%B5%9C%EC%A2%85_%EC%9C%A0%EC%A0%80%20%EC%A0%95%EB%B3%B4%20%EC%84%A4%EC%A0%95.gif">




### 2-2. 단어 공부 페이지

단어 공부 페이지에서는 회원이 설정한 언어의 단어들을 공부할 수 있습니다. 현재는 "사지선다" 방식만 구현하였습니다.

#### 2-2-1. 사지선다

- 일본어/사지선다 선택 시

  
  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%B5%9C%EC%A2%85_%EB%8B%A8%EC%96%B4%20%EA%B3%B5%EB%B6%80%ED%95%98%EA%B8%B0.gif">

위와 같이 사지선다 방식으로 문제를 풀고 틀린 문제들만을 따로 확인할 수 있습니다.
    


### 2-3. 메인 페이지

메인 페이지에서는 6일간의 목표 달성률을 확인할 수 있습니다. 목표 달성률은 맞춘 문제수/설정 목표로, 별도로 목표를 설정하지 않은 경우 40으로 설정됩니다.

- 메인 페이지

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%B5%9C%EC%A2%85_%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80.gif">




### 2-4. 다운로드 페이지

단어 다운로드 페이지에서 서버에 등록된 단어들을 다운받아 공부에 사용할 수 있습니다. 다운 전 단어장에 등록된 단어들을 확인할 수 있습니다.

- 다운로드 페이지

   <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%B5%9C%EC%A2%85_%EB%8B%A8%EC%96%B4%EC%9E%A5%20%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C.gif">




### 2-5. 마이 페이지

마이 페이지는 목표 수 설정 및 CSV 파일로 단어을 불러들이기, 단어장을 CSV 파일 형태로 내보낼 수 있습니다.

- 마이 페이지 / 목표 설정하기

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%B5%9C%EC%A2%85_%EB%AA%A9%ED%91%9C%20%EB%B3%80%EA%B2%BD.gif">

목표 수는 기본적으로 40으로 설정되어 있으나 40, 60, 80, 100, 120 의 값중 하나로 변경할 수 있습니다.


- 마이 페이지 / CSV로 단어 등록하기

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%B5%9C%EC%A2%85_CSV%20%EB%8B%A8%EC%96%B4%20%EB%93%B1%EB%A1%9D.png">


- 마이 페이지 / CSV로 단어 내보내기

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%B5%9C%EC%A2%85_%EB%8B%A8%EC%96%B4%EC%9E%A5%20%EB%82%B4%EB%B3%B4%EB%82%B4%EA%B8%B0.gif">



### 2-6. 로그아웃

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%B5%9C%EC%A2%85_%EB%A1%9C%EA%B7%B8%EC%95%84%EC%9B%83.gif">


## 3. 회고

- [2023 7 10 회고 보러가기](https://github.com/092600/Voca_App/blob/master/%ED%9A%8C%EA%B3%A0/2023_07_10_%ED%9A%8C%EA%B3%A0.md)


- [2023 7 12 회고 보러가기](https://github.com/092600/Voca_App/blob/master/%ED%9A%8C%EA%B3%A0/2023_07_12_%ED%9A%8C%EA%B3%A0.md)
