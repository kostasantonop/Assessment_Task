📰 iOS Headlines & Games App

A Swift-based iOS application demonstrating MVI architecture, reactive UI updates, and API integration.
The app displays horizontaly the headlines and verticaly the games data in a dynamic interface using a CarouselView and ScrollView combinations, auto-refreshing timers, and periodic content updates.

📋 Task Objectives

- LoginScreen — Handles user authentication.
- HeadlinesCell → Horizontal carousel view
- GamesCell → Vertical content
- Dynamic time labels that update every second.
- Low polling method: refresh data every 10 seconds.
- Auto-scrolling headlines every 5 seconds.
- iOS 15.0+ minimum deployment target.

🧰 Basic structure

- Architecture: MVI (Model–View–Intent)
-UI: SwiftUI
- Reactive State: ObservedObject container
- Async Handling: PromiseKit
- Networking: URLSession-based requests 


⏱️ Periodic Updates

- Every 1 second: update elapsed time labels of the vertical game view.
- Every 5 seconds: auto-scroll horizontal view to the next headline.
- Every 10 seconds: fetch updates from: /updatedGames, /updatedHeadlines


⚠️ Known Bugs

- Memory leak: caused by tasks being created in an infinite loop.
- Token persistence: the authentication token isn’t stored locally, so a new one is requested on every relaunch.


🚀 Future Improvements

- Add a better place and way to call upon the auth token API
- Add Dark Mode support.
- Show error pop-ups for failed API requests.
- Persist auth token using Keychain or UserDefaults.
- Improve UI/UX styling and animations.
