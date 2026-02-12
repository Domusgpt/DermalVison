# DermalVision Implementation Baseline

This repository now includes a **tool bootstrap + Phase 0 starter app** baseline so implementation can begin immediately in constrained dev containers.

## What was added

1. **Tool installer** (`tools/bootstrap/install_dev_tools.sh`)
   - Installs Flutter SDK (3.24.5) into repo-local `.toolcache/`.
   - Installs Google Cloud SDK into repo-local `.toolcache/`.
   - Installs Firebase CLI globally via npm when absent.
   - Prints PATH exports required to use repo-local SDKs.

2. **Prerequisite checker** (`tools/bootstrap/check_prereqs.sh`)
   - Validates required CLIs from the implementation prompt (`flutter`, `dart`, `firebase`, `gcloud`, `node`, `npm`, `python3`, `pip`).
   - Supports both globally installed binaries and repo-local `.toolcache` binaries.
   - Reports optional platform tools (`java`, `pod`) and exits non-zero when required dependencies are missing.

3. **Phase DAG executor** (`tools/bootstrap/phase_executor.py`)
   - Encodes key Phase 0 tasks and dependencies.
   - Produces execution waves to identify tasks that can run in parallel.
   - Detects dependency cycles early to prevent invalid plans.

4. **Planner tests** (`tests/test_phase_executor.py`)
   - Verifies the auth/router wiring occurs only after required prerequisites.
   - Verifies cycle detection for invalid dependency graphs.

5. **Phase 0 starter Flutter app** (`dermalvision/`)
   - Flutter project scaffold with Android, iOS, and web support.
   - Material 3 dark theme tokens and ThemeData scaffold.
   - Basic Riverpod + GoRouter wiring with auth redirect and onboarding/home placeholders.
   - Widget tests for boot flow and login → onboarding → home navigation.

6. **Binary asset restore utility** (`tools/bootstrap/restore_flutter_binary_assets.sh`)
   - Regenerates Flutter default platform binary assets removed from VCS for cloud-terminal compatibility.
   - Restores Android/iOS/Web generated icon/splash binaries using `flutter create . --platforms android,ios,web`.

## Runbook

```bash
./tools/bootstrap/install_dev_tools.sh
export PATH="$(pwd)/.toolcache/flutter/bin:$(pwd)/.toolcache/google-cloud-sdk/bin:$PATH"

./tools/bootstrap/check_prereqs.sh
python3 tools/bootstrap/phase_executor.py
python3 -m pytest tests/test_phase_executor.py

# Restore generated binary assets when needed locally
./tools/bootstrap/restore_flutter_binary_assets.sh

cd dermalvision
flutter pub get
flutter analyze --no-fatal-infos
flutter test
```

## Next step

Run `flutterfire configure --project=dermalvision-prod` inside `dermalvision/`, then replace the temporary auth state provider with real Firebase Auth providers and complete Phase 0 Track B integration.
