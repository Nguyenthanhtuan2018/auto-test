# TapTap QA Automation Testing

QA Automation Test cho app Android TAPTAP sử dụng Maestro.

## 📁 Cấu trúc Project

```
├── .maestro/
│   ├── auth/
│   │   └── Login.yaml          # Flow đăng nhập
│   ├── home/
│   │   └── Home.yaml           # Flow kiểm tra trang chủ (có API integration)
│   └── config.yaml             # Config để scan subdirectories
├── env/
│   ├── env.common              # Biến môi trường chung
│   ├── env.stg                 # Config staging
│   ├── flow.login              # Credentials login
│   └── flow.home               # Config home flow
├── scripts/
│   └── apiLogin.js             # Script gọi API login
├── test-runners/
│   ├── run-smoke-test.bat      # Chạy smoke test trên Windows
│   └── run-smoke-test.sh       # Chạy smoke test trên Linux/CI
├── reports/                    # HTML test reports
├── apk/                        # APK files
└── .github/workflows/
    └── maestro-smoke-stg.yml   # GitHub Actions workflow

```

## 🚀 Chạy Test Local (Windows)

### Yêu cầu
- Android emulator hoặc thiết bị thật
- Maestro CLI đã cài đặt

### Chạy Smoke Test
```bash
.\test-runners\run-smoke-test.bat
```

Report sẽ tự động mở tại: `reports/smoke-test-report.html`

## 🔧 Cấu hình

### File Environment
- `env/env.stg`: Config staging (APP_ID, API_BASE_URL, LOGIN_PATH)
- `env/flow.login`: Credentials login (PHONE, PASSWORD, MOBILE, DEVICE_ID)

### Sửa config
Chỉnh sửa file trong `env/` để thay đổi config test.

## 📋 Test Flows

### Login Flow (`.maestro/auth/Login.yaml`)
1. Launch app
2. Xóa số điện thoại có sẵn
3. Nhập số điện thoại
4. Tap "Tiếp tục"
5. Nhập password
6. Đóng popup (nếu có)
7. Verify "Trang chủ" hiển thị

### Home Flow (`.maestro/home/Home.yaml`)
1. Gọi API login để lấy thông tin user
2. Chạy Login flow
3. Verify tên user từ API hiển thị trên UI

## 🏷️ Tags

- `smokeTest`: Smoke test suite (hiện tại chỉ có Home flow)
- `auth`: Authentication flows
- `home`: Home screen flows

## 🤖 CI/CD (GitHub Actions)

Workflow tự động chạy khi:
- Push lên branch `main`
- Tạo Pull Request

### Setup GitHub Secrets (nếu cần)
Hiện tại workflow dùng file env, không cần secrets.

## 📊 Reports

HTML reports được tạo tại `reports/smoke-test-report.html` sau mỗi lần chạy test.

## 🛠️ Troubleshooting

### Emulator không kết nối
```bash
adb devices
adb kill-server
adb start-server
```

### Test fail
- Kiểm tra credentials trong `env/flow.login`
- Xem screenshots trong debug output: `~/.maestro/tests/`
- Xem HTML report để biết step nào fail

## 📝 Version

**Version:** 1.0.0  
**Date:** 2025-11-29  
**Status:** ✅ Production Ready

## 👥 Team

QA Team - TapTap Project
