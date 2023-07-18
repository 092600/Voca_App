# VOCA APP With FLUTTER



## 1. 프로젝트 소개

일본어와 영어를 비롯한 단어 공부와 자격증 공부까지 모바일로 쉽게 할 수 있도록 하는 것을 목표로 한 애플리케이션


## 2. 기능 소개

### 2-1. 로그인 및 회원가입


#### 2-1-1. 로그인

- 로그인 페이지

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/Login%20Page.gif">

아래와 같이 앱 바 오른쪽 상단 > 로그아웃 버튼을 눌러 로그아웃 할 수 있습니다.

- 로그아웃

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/logout.gif">

#### 2-1-2. 회원가입

- 회원가입 페이지

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/SignUp%20Page.gif">



### 2-2. 단어 공부 페이지

단어 공부 페이지는 사용자가 등록한 단어들을 여러 방식으로 공부할 수 있도록 기능을 제공합니다. 
**"사지선다"** 선택 시 아래와 같이 동작합니다.

#### 2-2-1. 사지선다

- 일본어 선택 시, 단어 공부

  ![](https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%9D%BC%EB%B3%B8%EC%96%B4%20%EB%8B%A8%EC%96%B4%20%EA%B3%B5%EB%B6%80.gif)


- 영어 선택 시, 단어 공부

  ![](https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EC%98%81%EC%96%B4%20%EB%8B%A8%EC%96%B4%20%EA%B3%B5%EB%B6%80.gif)
    


### 2-3. 메인 페이지

메인 페이지에서는 자신이 설정한 공부 목표에 금일 얼마나 도달하였는지를 확인할 수 있으며, 즐겨찾기에 추가한 단어들을 바로바로 확인하고 공부할 수 있도록 하는 기능을 제공하는 페이지입니다.

- 메인 페이지

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/Home%20Page.gif">

#### 2-3-1. 목표 달성률 보여주기 (2023/07/17 추가)

- 목표 달성률 보여주기

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%AA%A9%ED%91%9C%20%EB%8B%AC%EC%84%B1%EB%A5%A0%20%ED%99%95%EC%9D%B8%ED%95%98%EA%B8%B0.gif">

메인 페이지에서 목표 달성률을 확인할 수 있습니다. 목표는 마이 페이지에서 별도로 설정할 수 있으며 금일 ~ -5일까지의 목표달성률을 확인할 수 있습니다.

### 2-4. 다운로드 페이지

단어 다운로드 페이지는 여러 유저 간 자신이 사용하는 단어들을 공유하는 기능을 제공할 수 있는 페이지입니다.

- 다운로드 페이지

   <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/Download%20Page.gif">

- 단어 미리보기 (2023/7/16 추가)

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/단어 설치하기.gif">

단어장 테마 별로 다운로드 전, 클릭하여 단어장 별 단어를 미리 볼 수 있습니다.

- 단어 설치하기 (2023/07/13 추가)

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/단어 설치하기.gif">

단어를 서버로부터 설치하게되면 Drift를 통해 핸드폰 내의 데이터베이스에 저장하고 단어 공부 시 핸드폰 내의 데이터베이스에서 단어를 조회하여 사용합니다.

### 2-5. 마이 페이지

마이 페이지는 CSV 파일로 단어을 불러들이거나 사용 중인 단어를 CSV 파일 형태로 내보낼 수 있는 기능과 공부 목표 설정 기능을 제공하는 페이지 입니다.

- 마이 페이지

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/My%20Page.gif">

  유저 이메일과 이름을 로그인 당시 Json Web Token 에서 값을 가져와 FlutterSecureStorage 를 사용해 저장하고 사용자가 MyPage 에 들어올 경우, 값을 읽어와 화면에 보여줍니다.

#### 2-5-1. 목표 설정하기 (2023/07/17 추가)

- 목표 설정하기

  <image src="https://github.com/092600/Voca_App/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80/%EB%B3%B4%EC%B9%B4%20%EB%AA%A9%ED%91%9C%20%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0.gif">




## 3. 회고

- [2023 7 10 회고 보러가기](https://github.com/092600/Voca_App/blob/master/%ED%9A%8C%EA%B3%A0/2023_07_10_%ED%9A%8C%EA%B3%A0.md)


- [2023 7 12 회고 보러가기](https://github.com/092600/Voca_App/blob/master/%ED%9A%8C%EA%B3%A0/2023_07_12_%ED%9A%8C%EA%B3%A0.md)
