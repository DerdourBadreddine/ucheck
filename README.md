# UCheck — University Exam Management & Attendance System

UCheck is a Flutter mobile (and web) application that digitalizes the exam check-in process for university departments. It replaces paper attendance sheets with a QR-code-based system, lets teachers publish exam schedules, and gives students a single view of their upcoming exams and announcements.

---

## What the App Does

### For Students
| Feature | Description |
|---------|-------------|
| **QR Code** | Your unique identity card — displays name, last name, student ID, and role as a scannable QR code |
| **Exam Calendar** | Week-view calendar showing only exams for your specific academic level (e.g. L3 info si) |
| **Announcements** | Scrollable feed of posts published by your teachers |
| **Profile** | View your details, upload a profile photo, and log out |

### For Teachers (Normal)
| Feature | Description |
|---------|-------------|
| **Announcements** | Create, edit, and delete announcements visible to all students |
| **Exam Calendar** | Full calendar view of all scheduled exams |
| **Profile** | Same as student profile |

### For Teachers (Principal)
Everything a Normal teacher has, plus:
| Feature | Description |
|---------|-------------|
| **QR Scanner** | Live camera scanner that reads student QR codes and records their presence |
| **Student List** | Chronological list of all students who have been checked in for the current exam session |
| **Export PDF** | One-tap export of the attendance list to a PDF file (Android) |
| **Add Exam** | Create new exam entries in the shared calendar with faculty, department, module, teacher, date, and time |

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | Flutter 3.41 · Dart 3.11 |
| **Backend / Database** | Supabase (PostgreSQL 17) |
| **Auth** | Supabase Auth (email + password) |
| **Storage** | Supabase Storage (`profiles` bucket) |
| **State management** | flutter_bloc (Cubit) |
| **Navigation** | go_router |
| **Calendar** | syncfusion_flutter_calendar |
| **QR generation** | qr_flutter |
| **QR scanning** | mobile_scanner |
| **PDF generation** | pdf package |
| **Fonts** | Google Fonts (Inter) |

---

## Project Structure

```
lib/
├── main.dart                         # App entry point, Supabase init, root BlocProviders
├── core/
│   └── utils/
│       ├── app_router.dart           # GoRouter — 6 named routes
│       ├── assets.dart               # Compile-time asset paths
│       └── styles.dart               # Global TextStyle definitions
└── features/
    ├── sign_in/                      # Login screen
    ├── sign_up/                      # 2-step registration
    ├── navigation_bar/               # Student bottom nav (Calendar · Home · Profile)
    ├── home/                         # Student home: QR code + announcements
    ├── calendar/                     # Student exam calendar (filtered by level)
    ├── profile/                      # Shared profile screen (student + teacher)
    └── admin/
        ├── navigation_bar_admin/     # Teacher bottom nav (Calendar · Home · List · Profile)
        ├── home/                     # Teacher home: QR scanner + announcements
        ├── calendar_admin/           # Teacher calendar + exam creation form
        └── student_list/             # Checked-in students + PDF export
```

---

## Database Schema (Supabase project: ucheck1)

### `public.users`
| Column | Type | Notes |
|--------|------|-------|
| id | uuid | PK, matches auth.users |
| name | text | |
| last_name | text | |
| email | text | |
| id_number | text | Student/teacher institution ID |
| user_role | text | `student` or `teacher` |
| user_categorie | text | Student level (e.g. `L3 info si`) or teacher type (`normal` / `principal`) |
| profile_url | text | Supabase storage URL |
| created_at | timestamptz | |

RLS: users can only read, insert, and update their own row.

### `public.announcement`
| Column | Type | Notes |
|--------|------|-------|
| id | bigint | PK, auto-generated |
| uuid | uuid | Author's auth uid (auto-filled by `auth.uid()`) |
| last_name / name | text | Author display name |
| content | text | Announcement body |
| created_at | timestamptz | |

RLS: all authenticated users can read; authenticated users can create, edit, and delete.

### `public.calendarAppointments`
| Column | Type | Notes |
|--------|------|-------|
| id | bigint | PK, auto-generated |
| subject | text | Module name |
| faculty / department | text | |
| principal_teacher | text | |
| date | text | `yyyy-MM-dd` format |
| start_at / end_at | text | `HH:mm` 24-hour format |
| exam_level | text | Matches a student's `user_categorie` |
| color | text | Hex color string e.g. `0xff3185FC` |
| created_at | timestamptz | |

RLS: all authenticated users can read, insert, update, delete.

### `public.student_lists`
| Column | Type | Notes |
|--------|------|-------|
| id | bigint | PK, auto-generated |
| name / last_name | text | Extracted from scanned QR code |
| id_number | text | |
| created_at | timestamptz | |

RLS: all authenticated users can read, insert, delete.

---

## How to Run

### Prerequisites
- Flutter SDK >= 3.32 (tested on 3.41.9)
- For Android: Android SDK + device or emulator (API 23+)
- For web: Chrome browser

### Steps

```bash
# 1. Install dependencies
flutter pub get

# 2a. Run on Android device / emulator
flutter run

# 2b. Run on Chrome (web)
flutter run -d chrome

# 2c. Build a production web release
flutter build web
```

### Supabase Configuration

The app is pre-configured to connect to **ucheck1** (`dvimneqqomzfhxmhvlkz.supabase.co`). No environment setup is needed.

> **Important — Email Confirmation**
> By default, Supabase requires email confirmation before a new account can log in.
> For internal/university use, disable this in the Supabase dashboard:
> `Authentication → Providers → Email → uncheck "Confirm email"`
>
> With confirmation disabled, sign-up logs the user in immediately.
> With confirmation enabled, the app will show a "check your email" message and redirect to the login screen.

---

## App Flow

```
App Launch
    └─ Sign In screen (default route "/")
         ├─ Login → fetch user_role → route to correct nav bar
         └─ "Create account" → Sign Up Step 1 (name, last name, email)
                                    └─ Next → Sign Up Step 2 (ID, password, role/level)
                                                   └─ Finish → Supabase Auth signUp
                                                               → Insert profile into users
                                                               → Route to correct nav bar

Student Nav (3 tabs)               Teacher Nav (4 tabs)
  [0] Calendar                       [0] Calendar
       └─ Filtered by own level            └─ All scheduled exams
  [1] Home                           [1] Home
       ├─ QR code (own data)              ├─ Principal: live QR scanner
       └─ Announcements feed              ├─ All: post/edit/delete announcements
  [2] Profile                        [2] Student List (check-in log)
       ├─ Upload photo via camera         └─ Export to PDF (Android)
       └─ Log out                    [3] Profile
```

---

## Key Design Decisions

- **Role-based routing**: After login, `user_role` (`student` / `teacher`) determines which navigation shell is loaded. The teacher sub-role (`principal` / `normal`) gates features within the teacher shell without a separate route.
- **BLoC for navigation**: Each nav bar uses a Cubit holding the page list and current index, so switching tabs does not rebuild the entire tree.
- **QR data format**: QR codes encode `Name:`, `Last name:`, `Id number:`, `Role:` on separate lines. The scanner splits on `\n` and parses each prefix to extract the student's identity for check-in.
- **24-hour time storage**: Times are stored as `HH:mm` strings (not locale-formatted) so that `DateTime.parse('yyyy-MM-dd HH:mm')` works reliably across all device locales.
- **Color-coded exams**: Each new exam is assigned a random color from a curated 8-color palette, making the calendar visually distinct at a glance.
- **Supabase Storage**: Profile photos upload to the `profiles` bucket at `/{userId}/profile`. The public URL is written back to `users.profile_url` and used everywhere an avatar is shown.
- **RLS everywhere**: All four tables have Row Level Security enabled. Users can only access their own profile row; announcement and calendar data are open to all authenticated users.
