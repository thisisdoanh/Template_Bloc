# Flutter BLoC State managerment by Doanh

A Flutter template built on **Clean Architecture** with **BLoC** state management, code generation, and multi-flavor support.

---

## Project Structure

```
lib/
├── main.dart                        # Entry point
├── app.dart                         # Root widget (theme, routing, localization)
├── app_bloc.dart                    # Global BLoC (theme, language)
├── app_event.dart
├── app_state.dart
├── flavors.dart                     # dev / prod flavor config
├── global.dart                      # Global singleton (context, device info)
│
├── di/                              # Dependency Injection
│   ├── di.dart                      # GetIt setup & configureDependencies()
│   ├── di.config.dart               # Generated DI config
│   ├── network_module.dart          # Dio, Retrofit, Cookie
│   └── local_module.dart            # SharedPreferences, Hive
│
├── data/                            # Data layer
│   ├── remote/
│   │   ├── services/
│   │   │   └── api_service.dart     # Retrofit API interface
│   │   ├── datasources/
│   │   │   └── user_remote_datasource.dart
│   │   ├── model/
│   │   │   ├── request/             # Request models
│   │   │   └── response/            # Response models
│   │   └── interceptors/
│   │       └── response_parser_interceptor.dart
│   ├── local/
│   │   ├── hive_store.dart          # Abstract interface
│   │   ├── hive_store_helper.dart   # Hive implementation
│   │   └── model/
│   │       └── user_cache_model.dart
│   ├── pref/
│   │   ├── pref_store.dart          # Abstract interface
│   │   └── pref_store_helper.dart   # SharedPreferences implementation
│   └── repositories/
│       └── user_repository_impl.dart
│
├── domain/                          # Domain layer (business logic)
│   ├── entities/
│   │   └── user.dart
│   ├── enums/
│   │   └── language.dart
│   ├── repositories/
│   │   └── user_repository.dart     # Abstract interface
│   └── usecases/
│       ├── use_case.dart            # Base UseCase<T, P>
│       ├── login_use_case.dart
│       ├── logout_use_case.dart
│       ├── get_user_profile_use_case.dart
│       └── toogle_app_theme_use_case.dart
│
├── presentation/                    # Presentation layer
│   ├── base/
│   │   ├── base_bloc.dart           # Abstract BLoC with error handling
│   │   ├── base_state.dart          # Abstract state with PageStatus
│   │   ├── base_page.dart           # Abstract StatefulWidget + BLoC lifecycle
│   │   ├── base_popup.dart
│   │   └── page_status.dart         # Uninitialized | Loaded | Error
│   ├── router/
│   │   ├── router.dart              # AutoRoute config
│   │   └── router.gr.dart           # Generated routes
│   ├── resources/
│   │   ├── colors.dart
│   │   ├── styles.dart
│   │   ├── dimens.dart              # Responsive dimensions (ScreenUtil)
│   │   ├── app_image.dart
│   │   └── light/                   # Component themes
│   ├── widgets/                     # Reusable UI components
│   │   ├── app_button.dart
│   │   ├── app_container.dart
│   │   ├── app_dialog.dart
│   │   ├── app_touchable.dart
│   │   ├── custom_app_bar.dart
│   │   └── ...
│   └── view/
│       └── pages/
│           └── splash/
│               ├── splash_page.dart
│               ├── splash_bloc.dart
│               ├── splash_event.dart
│               └── splash_state.dart
│
├── native_bridge/                   # Flutter ↔ Native communication
│   ├── native_bridge.dart           # MethodChannel wrapper (@singleton)
│   └── native_response_model.dart
│
├── shared/                          # Cross-layer utilities
│   ├── common/
│   │   ├── error_converter.dart
│   │   └── error_entity/
│   │       ├── app_exception.dart
│   │       ├── error_entity.dart
│   │       ├── business_error_entity.dart
│   │       ├── network_error_entity.dart
│   │       └── validation_error_entity.dart
│   ├── constant/
│   │   └── app_constant.dart
│   ├── extension/
│   │   ├── context.dart
│   │   ├── string.dart
│   │   ├── number.dart
│   │   ├── text_style.dart
│   │   ├── widget.dart
│   │   └── ...
│   ├── service/
│   │   └── app_audio_service.dart
│   └── utils/
│       ├── app_log.dart
│       ├── app_toast.dart
│       ├── alert.dart
│       ├── debouncer.dart
│       ├── bloc_observer.dart
│       └── share_preference_utils.dart
│
└── gen/                             # Generated assets & fonts
    ├── assets.gen.dart
    └── fonts.gen.dart
```

---

## Architecture

```
┌─────────────────────────────────────────┐
│             Presentation                │
│   Pages · BLoCs · Widgets · Router      │
└─────────────────┬───────────────────────┘
                  │  UseCases
┌─────────────────▼───────────────────────┐
│               Domain                    │
│   Entities · Repositories (abstract)    │
│   UseCases                              │
└─────────────────┬───────────────────────┘
                  │  implements
┌─────────────────▼───────────────────────┐
│                Data                     │
│   Remote (Retrofit/Dio)                 │
│   Local  (Hive · SharedPreferences)     │
│   Repositories (impl)                   │
└─────────────────────────────────────────┘
```

### Data flow

1. **Page** dispatches an `Event` to its `BLoC`
2. **BLoC** calls a `UseCase`
3. **UseCase** calls the abstract `Repository`
4. **RepositoryImpl** fetches from remote or local, maps to entity
5. **BLoC** emits a new `State` → UI rebuilds

---

## Dependency Injection

Uses **GetIt** + **injectable** with code generation.

```dart
// lib/di/di.dart
final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
```

| Module | Registrations |
|---|---|
| `LocalModule` | `SharedPreferences` (@preResolve), `HiveInterface` (@preResolve) |
| `NetworkModule` | `Dio`, `ApiService`, `CookieJar`, interceptors |
| Auto-scanned | `*RepositoryImpl`, `*UseCase`, `*BLoC`, `HiveStoreHelper`, `PrefStoreHelper`, `NativeBridge`, `PreferenceUtils` |

---

## Key Dependencies

| Category | Package |
|---|---|
| State management | `flutter_bloc`, `equatable` |
| DI | `get_it`, `injectable` |
| Networking | `dio`, `retrofit`, `cookie_jar`, `dio_cookie_manager` |
| Local storage | `hive_ce`, `shared_preferences`, `flutter_secure_storage` |
| Routing | `auto_route` |
| Code generation | `freezed`, `json_serializable`, `build_runner` |
| UI | `flutter_screenutil`, `flutter_svg`, `cached_network_image`, `google_fonts` |
| Localization | `flutter_localizations`, `intl` |

---

## Code Generation

Run after any change to annotated files:

```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

| Annotation | Output file |
|---|---|
| `@JsonSerializable` | `*.g.dart` |
| `@freezed` | `*.freezed.dart` |
| `@injectable` / `@module` | `di/di.config.dart` |
| `@AutoRouterConfig` | `router/router.gr.dart` |
| `@HiveType` | `hive_registrar.g.dart` |

---

## Flavors

| Flavor | Description |
|---|---|
| `dev` | Development — debug logging enabled |
| `prod` | Production |

```bash
fvm flutter run --flavor dev
fvm flutter run --flavor prod
```

---

## Adding a New Feature

1. **Entity** — `domain/entities/`
2. **Repository interface** — `domain/repositories/`
3. **UseCase** — `domain/usecases/` extending `UseCase<T, P>`
4. **Remote model** — `data/remote/model/` with `@JsonSerializable`
5. **API endpoint** — `data/remote/services/api_service.dart`
6. **Repository impl** — `data/repositories/` with `@Injectable(as: ...)`
7. **Page + BLoC** — `presentation/view/pages/` extending `BasePage` / `BaseBloc`
8. **Route** — register in `presentation/router/router.dart`
9. **Run build\_runner**
