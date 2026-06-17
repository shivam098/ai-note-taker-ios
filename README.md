# AI Note Taker — iOS

Native iPhone app (Swift + SwiftUI) for AI Note Taker — a tasks + notes +
nested lists app with a dark, violet-accented design.

## Tech stack
- **Swift 5** + **SwiftUI** (iOS 17+)
- **Observation** framework (`@Observable Store`) for state
- **Offline-first** local persistence (Codable → JSON in Application Support)
- Value-based navigation with `NavigationStack`

## Features (scaffold)
- Lists overview with open-task counts
- List detail: tasks, completed section, inline add
- Task detail: editable title + notes, **nested subtasks**, delete
- Seeded sample data; everything is free (no paywall)

## Build & run (on a Mac)
The Xcode project is generated from `project.yml` with **XcodeGen**, so the
repo stays clean. To open it:

```bash
brew install xcodegen        # one-time
cd ai-note-taker-ios
xcodegen generate            # creates AINoteTaker.xcodeproj
open AINoteTaker.xcodeproj   # then press Run in Xcode
```

### No XcodeGen? Alternative
1. In Xcode: File ▸ New ▸ Project ▸ iOS App (SwiftUI, name "AINoteTaker").
2. Delete the default `ContentView.swift` / `App.swift`.
3. Drag everything in `Sources/` into the project.
4. Set the deployment target to iOS 17 and press Run.

## Project layout
```
project.yml                 # XcodeGen spec
Sources/
  AINoteTakerApp.swift       # @main App + RootView
  Models.swift               # TaskList, TaskItem, Route
  Store.swift                # @Observable store + JSON persistence
  Theme.swift                # dark + violet colors
  Components.swift           # CheckButton
  HomeView.swift             # lists overview
  ListDetailView.swift       # tasks in a list
  TaskDetailView.swift       # title, notes, nested subtasks
```

## Roadmap
- Quick-add sheet (Task / List / Voice), due dates, reminders
- AI features (voice → tasks, summaries) — needs an AI API key
- Cloud sync & sharing
- Shares a design language with the Android and macOS apps
