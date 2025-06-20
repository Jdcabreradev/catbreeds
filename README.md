# 🐱 CatBreeds

<div align="center">
  <img src="assets/imgs/cat-small.png" alt="CatBreeds Logo" width="80" height="80">
  <h3>Discover the World of Cat Breeds</h3>
  <p>A beautiful Flutter app to explore different cat breeds with detailed information and stunning images</p>
</div>

---

## ✨ Features

### 🔍 **Search & Browse**
- Browse through a comprehensive list of cat breeds
- Real-time search functionality with debounced input
- Infinite scroll with pagination for smooth browsing experience
- Beautiful empty state when no results are found

### 📱 **Modern UI/UX**
- Clean and intuitive material design
- Smooth hero animations between screens
- Responsive card-based layout
- Beautiful gradient backgrounds
- Blur effects and glass morphism elements

### 📊 **Detailed Breed Information**
- Comprehensive breed descriptions
- Visual rating system for breed characteristics:
  - Affection Level
  - Intelligence
  - Energy Level
  - Adaptability
  - Child Friendly
  - Grooming Requirements
  - Shedding Level
  - Social Needs
  - Stranger Friendly
  - Dog Friendly
  - Hypoallergenic
  - Health Issues
- Weight specifications (metric/imperial)
- Life span information
- Country of origin
- Temperament details

### 🖼️ **Rich Media**
- High-quality breed images from The Cat API
- Cached image loading for better performance
- Fallback images for breeds without photos
- Image loading indicators

### ⚡ **Performance**
- State management with Riverpod
- Efficient API calls with pagination
- Image caching for optimal performance
- Debounced search to reduce API calls

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (latest stable version)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
- Android Studio / VS Code with Flutter extensions
- A device or emulator for testing

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/catbreeds.git
   cd catbreeds
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **API Configuration**
   
   The app uses [The Cat API](https://thecatapi.com/) to fetch breed data. The API key is already configured in `lib/env/env.dart`, but you can replace it with your own if needed:
   
   ```dart
   final API_KEY = "your_api_key_here";
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Building for Release

#### Android
```bash
flutter build apk --release
# or for app bundle
flutter build appbundle --release
```

#### iOS
```bash
flutter build ios --release
```

### Project Structure

```
lib/
├── env/                    # Environment configuration
├── models/                 # Data models
├── router/                 # Navigation configuration
├── screens/               # App screens
│   ├── main/              # Home screen with breed list
│   └── details/           # Breed details screen
├── services/              # API services
├── shared/                # Shared widgets
├── state/                 # State management
└── theme/                 # App theming
```

---

## 🛠️ Built With

- **[Flutter](https://flutter.dev/)** - UI framework
- **[Riverpod](https://riverpod.dev/)** - State management
- **[Go Router](https://pub.dev/packages/go_router)** - Navigation
- **[Dio](https://pub.dev/packages/dio)** - HTTP client
- **[Cached Network Image](https://pub.dev/packages/cached_network_image)** - Image caching
- **[Animate Do](https://pub.dev/packages/animate_do)** - Animations
- **[The Cat API](https://thecatapi.com/)** - Cat breed data

---

## 🎨 Design Features

- **Gradient Backgrounds**: Beautiful linear gradients throughout the app
- **Hero Animations**: Smooth transitions between screens
- **Card-based UI**: Modern card design with shadows and rounded corners
- **Rating System**: Visual star ratings for breed characteristics
- **Responsive Design**: Adapts to different screen sizes
- **Loading States**: Elegant loading indicators and shimmer effects

---

## 🔧 Configuration

### Customizing the API
To use your own Cat API key:

1. Sign up at [The Cat API](https://thecatapi.com/)
2. Get your API key
3. Replace the key in `lib/env/env.dart`

### Modifying Pagination
You can adjust the number of items loaded per page in `lib/state/cat_list_state.dart`:

```dart
CatListNotifier(this._service, [this._limit = 10]) // Change 10 to your preferred number
```

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Attributions

### Icons
- <a href="https://www.flaticon.com/free-icons/cat" title="cat icons">Cat icons created by Freepik - Flaticon</a>
- <a href="https://www.flaticon.com/free-icons/pets" title="pets icons">Pets icons created by Marz Gallery - Flaticon</a>
- <a href="https://www.flaticon.com/free-icons/cat-toy" title="cat toy icons">Cat toy icons created by Mihimihi - Flaticon</a>

### API
- [The Cat API](https://thecatapi.com/) for providing comprehensive cat breed data

---

<div align="center">
  <p>Made with ❤️ and Flutter</p>
  <p>Happy coding! 🐱</p>
</div>