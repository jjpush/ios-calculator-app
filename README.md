## 📚 제목
계산기

## 📖 소개
ios 계산기 앱을 구현한 프로그램 입니다.

<br/>

**프로젝트를 구현하며 사용해본 것**
- TDD
- UML 
- LinkedList

## 🧑🏻‍💻 팀원

|                        제이푸시                         |
|:---------------------------------------------------------:|
| <img width="180px" src="https://i.imgur.com/JqEDLOf.jpg"> |


## ⏰ 타임라인: 프로젝트의 주요 진행 척도

**STEP1**
- 9월 19일
    - 프로젝트 요구사항 분석
    - 요구사항 기반으로 UML 작성

- 9월 20일
    - TDD 테스트 파일생성
    - `CalculatorItemQueue` LinkedList로 구현
    - `Node` 구현
    - `CalculateItem` 구현

- 9월 22일
    - 코드 리뷰 기반 리팩토링 진행
        - TDD 컨벤션 수정

**STEP2**

- 9월 23일
    - `Formula` 구현
    - `ExpressionParser` 구현
    - `CalculatorError` 생성
        - 0으로 나눌 경우
        - 수식이 잘못되었을 경우


- 9월 24일
    - 음수 값이 들어왔을 때 처리 로직 구현

- 9월 27일
    - 조건문 가독성 향상
    - 반복되는 코드 메서드화
    - 컨벤션 수정




## 🛠 시각화된 프로젝트 구조(다이어그램 등)
<img src="https://i.imgur.com/PchE7Ed.png" width="80%">

## 🔥 트러블 슈팅

### 프로젝트 요구사항 이해
프로젝트 요구사항에서 제시한
`Queue내에서 다루는 요소는 CalculateItem 프로토콜을 준수한다`
의 요소는 메서드라고 생각해서 프로토콜 내에 calculate() 등의 계산메서드를 넣고 준수하려 함. 
이후 제시된 UML에서 Queues내에서 다루는 요소란 말 그대로 큐 내의 값 타입을 프로토콜로 준수하라는 뜻이어서 수정.
프로젝트 요구사항을 이해하는 것은 중요하다..

### 테스트 하고 싶은 메서드가 private일 때
테스트의 가장 기본적인 원칙은 테스트 코드와 실제코드의 분리.
만약 private를 제거해서 테스트를 해준다면 테스트의 의미가 없어짐.
private가 되어야 한다면 다른 메서드에서 사용되는 것이 분명하니 직접접근을 하지 않고 테스트

### 음수가 들어올 경우

수식으로 음수가 들어올 경우에 처리를 못해주는 버그가 있어 해결.
변수 두개로 하나는 이전 값, 하나는 현재 값을 가리키는데 연산자, 연산자 라면 음수 판단.
식을 띄어쓰기 없이 받은 것이 문제를 좀 악화시켰던 것 같음. 이런 경우 알고리즘을 고민하는 것보다 구분자를 받는 것이 더 효과적이라는 사실을 알게됨.


## 🔗 참고 링크

[Unit tests best practices in Xcode and Swift](https://www.avanderlee.com/swift/unit-tests-best-practices/)

[Unit Test 작성하기 - 야곰 닷넷](https://yagom.net/courses/unit-test-작성하기/)

[TDD는 설계 방법론이 아니다](https://gyuwon.github.io/blog/2019/03/03/tdd-is-not-a-design-methodology.html)

[Swift Language Guide - Extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)

[Swift Language Guide - Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)
