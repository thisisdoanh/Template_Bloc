clean:
	fvm flutter clean

pub-get:
	fvm flutter pub get

pub-upgrade:
	fvm flutter pub upgrade --major-versions

build-runner-delete:
	fvm dart run build_runner build -d

gen-l10n:
	fvm flutter gen-l10n

gen-flavor:
	fvm flutter pub run flutter_flavorizr

gen-assets:
	fvm fluttergen -c pubspec.yaml

build-apk-dev:
	fvm flutter build apk --flavor dev

build-apk-prod:
	fvm flutter build apk --flavor prod

build-appbundle-prod:
	fvm flutter build aab --flavor prod

# First ensure flutter_gen is globally activated
active-gen:
	fvm dart pub global activate flutter_gen

# Generate assets using flutter_gen
flutter-gen:
	fvm dart pub global run flutter_gen:flutter_gen_command

remove_unused_imports:
	fvm dart fix --apply --code=unused_import

fix_all:
	fvm dart fix --apply

reset:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter gen-l10n
	fvm dart run build_runner build -d

# Generate a new module with the given name
# Usage: make gen-module-windows MODULE=$module_name
gen-module-windows:
	@powershell -ExecutionPolicy Bypass -File gen-module.ps1 -MODULE $(MODULE)

# Usage: make gen-module-mac $module_name
gen-module-mac:
	chmod +x gen_module.sh
	./gen_module.sh $(MODULE)

build_apk_dev:
ifeq ($(OS),Windows_NT)
	@echo "Running on Windows (PowerShell)"
	@powershell -ExecutionPolicy Bypass -File ./build_config/build_android.ps1 -FLAVOR "dev" -ENTRYPOINT "lib/main.dart"
else
	@echo "Running on Unix (macOS/Linux)"
	@chmod +x ./build_config/build_android.sh
	@./build_config/build_android.sh "dev" "lib/main.dart"
endif

build_apk_prod:
ifeq ($(OS),Windows_NT)
	@echo "Running on Windows (PowerShell)"
	@powershell -ExecutionPolicy Bypass -File ./build_config/build_android.ps1 -FLAVOR "prod" -ENTRYPOINT "lib/main.dart"
else
	@echo "Running on Unix (macOS/Linux)"
	@chmod +x ./build_config/build_android.sh
	@./build_config/build_android.sh "prod" "lib/main.dart"
endif

create_new_page:
	fvm dart run cli_tool/bin/cli_tool.dart