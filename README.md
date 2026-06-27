# 🚀 AdStacks Media - Responsive Office Dashboard

A high-performance, responsive, and visually stunning office dashboard web and mobile application built with **Flutter 3.x** and **Material 3**. Designed specifically for **AdStacks Media**, this project features multi-device layout adaptation, fluid spline charts, employee management modules, and real-time interactive widgets.

---

## 🌟 Key Features & Architecture

### 📱 1. Multi-Device Adaptive Responsiveness
- **Desktop PCs & Large Monitors (>= 1150px)**: 3-column architecture (Fixed Left Sidebar, Center Dashboard, and Right Widget Panel).
- **Laptops & Medium Displays (950px – 1149px)**: Dynamic 3-column layout with flexible scaling and side-by-side card items.
- **Tablets & iPads (650px – 949px)**: 2-column layout with an animated navigation drawer and embedded side panel.
- **Mobile Smartphones (< 650px)**: Single-column stacked layout with touch-optimized controls and auto-adjusting typographic hierarchy.

### 🎨 2. Visual Excellence & Theme Design System
- **Google Fonts Typography**: Powered by `Poppins` for readable typographic scaling.
- **Curated Color Palette**: Deep Navy (`#0F1225`), Dark Navy Cards (`#191C35`), Crisp Off-White (`#F3F4F9`), and signature multi-color gradients.
- **3D Render Art & Glassmorphism**: High-definition 3D geometric visual assets (glossy cubes, spheres, polygons) and smooth card drop shadows.

### 🛠️ 3. Modular Dashboard Components
- **Sidebar Navigation**: Company branding (`AS AdStacks Media`), admin profile card (`Pooja Sharma`), active page states (`Home`, `Employees`, `Attendance`, `Summary`, `Information`), and expandable Workspaces (`Adstacks`, `Finance`).
- **Top Header**: Dark capsule search bar (`#1D1F3A`), notification badges, event rewards shortcut, and power session exit options.
- **Top Rating Project Banner**: Highlights high-rating projects (`ETHEREUM 2.0`) with action triggers.
- **All Projects & Top Creators**: Interactive project cards with status badges and creator artwork leaderboard metrics.
- **Overall Performance Chart**: Multi-line spline chart built with `fl_chart` tracking yearly metrics (2015–2020) with active glowing peak tooltips (`2017 • 55`).
- **Right Side Panel**: Shift timing schedule (`GENERAL 10:00 AM TO 7:00 PM`), interactive calendar view (`SEP 2023`), and employee celebration cards (`Today Birthday` & `Anniversary`) with wishing dialog modals.

---

## 📁 Codebase Structure

```text
lib/
├── main.dart                   # Application entry point & MaterialApp configuration
├── theme/
│   └── app_theme.dart          # Design system tokens, color palettes, and GoogleFonts typography
├── screens/
│   ├── dashboard_screen.dart   # Main responsive shell orchestrating layout breakpoints
│   ├── employees_screen.dart   # Staff directory & role status cards
│   ├── attendance_screen.dart  # Time tracking punch clock & attendance logs
│   ├── summary_screen.dart     # KPI summary analytics & deliverable progress
│   ├── information_screen.dart # Company announcements & HR/IT policies
│   └── settings_screen.dart    # User profile preferences & 2FA controls
└── widgets/
    ├── sidebar_navigation.dart # Collapsible workspace navigation sidebar
    ├── top_header.dart         # Top header with dark search box & quick action icons
    ├── top_rating_project_banner.dart # 3D visual gradient project banner
    ├── all_projects_widget.dart # Project status gradient cards
    ├── top_creators_widget.dart # Creator leaderboard table with rating bars
    ├── performance_chart_widget.dart # Smooth spline performance line chart
    └── right_widget_panel.dart # Shift schedule, calendar, and celebration widgets
```

---

## ⚡ Getting Started

### Prerequisites
- Flutter SDK (`v3.19.0` or higher)
- Dart SDK (`v3.3.0` or higher)

### Installation & Run

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Ajay0008-cloud/adstacks.git
   cd adstacks
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run Locally**:
   ```bash
   flutter run -d chrome
   ```

4. **Build Production Web Release**:
   ```bash
   flutter build web
   ```

---

## 📄 License
This project is open-source and created for the **AdStacks Media** developer technical assignment.
