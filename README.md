# 📝 SwiftSign - iOS 회원가입/로그인 과제

## 📱 프로젝트 소개

**SwiftSign**은 iOS UIKit + CoreData 기반의 간단한 **회원가입 & 로그인 기능 구현 과제 앱**입니다.  
서버 없이도 회원 정보를 CoreData에 저장하고, `UserDefaults`로 로그인 상태를 관리하는 구조를 갖추고 있으며,  
**UX를 고려한 버튼 활성화/비활성화, 알림창, 유효성 검사 등**을 포함합니다.

---

## ✅ 주요 기능

### 1. 시작하기 화면 (`StartViewController`)
- 시작하기 버튼 탭 시,
  - **비회원**: 회원가입 화면(`SignUpViewController`)으로 이동
  - **회원**: 로그인 성공 화면(`LoginSuccessViewController`)으로 이동
- **회원 여부 판단**: UserDefaults에 저장된 로그인 상태 정보로 판단
- 테스트용:
  - 🧹 **전체 회원 초기화 버튼**
  - 👀 **전체 회원 출력 버튼**

---

### 2. 회원가입 화면 (`SignUpViewController`)
#### 📌 입력 항목
- 아이디 (이메일 주소 형식)
- 비밀번호
- 비밀번호 확인
- 닉네임

#### ✅ 유효성 조건
- **아이디 (이메일 형식)**
  - 전체 이메일 형식이어야 함 (예: abc123@gmail.com)
  - `@` 이전(로컬 파트)은 6~20자, 영문 소문자+숫자만 가능
  - 숫자로 시작 ❌
- **비밀번호**
  - 최소 8자 이상, 최대 20자 이하
  - 비밀번호 확인과 일치해야 함
- **닉네임**: 비어 있으면 안 됨

#### 🔒 중복 검사
- 회원가입 시, **이미 CoreData에 저장된 이메일**이면 가입 불가

#### 🔄 기타
- 모든 조건 충족 시에만 회원가입 버튼 활성화
- 회원가입 성공 시 로그인 상태 저장(UserDefaults) → 로그인 성공 화면으로 이동

---

### 3. 로그인 성공 화면 (`LoginSuccessViewController`)
- “{닉네임}님 환영합니다” 표시
- **로그아웃 버튼**
  - UserDefaults의 로그인 정보 삭제
  - 시작 화면으로 이동
- **회원탈퇴 버튼**
  - CoreData에서 유저 삭제
  - UserDefaults 로그아웃
  - 시작 화면으로 이동
- ✅ 백버튼 제거 + 알림창(탈퇴/로그아웃 시 확인)

---

## 🗃 데이터 저장 구조

| 저장소 | 역할 |
|--------|------|
| **CoreData** | 회원 정보 저장 (email, password, nickname) |
| **UserDefaults** | 로그인 상태 저장 (isLoggedIn, loggedInEmail) |

---

## 🧪 테스트 체크리스트

| 테스트 항목 | 결과 |
|-------------|------|
| 아이디 조건 위반 시 회원가입 불가 | ✅ |
| 비밀번호 길이/일치 조건 만족해야 가입 가능 | ✅ |
| 닉네임 없이 회원가입 불가 | ✅ |
| 중복 이메일 가입 시도 시 경고 표시 | ✅ |
| 회원가입 성공 시 자동 로그인 → 로그인 성공 화면 이동 | ✅ |
| 앱 종료 후 다시 실행해도 로그인 상태 유지 | ✅ |
| 로그아웃 시 상태 초기화 및 시작화면으로 이동 | ✅ |
| 회원 탈퇴 시 CoreData에서 유저 삭제, 시작화면 이동 | ✅ |
| 시작화면에서 유저 여부 판단 정확히 동작 | ✅ |
| 전체 초기화 버튼으로 CoreData 전체 삭제 가능 | ✅ |

---

## 🛠 기술 스택

- `Swift`
- `UIKit`
- `SnapKit`
- `CoreData` – 회원 정보 저장
- `UserDefaults` – 로그인 상태 관리
- `MVC 아키텍처`
- `UIAlertController` – 유저 알림 처리

---

## 📂 폴더 구조

```
SwiftSign/
├── CoreData/                 # CoreData 모델 및 매니저
│   └── CoreDataManager.swift
├── UserDefaults/
│   └── UserDefaultsManager.swift
├── Start/
│   ├── StartView.swift
│   └── StartViewController.swift
├── SignUp/
│   ├── SignUpView.swift
│   ├── SignUpModel.swift
│   └── SignUpViewController.swift
├── LoginSuccess/
│   ├── LoginSuccessView.swift
│   └── LoginSuccessViewController.swift
└── Resources/
└── Assets.xcassets / LaunchScreen / Info.plist
```

---

## 💡 부가 UX 기능

- 실시간 텍스트 입력 감지로 회원가입 버튼 활성화/비활성화
- 알림창으로 회원가입/탈퇴/로그아웃 결과 안내
- 텍스트 입력 시 자동 대문자 방지
- 모든 유저 콘솔 출력 기능 (디버그용)

---

