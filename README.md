# LinkUp - 活動社交應用

這是一個使用 Flutter 開發的活動社交應用，讓使用者可以建立、參與和管理各種活動。

## 功能特點

- 活動瀏覽與搜尋
- 活動詳細資訊查看
- 活動聊天室
- 個人資料管理
- 主題設定
- 通知系統

## 技術架構

### 主要依賴

- Flutter SDK: ^3.27.0
- Dart SDK: >=3.7.0 <4.0.0
- Firebase 套件:
  - firebase_core: ^2.32.0
  - firebase_auth: ^4.20.0
  - cloud_firestore: ^4.17.5
  - firebase_storage: ^11.6.5
  - firebase_messaging: ^14.9.4
- 其他主要套件:
  - google_maps_flutter: ^2.10.1
  - flutter_bloc: ^8.1.6
  - cached_network_image: ^3.4.0
  - image_picker: ^1.1.2
  - geolocator: ^10.1.1
  - timeago: ^3.7.0
  - uuid: ^4.5.1

## 專案結構

```
lib/
├── screens/          # 畫面頁面
│   ├── home/        # 首頁
│   ├── events/      # 活動頁面
│   ├── chat/        # 聊天頁面
│   └── profile/     # 個人資料頁面
├── models/          # 資料模型
├── services/        # 服務層
├── utils/           # 工具函數
└── main.dart        # 應用程式入口
```

## 開發環境設置

### 前置需求

- Flutter SDK (^3.27.0)
- Dart SDK (>=3.7.0 <4.0.0)
- Android Studio 或 VS Code
- Android SDK (用於 Android 開發)
- Xcode (用於 iOS 開發，僅限 macOS)
- Firebase 專案設置

### 安裝步驟

1. 克隆專案：
```bash
git clone [repository-url]
cd LinkUp_Flutter
```

2. 安裝依賴：
```bash
flutter pub get
```

3. 設定 Firebase：
   - 在 Firebase Console 建立專案
   - 下載並配置 `google-services.json` (Android)
   - 下載並配置 `GoogleService-Info.plist` (iOS)
   - 更新 `web/index.html` 中的 Firebase 配置

4. 啟動開發伺服器：
```bash
# 網頁版
flutter run -d edge

# Android
flutter run -d android

# iOS
flutter run -d ios
```

## 開發工具建議

- VS Code 或 Android Studio
- Flutter 和 Dart 插件
- Firebase CLI
- Git

## 注意事項

1. 確保所有 Firebase 配置正確
2. 實作適當的錯誤處理
3. 考慮離線支援
4. 實作適當的資料驗證
5. 注意效能優化

## 貢獻指南

1. Fork 專案
2. 建立特性分支
3. 提交變更
4. 發送 Pull Request

## 授權

MIT License