# Fortress Game

Firebase, Flame, Rive 등의 플러터 기술을 사용한 포트리스 게임입니다.<br/>

프로그래밍 초보자들은 프로그래밍 학습에 어려움을 느끼기 때문에 시작을 하는 것이 어렵다.<br/>
따라서, 프로그래밍의 기본 원리를 쉽게 배울 수 있는 게임 기반의 학습 플랫폼을 제공하여 프로그래밍 초보자들이 흥미를 느끼며 프로그래밍을 배울 수 있게 하는 것이 포트리스 게임의 목표이다.<br/>
기존의 프로그래밍 학습 플랫폼은 대부분 덱스트 기반의 이론 위주로 구성되어 있지만 포트리스 게임은 좌측 화면에는 게임 화면, 우측 화면에는 블록 코딩 기반의 Flow Chart를 사용했습니다.<br/><br/>

[설치 및 사용 방법]
1. git clone 한 후 웹으로 실행
2. 이메일을 이용한 회원가입 및 로그인 진행
3. 좌측 화면의 플레이어를 이동하기 위해서는 우측 화면의 Flow Chart를 사용
4. 플레이어 이동, 포탄 각도 조절, 포탄 발사 등의 블록

![image](https://github.com/devSWF/SWR-Research-Rive-2/assets/120999549/0eb37b1e-4267-4ddc-bed6-d76ec1965d57)

[flutter doctor 결과]
```
[√] Flutter (Channel stable, 3.3.10, on Microsoft Windows [Version 10.0.22621.1848], locale ko-KR)
    • Flutter version 3.3.10 on channel stable at D:\programs\flutter_windows_3.0.5-stable\flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision 135454af32 (7 months ago), 2022-12-15 07:36:55 -0800
    • Engine revision 3316dd8728
    • Dart version 2.18.6
    • DevTools version 2.15.0

[√] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
    • Android SDK at D:\files\android\android_sdk
    • Platform android-33, build-tools 33.0.0
    • ANDROID_SDK_ROOT = D:\files\android\android_sdk
    • Java binary at: D:\programs\android_studio_\jre\bin\java
    • Java version OpenJDK Runtime Environment (build 11.0.13+0-b1751.21-8125866)
    • All Android licenses accepted.

[√] Chrome - develop for the web
    • Chrome at C:\Program Files (x86)\Google\Chrome\Application\chrome.exe

[!] Visual Studio - develop for Windows (Visual Studio Community 2022 17.3.2)
    • Visual Studio at D:\programs\VisualStudio
    • Visual Studio Community 2022 version 17.3.32819.101
    X Visual Studio is missing necessary components. Please re-run the Visual Studio installer for the "Desktop development with C++" workload, and include these components:
        MSVC v142 - VS 2019 C++ x64/x86 build tools
         - If there are multiple build tool versions available, install the latest
        C++ CMake tools for Windows
        Windows 10 SDK

[!] Android Studio (version 4.0)
    • Android Studio at D:\programs\android_studio
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart
    X Unable to determine bundled Java version.
    • Try updating or re-installing Android Studio.

[√] Android Studio (version 2021.3)
    • Android Studio at D:\programs\android_studio_
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 11.0.13+0-b1751.21-8125866)

[√] IntelliJ IDEA Community Edition (version 2022.2)
    • IntelliJ at D:\programs\Intelij\IntelliJ IDEA Community Edition 2021.2.1
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart

[√] IntelliJ IDEA Ultimate Edition (version 2022.2)
    • IntelliJ at D:\programs\Intelij\IntelliJ IDEA 2022.2.1
    • Flutter plugin can be installed from:
       https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
       https://plugins.jetbrains.com/plugin/6351-dart

[√] VS Code (version 1.79.2)
    • VS Code at C:\Users\daiks\AppData\Local\Programs\Microsoft VS Code
    • Flutter extension can be installed from:
       https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter

[√] Connected device (4 available)
    • SM N960N (mobile) • 2848de749d1c7ece • android-arm64  • Android 10 (API 29)
    • Windows (desktop) • windows          • windows-x64    • Microsoft Windows [Version 10.0.22621.1848]
    • Chrome (web)      • chrome           • web-javascript • Google Chrome 114.0.5735.199
    • Edge (web)        • edge             • web-javascript • Microsoft Edge 114.0.1823.55

[√] HTTP Host Availability
    • All required HTTP hosts are available

! Doctor found issues in 2 categories.
```
