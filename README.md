# ObiletClone - iOS Travel Booking Application

<div align="center">

![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS%2015+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.9+-red.svg)
![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

### Language / Dil
**[English](#english)** | **[Türkçe](#turkish)**

---

## English

A modern iOS travel booking application built with SwiftUI, replicating the popular Obilet interface for bus, flight, and travel ticket reservations.

[Features](#features) • [Architecture](#architecture) • [Installation](#installation) • [Screenshots](#screenshots) • [Tech Stack](#tech-stack)

</div>

---

## 📋 Overview

ObiletClone is a SwiftUI-based iOS application that recreates the user interface and user experience of Obilet, Turkey's leading online ticket sales platform. The app demonstrates modern iOS development practices, including responsive design, custom components, and smooth animations, making it an excellent showcase of SwiftUI capabilities for travel and booking applications.

This project focuses on creating a pixel-perfect UI clone while implementing the core user flows for searching, browsing, and booking travel tickets across multiple transportation modes including bus, plane, and ferry services.

## 🎯 Project Goals

The primary objectives of this clone project are:

1. **UI/UX Replication**: Accurately recreate Obilet's modern, user-friendly interface
2. **SwiftUI Mastery**: Demonstrate advanced SwiftUI techniques and patterns
3. **Component Library**: Build reusable, customizable UI components
4. **Responsive Design**: Ensure compatibility across all iPhone screen sizes
5. **Clean Architecture**: Implement maintainable and scalable code structure
6. **Performance**: Achieve smooth animations and fast loading times

## ✨ Features

### 🎫 Ticket Search & Booking
- **Multi-Modal Transportation**: Search for bus, flight, and ferry tickets
- **Smart Search**: Origin and destination selection with autocomplete
- **Date Picker**: Intuitive calendar interface for travel date selection
- **Passenger Count**: Dynamic passenger selection (adults, children, students)
- **Round Trip Support**: Options for one-way or round-trip journeys
- **Real-time Availability**: Check seat/ticket availability instantly

### 🚌 Transportation Options
- **Bus Services**: 
  - Long-distance intercity buses
  - Multiple bus companies
  - Seat selection with detailed bus layouts
- **Flight Services**:
  - Domestic and international flights
  - Airline comparisons
  - Flexible booking options
- **Ferry Services**:
  - Sea transportation routes
  - Vehicle transport options

### 🔍 Search & Filter
- **Advanced Filters**: Filter by price, departure time, duration, company
- **Sorting Options**: Sort by price, duration, departure time, rating
- **Company Filter**: Select preferred transportation companies
- **Amenities Filter**: Filter by bus features (WiFi, power outlets, etc.)
- **Direct Routes**: Option to show only direct routes

### 🎨 User Interface
- **Modern Design**: Clean, intuitive interface matching Obilet's aesthetic
- **Custom Components**: 
  - Custom navigation bars
  - Animated transitions
  - Interactive cards
  - Bottom sheets
- **Tab Navigation**: Easy access to home, search, orders, and profile
- **Responsive Layout**: Adapts to all iPhone screen sizes
- **Dark Mode Support**: Seamless dark/light theme switching
- **Smooth Animations**: Polished transitions and micro-interactions

### 📱 Additional Features
- **Campaign Banners**: Display promotional offers and discounts
- **Popular Routes**: Quick access to frequently traveled routes
- **Recent Searches**: View and repeat previous searches
- **Price Alerts**: (Planned) Notifications for price drops
- **Order History**: View past bookings and reservations
- **QR Code Tickets**: Digital ticket display with QR codes

---

## 🏗️ Architecture

ObiletClone follows the MVVM (Model-View-ViewModel) architecture pattern with clean separation of concerns:

```
┌─────────────────────────────────────────────────────┐
│                  Views (SwiftUI)                     │
│   HomeView, SearchView, ResultsView, DetailView     │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                   ViewModels                         │
│   SearchViewModel, ResultsViewModel, BookingVM      │
│              (Business Logic Layer)                  │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                    Models                            │
│    Journey, Ticket, Location, Company, Passenger    │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                  Services                            │
│        SearchService, BookingService, API Client     │
└──────────────────────────────────────────────────────┘
```

### Key Components

#### 1. **Views**
- **HomeView**: Main landing page with quick search and campaigns
- **SearchView**: Detailed search interface with filters
- **ResultsView**: List of available journeys with sorting
- **DetailView**: Journey details with seat selection
- **BookingView**: Passenger information and payment
- **ProfileView**: User account and order history

#### 2. **ViewModels**
```swift
class SearchViewModel: ObservableObject {
    @Published var origin: Location?
    @Published var destination: Location?
    @Published var departureDate: Date
    @Published var returnDate: Date?
    @Published var passengers: PassengerCount
    @Published var transportationType: TransportType
    
    func searchJourneys() async throws -> [Journey]
    func validateSearch() -> Bool
}
```

#### 3. **Models**
```swift
struct Journey: Identifiable, Codable {
    let id: UUID
    let origin: Location
    let destination: Location
    let departureTime: Date
    let arrivalTime: Date
    let duration: TimeInterval
    let company: Company
    let price: Price
    let availableSeats: Int
    let features: [Feature]
}

struct Location: Identifiable, Codable {
    let id: UUID
    let name: String
    let city: String
    let type: LocationType
    let coordinates: Coordinates?
}

enum TransportType: String, CaseIterable {
    case bus = "Otobüs"
    case flight = "Uçak"
    case ferry = "Feribot"
}
```

#### 4. **Custom Components**
- **SearchBar**: Custom search input with location suggestions
- **DatePicker**: Calendar view for date selection
- **PassengerSelector**: Counter for passenger types
- **JourneyCard**: Journey information display card
- **FilterSheet**: Bottom sheet with filter options
- **SeatLayout**: Interactive bus seat selection grid

---

## 🚀 Installation

### Prerequisites

- **Xcode 14+**
- **iOS 15.0+**
- **Swift 5.9+**
- **macOS 12.0+** (for development)

### Setup Steps

1. **Clone the Repository**
```bash
git clone https://github.com/malisevdinoglu/ObiletClone_SwiftUI.git
cd ObiletClone_SwiftUI
```

2. **Open in Xcode**
```bash
open ObiletClone.xcodeproj
```

3. **Configure Signing**
   - Select your development team in `Signing & Capabilities`
   - Update Bundle Identifier if needed
   - Ensure your device is registered

4. **Build and Run**
   - Select iOS 15+ Simulator or physical device
   - Press `Cmd + R` to build and run
   - Wait for initial build to complete

### Optional: API Integration

If you want to integrate with a real backend:

1. Create `Config.swift` in the project
2. Add your API endpoint:
```swift
enum Config {
    static let baseURL = "https://your-api-endpoint.com"
    static let apiKey = "your-api-key"
}
```

3. Update network service to use real endpoints

---

## 📱 Usage

### Searching for Tickets

#### 1. **Select Transportation Type**
- Tap on Bus, Flight, or Ferry tab at the top
- Each mode shows relevant search options

#### 2. **Enter Journey Details**
```
Origin: Istanbul
Destination: Ankara
Date: Select from calendar
Passengers: 1 Adult
```

#### 3. **Search**
- Tap "Bilet Bul" (Find Ticket) button
- View available journeys in results list

### Filtering Results

#### 1. **Apply Filters**
- Tap filter icon at top right
- Select criteria:
  - Departure time range
  - Price range
  - Companies
  - Amenities (WiFi, AC, etc.)

#### 2. **Sort Results**
- Tap sort icon
- Choose sorting:
  - Price (Low to High)
  - Duration (Shortest)
  - Departure Time (Earliest)
  - Arrival Time

### Booking a Ticket

#### 1. **Select Journey**
- Tap on preferred journey card
- Review journey details

#### 2. **Select Seat** (Bus only)
- Choose seat from interactive layout
- View seat features (window, aisle, etc.)

#### 3. **Enter Passenger Info**
- Fill passenger details
- Add contact information

#### 4. **Payment** (UI Only)
- Mock payment screen
- Complete booking flow

---

## 🛠️ Tech Stack

| Category | Technology | Purpose |
|----------|-----------|---------|
| **UI Framework** | SwiftUI | Modern declarative UI |
| **Architecture** | MVVM | Clean separation of concerns |
| **Programming Language** | Swift 5.9+ | Type-safe iOS development |
| **Concurrency** | Async/Await | Asynchronous operations |
| **State Management** | Combine, @Published | Reactive state updates |
| **Navigation** | NavigationStack | Modern navigation system |
| **Data Persistence** | UserDefaults | Local data storage |
| **Networking** | URLSession | API communication |
| **Design Patterns** | Repository, Factory | Code organization |

### Swift Features Used
- **SwiftUI**: Declarative UI framework
- **Combine**: Reactive programming
- **Async/Await**: Modern concurrency
- **Property Wrappers**: @State, @Binding, @ObservedObject
- **View Builders**: Custom container views
- **Custom Modifiers**: Reusable view styling
- **Enums with Associated Values**: Type-safe data modeling

---

## 📂 Project Structure

```
ObiletClone/
├── ObiletCloneApp.swift        # App entry point
│
├── Views/
│   ├── Home/
│   │   ├── HomeView.swift           # Main landing page
│   │   ├── CampaignBannerView.swift # Promotional banners
│   │   └── PopularRoutesView.swift  # Quick route access
│   │
│   ├── Search/
│   │   ├── SearchView.swift         # Search interface
│   │   ├── LocationPickerView.swift # Origin/destination picker
│   │   ├── DatePickerView.swift     # Calendar view
│   │   └── PassengerPickerView.swift # Passenger counter
│   │
│   ├── Results/
│   │   ├── ResultsView.swift        # Journey results list
│   │   ├── JourneyCardView.swift    # Journey card component
│   │   ├── FilterSheetView.swift    # Filter options
│   │   └── SortOptionsView.swift    # Sort selection
│   │
│   ├── Detail/
│   │   ├── JourneyDetailView.swift  # Journey details
│   │   ├── SeatSelectionView.swift  # Bus seat picker
│   │   └── CompanyInfoView.swift    # Company details
│   │
│   ├── Booking/
│   │   ├── BookingView.swift        # Booking form
│   │   ├── PassengerFormView.swift  # Passenger info
│   │   └── PaymentView.swift        # Payment screen
│   │
│   └── Profile/
│       ├── ProfileView.swift        # User profile
│       ├── OrderHistoryView.swift   # Past bookings
│       └── SettingsView.swift       # App settings
│
├── ViewModels/
│   ├── SearchViewModel.swift       # Search logic
│   ├── ResultsViewModel.swift      # Results management
│   ├── BookingViewModel.swift      # Booking process
│   └── ProfileViewModel.swift      # User data
│
├── Models/
│   ├── Journey.swift              # Journey data model
│   ├── Location.swift             # Location/city model
│   ├── Company.swift              # Bus/airline company
│   ├── Passenger.swift            # Passenger details
│   ├── Booking.swift              # Booking information
│   └── Enums.swift                # Transport types, etc.
│
├── Services/
│   ├── SearchService.swift        # Search API calls
│   ├── BookingService.swift       # Booking operations
│   ├── LocationService.swift      # Location data
│   └── NetworkManager.swift       # Base API client
│
├── Components/
│   ├── CustomSearchBar.swift      # Reusable search bar
│   ├── LoadingView.swift          # Loading indicator
│   ├── ErrorView.swift            # Error display
│   └── EmptyStateView.swift       # Empty state
│
├── Utilities/
│   ├── Extensions/
│   │   ├── Color+Extension.swift   # Custom colors
│   │   ├── Date+Extension.swift    # Date formatting
│   │   └── View+Extension.swift    # View modifiers
│   ├── Constants.swift             # App constants
│   └── Helpers.swift               # Helper functions
│
└── Resources/
    ├── Assets.xcassets            # Images, colors, icons
    ├── Localizable.strings        # Turkish localization
    └── Info.plist                 # App configuration
```

---

## 🎨 Design System

### Color Palette

```swift
extension Color {
    // Primary Colors
    static let obiletOrange = Color(hex: "E74C3C")
    static let obiletBlue = Color(hex: "3498DB")
    
    // Background Colors
    static let backgroundPrimary = Color(hex: "FFFFFF")
    static let backgroundSecondary = Color(hex: "F8F9FA")
    static let cardBackground = Color(hex: "FFFFFF")
    
    // Text Colors
    static let textPrimary = Color(hex: "2C3E50")
    static let textSecondary = Color(hex: "7F8C8D")
    static let textTertiary = Color(hex: "BDC3C7")
    
    // Accent Colors
    static let success = Color(hex: "27AE60")
    static let warning = Color(hex: "F39C12")
    static let error = Color(hex: "E74C3C")
}
```

### Typography

```swift
extension Font {
    // Headers
    static let headerLarge = Font.system(size: 28, weight: .bold)
    static let headerMedium = Font.system(size: 22, weight: .semibold)
    static let headerSmall = Font.system(size: 18, weight: .semibold)
    
    // Body
    static let bodyLarge = Font.system(size: 16, weight: .regular)
    static let bodyMedium = Font.system(size: 14, weight: .regular)
    static let bodySmall = Font.system(size: 12, weight: .regular)
    
    // Special
    static let priceFont = Font.system(size: 24, weight: .bold)
    static let buttonFont = Font.system(size: 16, weight: .semibold)
}
```

### Spacing & Layout

```swift
enum Spacing {
    static let xs: CGFloat = 4
    static let sm: CGFloat = 8
    static let md: CGFloat = 16
    static let lg: CGFloat = 24
    static let xl: CGFloat = 32
}

enum CornerRadius {
    static let small: CGFloat = 8
    static let medium: CGFloat = 12
    static let large: CGFloat = 16
}
```

---

## 🔧 Configuration

### Transportation Types

```swift
enum TransportType: String, CaseIterable {
    case bus = "Otobüs"
    case flight = "Uçak"
    case ferry = "Feribot"
    
    var icon: String {
        switch self {
        case .bus: return "bus"
        case .flight: return "airplane"
        case .ferry: return "ferry"
        }
    }
}
```

### Search Parameters

```swift
struct SearchParameters {
    var origin: Location
    var destination: Location
    var departureDate: Date
    var returnDate: Date?
    var passengerCount: PassengerCount
    var transportType: TransportType
    var filters: SearchFilters?
}

struct PassengerCount {
    var adults: Int = 1
    var children: Int = 0
    var students: Int = 0
    
    var total: Int { adults + children + students }
}
```

---

## 🎯 Features Implementation

### Search Flow

```swift
// 1. User enters search details
@State private var origin: Location?
@State private var destination: Location?
@State private var date: Date = Date()

// 2. Validate inputs
func validateSearch() -> Bool {
    guard origin != nil, destination != nil else {
        showAlert("Please select origin and destination")
        return false
    }
    return true
}

// 3. Perform search
Task {
    do {
        let results = try await searchService.search(
            from: origin,
            to: destination,
            on: date
        )
        self.journeys = results
    } catch {
        showError(error)
    }
}
```

### Journey Card Component

```swift
struct JourneyCardView: View {
    let journey: Journey
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                CompanyLogo(company: journey.company)
                Spacer()
                PriceTag(price: journey.price)
            }
            
            HStack {
                TimeLocation(time: journey.departureTime, 
                           location: journey.origin)
                DurationIndicator(duration: journey.duration)
                TimeLocation(time: journey.arrivalTime,
                           location: journey.destination)
            }
            
            FeatureRow(features: journey.features)
        }
        .padding()
        .background(Color.cardBackground)
        .cornerRadius(CornerRadius.medium)
        .shadow(radius: 2)
    }
}
```

---

## 🐛 Troubleshooting

### Common Issues

**Problem**: App crashes on launch
**Solution**: 
- Ensure Xcode 14+ is installed
- Clean build folder (Cmd + Shift + K)
- Verify deployment target is iOS 15+

**Problem**: Images not displaying
**Solution**:
- Check Assets.xcassets for missing images
- Verify image names match code references
- Ensure images are included in target

**Problem**: Colors look different on device
**Solution**:
- Check color space in Assets
- Test on both light and dark modes
- Verify Color assets use sRGB color space

**Problem**: Date picker not showing correctly
**Solution**:
- Ensure proper date formatting
- Check locale settings
- Verify calendar component initialization

**Problem**: Search not returning results
**Solution**:
- Currently uses mock data
- Implement real API integration for live results
- Check network permissions if using real API

---

## 🗺️ Roadmap

### Planned Features

- [ ] **Real API Integration** with Obilet/similar service
- [ ] **User Authentication** (Sign up, Login, Social login)
- [ ] **Payment Integration** (Credit card, Apple Pay)
- [ ] **Seat Selection** animation and details
- [ ] **Price Tracking** and notifications
- [ ] **Multi-language Support** (English, Turkish)
- [ ] **Offline Mode** with cached data
- [ ] **Push Notifications** for booking updates
- [ ] **QR Code Generation** for tickets
- [ ] **Apple Wallet Integration**
- [ ] **iPad Support** with adaptive layouts
- [ ] **watchOS Companion App**
- [ ] **Widget** for quick search
- [ ] **Share Journey** with friends
- [ ] **Review & Rating** system for companies
- [ ] **Accessibility** improvements (VoiceOver, Dynamic Type)

### UI/UX Improvements

- [ ] Advanced animations and transitions
- [ ] Skeleton loading screens
- [ ] Pull-to-refresh functionality
- [ ] Haptic feedback
- [ ] Interactive seat maps
- [ ] Journey comparison view
- [ ] Price calendar view
- [ ] Recent searches history
- [ ] Favorite routes
- [ ] Flexible date search

### Technical Improvements

- [ ] Unit tests coverage
- [ ] UI tests automation
- [ ] Performance optimization
- [ ] Better error handling
- [ ] Caching strategy
- [ ] Analytics integration
- [ ] Crash reporting
- [ ] A/B testing framework

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 Erdem Maliş

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

---

## 🤝 Contributing

This is an educational project demonstrating SwiftUI capabilities. Contributions are welcome!

### How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Contribution Guidelines

- Follow Swift API Design Guidelines
- Maintain consistent code style
- Add comments for complex logic
- Update documentation for new features
- Test on multiple iOS versions
- Ensure UI works on all iPhone sizes

---

## ⚠️ Disclaimer

This project is an educational clone created for portfolio and learning purposes. It is **not affiliated with, endorsed by, or connected to Obilet or any of its subsidiaries**. All trademarks, logos, and brand names are the property of their respective owners.

This project does not:
- Use real Obilet APIs
- Process real transactions
- Store user payment information
- Represent an official Obilet application

For actual ticket booking, please use the official Obilet application or website at [www.obilet.com](https://www.obilet.com).

---

## 🙏 Acknowledgments

- **Obilet**: Inspiration for UI/UX design
- **SwiftUI Community**: Tutorials and best practices
- **Apple**: SwiftUI framework and documentation
- **iOS Design Patterns**: Architecture guidance

---

## 📧 Contact

**Developer**: Mehmet Ali Sevdinoglu

- GitHub: [@malisevdinoglu](https://github.com/malisevdinoglu)
- LinkedIn: [Mehmet Ali Sevdinoglu](https://linkedin.com/in/erdem-malis)
- Email: [Contact via GitHub](https://github.com/malisevdinoglu)

---

<div align="center">

**⭐ If you find this project useful, please consider giving it a star!**

Made with 💻 and ☕ by [Erdem Maliş](https://github.com/malisevdinoglu)

**Educational Project - SwiftUI UI Clone**

</div>

---
---
---

<div id="turkish"></div>

# ObiletClone - iOS Seyahat Rezervasyon Uygulaması

<div align="center">

![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS%2015+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.9+-red.svg)
![Platform](https://img.shields.io/badge/Platform-iOS-lightgrey.svg)
![License](https://img.shields.io/badge/Lisans-MIT-green.svg)

**[English](#english)** | **[Türkçe](#turkish)**

SwiftUI ile geliştirilmiş, otobüs, uçak ve seyahat bileti rezervasyonları için popüler Obilet arayüzünü yeniden oluşturan modern bir iOS seyahat rezervasyon uygulaması.

[Özellikler](#özellikler-tr) • [Mimari](#mimari-tr) • [Kurulum](#kurulum-tr) • [Ekran Görüntüleri](#ekran-görüntüleri-tr) • [Teknoloji Yığını](#teknoloji-yığını-tr)

</div>

---

## 📋 Genel Bakış

ObiletClone, Türkiye'nin önde gelen online bilet satış platformu Obilet'in kullanıcı arayüzünü ve kullanıcı deneyimini yeniden oluşturan SwiftUI tabanlı bir iOS uygulamasıdır. Uygulama, duyarlı tasarım, özel bileşenler ve akıcı animasyonlar dahil olmak üzere modern iOS geliştirme uygulamalarını göstermekte ve seyahat ve rezervasyon uygulamaları için SwiftUI yeteneklerinin mükemmel bir vitrini olmaktadır.

Bu proje, otobüs, uçak ve feribot hizmetleri dahil olmak üzere birden fazla ulaşım modu için seyahat bileti arama, gezinme ve rezervasyon yapma için temel kullanıcı akışlarını uygularken piksel mükemmel bir UI klonu oluşturmaya odaklanır.

## 🎯 Proje Hedefleri

Bu klon projenin temel amaçları:

1. **UI/UX Replikasyonu**: Obilet'in modern, kullanıcı dostu arayüzünü doğru bir şekilde yeniden oluşturmak
2. **SwiftUI Ustalığı**: Gelişmiş SwiftUI tekniklerini ve desenlerini göstermek
3. **Bileşen Kütüphanesi**: Yeniden kullanılabilir, özelleştirilebilir UI bileşenleri oluşturmak
4. **Duyarlı Tasarım**: Tüm iPhone ekran boyutlarında uyumluluk sağlamak
5. **Temiz Mimari**: Sürdürülebilir ve ölçeklenebilir kod yapısı uygulamak
6. **Performans**: Akıcı animasyonlar ve hızlı yükleme süreleri elde etmek

## ✨ Özellikler {#özellikler-tr}

### 🎫 Bilet Arama ve Rezervasyon
- **Çok Modlu Ulaşım**: Otobüs, uçak ve feribot bileti arama
- **Akıllı Arama**: Otomatik tamamlama ile kalkış ve varış noktası seçimi
- **Tarih Seçici**: Seyahat tarihi seçimi için sezgisel takvim arayüzü
- **Yolcu Sayısı**: Dinamik yolcu seçimi (yetişkin, çocuk, öğrenci)
- **Gidiş-Dönüş Desteği**: Tek yön veya gidiş-dönüş seyahat seçenekleri
- **Gerçek Zamanlı Müsaitlik**: Koltuk/bilet müsaitliğini anında kontrol edin

### 🚌 Ulaşım Seçenekleri
- **Otobüs Hizmetleri**: 
  - Uzun mesafe şehirlerarası otobüsler
  - Birden fazla otobüs firması
  - Detaylı otobüs düzenleri ile koltuk seçimi
- **Uçuş Hizmetleri**:
  - İç ve dış hat uçuşlar
  - Havayolu karşılaştırmaları
  - Esnek rezervasyon seçenekleri
- **Feribot Hizmetleri**:
  - Deniz ulaşım rotaları
  - Araç taşıma seçenekleri

### 🔍 Arama ve Filtreleme
- **Gelişmiş Filtreler**: Fiyat, kalkış saati, süre, firma ile filtrele
- **Sıralama Seçenekleri**: Fiyat, süre, kalkış saati, değerlendirme sıralaması
- **Firma Filtresi**: Tercih edilen ulaşım firmalarını seçin
- **Ekipman Filtresi**: Otobüs özelliklerine göre filtrele (WiFi, priz vb.)
- **Direkt Rotalar**: Sadece direkt rotaları gösterme seçeneği

### 🎨 Kullanıcı Arayüzü
- **Modern Tasarım**: Obilet'in estetiğine uygun temiz, sezgisel arayüz
- **Özel Bileşenler**: 
  - Özel navigasyon çubukları
  - Animasyonlu geçişler
  - Etkileşimli kartlar
  - Alt sayfalar
- **Sekme Navigasyonu**: Ana sayfa, arama, siparişler ve profile kolay erişim
- **Duyarlı Düzen**: Tüm iPhone ekran boyutlarına uyum sağlar
- **Koyu Mod Desteği**: Sorunsuz koyu/açık tema geçişi
- **Yumuşak Animasyonlar**: Cilalı geçişler ve mikro etkileşimler

### 📱 Ek Özellikler
- **Kampanya Banner'ları**: Promosyon teklifleri ve indirimler görüntüleme
- **Popüler Rotalar**: Sık seyahat edilen rotalara hızlı erişim
- **Son Aramalar**: Önceki aramaları görüntüle ve tekrarla
- **Fiyat Uyarıları**: (Planlanmış) Fiyat düşüşleri için bildirimler
- **Sipariş Geçmişi**: Geçmiş rezervasyonları görüntüle
- **QR Kodlu Biletler**: QR kod ile dijital bilet görüntüleme

---

## 🏗️ Mimari {#mimari-tr}

ObiletClone, endişelerin temiz ayrımı ile MVVM (Model-View-ViewModel) mimari desenini izler:

```
┌─────────────────────────────────────────────────────┐
│              Views (SwiftUI) - Görünümler            │
│   HomeView, SearchView, ResultsView, DetailView     │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                   ViewModels                         │
│   SearchViewModel, ResultsViewModel, BookingVM      │
│              (İş Mantığı Katmanı)                   │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                  Models - Modeller                   │
│    Journey, Ticket, Location, Company, Passenger    │
└─────────────────────┬───────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────┐
│                 Services - Servisler                 │
│        SearchService, BookingService, API Client     │
└──────────────────────────────────────────────────────┘
```

### Ana Bileşenler

#### 1. **Görünümler**
- **HomeView**: Hızlı arama ve kampanyalar ile ana açılış sayfası
- **SearchView**: Filtreli detaylı arama arayüzü
- **ResultsView**: Sıralama ile mevcut sefer listesi
- **DetailView**: Koltuk seçimi ile sefer detayları
- **BookingView**: Yolcu bilgileri ve ödeme
- **ProfileView**: Kullanıcı hesabı ve sipariş geçmişi

#### 2. **ViewModeller**
```swift
class SearchViewModel: ObservableObject {
    @Published var origin: Location?
    @Published var destination: Location?
    @Published var departureDate: Date
    @Published var returnDate: Date?
    @Published var passengers: PassengerCount
    @Published var transportationType: TransportType
    
    func searchJourneys() async throws -> [Journey]
    func validateSearch() -> Bool
}
```

#### 3. **Modeller**
```swift
struct Journey: Identifiable, Codable {
    let id: UUID
    let origin: Location
    let destination: Location
    let departureTime: Date
    let arrivalTime: Date
    let duration: TimeInterval
    let company: Company
    let price: Price
    let availableSeats: Int
    let features: [Feature]
}

struct Location: Identifiable, Codable {
    let id: UUID
    let name: String
    let city: String
    let type: LocationType
    let coordinates: Coordinates?
}

enum TransportType: String, CaseIterable {
    case bus = "Otobüs"
    case flight = "Uçak"
    case ferry = "Feribot"
}
```

#### 4. **Özel Bileşenler**
- **SearchBar**: Konum önerileri ile özel arama girişi
- **DatePicker**: Tarih seçimi için takvim görünümü
- **PassengerSelector**: Yolcu türleri için sayaç
- **JourneyCard**: Sefer bilgisi görüntüleme kartı
- **FilterSheet**: Filtre seçenekleri ile alt sayfa
- **SeatLayout**: Etkileşimli otobüs koltuk seçim ızgarası

---

## 🚀 Kurulum {#kurulum-tr}

### Ön Koşullar

- **Xcode 14+**
- **iOS 15.0+**
- **Swift 5.9+**
- **macOS 12.0+** (geliştirme için)

### Kurulum Adımları

1. **Depoyu Klonlayın**
```bash
git clone https://github.com/malisevdinoglu/ObiletClone_SwiftUI.git
cd ObiletClone_SwiftUI
```

2. **Xcode'da Açın**
```bash
open ObiletClone.xcodeproj
```

3. **İmzalamayı Yapılandırın**
   - `Signing & Capabilities` bölümünde geliştirme ekibinizi seçin
   - Gerekirse Bundle Identifier'ı güncelleyin
   - Cihazınızın kayıtlı olduğundan emin olun

4. **Derleyin ve Çalıştırın**
   - iOS 15+ Simülatör veya fiziksel cihaz seçin
   - Derlemek ve çalıştırmak için `Cmd + R` tuşlarına basın
   - İlk derlemenin tamamlanmasını bekleyin

### Opsiyonel: API Entegrasyonu

Gerçek bir backend ile entegre etmek isterseniz:

1. Projede `Config.swift` oluşturun
2. API endpoint'inizi ekleyin:
```swift
enum Config {
    static let baseURL = "https://sizin-api-endpoint.com"
    static let apiKey = "sizin-api-anahtariniz"
}
```

3. Gerçek endpoint'leri kullanmak için network servisini güncelleyin

---

## 📱 Kullanım

### Bilet Arama

#### 1. **Ulaşım Türünü Seçin**
- Üstteki Otobüs, Uçak veya Feribot sekmesine dokunun
- Her mod ilgili arama seçeneklerini gösterir

#### 2. **Seyahat Detaylarını Girin**
```
Nereden: İstanbul
Nereye: Ankara
Tarih: Takvimden seçin
Yolcu: 1 Yetişkin
```

#### 3. **Arama**
- "Bilet Bul" düğmesine dokunun
- Sonuç listesindeki mevcut seferleri görüntüleyin

### Sonuçları Filtreleme

#### 1. **Filtre Uygula**
- Sağ üstteki filtre simgesine dokunun
- Kriterleri seçin:
  - Kalkış saati aralığı
  - Fiyat aralığı
  - Firmalar
  - Ekipmanlar (WiFi, AC vb.)

#### 2. **Sonuçları Sırala**
- Sıralama simgesine dokunun
- Sıralamayı seçin:
  - Fiyat (Düşükten Yükseğe)
  - Süre (En Kısa)
  - Kalkış Saati (En Erken)
  - Varış Saati

### Bilet Rezervasyonu

#### 1. **Sefer Seç**
- Tercih edilen sefer kartına dokunun
- Sefer detaylarını inceleyin

#### 2. **Koltuk Seç** (Sadece Otobüs)
- Etkileşimli düzenden koltuk seçin
- Koltuk özelliklerini görüntüleyin (cam kenarı, koridor vb.)

#### 3. **Yolcu Bilgilerini Girin**
- Yolcu detaylarını doldurun
- İletişim bilgilerini ekleyin

#### 4. **Ödeme** (Sadece UI)
- Sahte ödeme ekranı
- Rezervasyon akışını tamamlayın

---

## 🛠️ Teknoloji Yığını {#teknoloji-yığını-tr}

| Kategori | Teknoloji | Amaç |
|----------|-----------|------|
| **UI Framework** | SwiftUI | Modern bildirimsel UI |
| **Mimari** | MVVM | Endişelerin temiz ayrımı |
| **Programlama Dili** | Swift 5.9+ | Tip güvenli iOS geliştirme |
| **Eşzamanlılık** | Async/Await | Asenkron işlemler |
| **Durum Yönetimi** | Combine, @Published | Reaktif durum güncellemeleri |
| **Navigasyon** | NavigationStack | Modern navigasyon sistemi |
| **Veri Kalıcılığı** | UserDefaults | Yerel veri depolama |
| **Ağ İşlemleri** | URLSession | API iletişimi |
| **Tasarım Desenleri** | Repository, Factory | Kod organizasyonu |

### Kullanılan Swift Özellikleri
- **SwiftUI**: Bildirimsel UI framework'ü
- **Combine**: Reaktif programlama
- **Async/Await**: Modern eşzamanlılık
- **Property Wrappers**: @State, @Binding, @ObservedObject
- **View Builders**: Özel container görünümleri
- **Custom Modifiers**: Yeniden kullanılabilir görünüm stillendirme
- **İlişkili Değerli Enumlar**: Tip güvenli veri modelleme

---

## 📂 Proje Yapısı

```
ObiletClone/
├── ObiletCloneApp.swift        # Uygulama giriş noktası
│
├── Views/
│   ├── Home/
│   │   ├── HomeView.swift           # Ana açılış sayfası
│   │   ├── CampaignBannerView.swift # Promosyon banner'ları
│   │   └── PopularRoutesView.swift  # Hızlı rota erişimi
│   │
│   ├── Search/
│   │   ├── SearchView.swift         # Arama arayüzü
│   │   ├── LocationPickerView.swift # Kalkış/varış seçici
│   │   ├── DatePickerView.swift     # Takvim görünümü
│   │   └── PassengerPickerView.swift # Yolcu sayacı
│   │
│   ├── Results/
│   │   ├── ResultsView.swift        # Sefer sonuçları listesi
│   │   ├── JourneyCardView.swift    # Sefer kartı bileşeni
│   │   ├── FilterSheetView.swift    # Filtre seçenekleri
│   │   └── SortOptionsView.swift    # Sıralama seçimi
│   │
│   ├── Detail/
│   │   ├── JourneyDetailView.swift  # Sefer detayları
│   │   ├── SeatSelectionView.swift  # Otobüs koltuk seçici
│   │   └── CompanyInfoView.swift    # Firma detayları
│   │
│   ├── Booking/
│   │   ├── BookingView.swift        # Rezervasyon formu
│   │   ├── PassengerFormView.swift  # Yolcu bilgisi
│   │   └── PaymentView.swift        # Ödeme ekranı
│   │
│   └── Profile/
│       ├── ProfileView.swift        # Kullanıcı profili
│       ├── OrderHistoryView.swift   # Geçmiş rezervasyonlar
│       └── SettingsView.swift       # Uygulama ayarları
│
├── ViewModels/
│   ├── SearchViewModel.swift       # Arama mantığı
│   ├── ResultsViewModel.swift      # Sonuç yönetimi
│   ├── BookingViewModel.swift      # Rezervasyon süreci
│   └── ProfileViewModel.swift      # Kullanıcı verisi
│
├── Models/
│   ├── Journey.swift              # Sefer veri modeli
│   ├── Location.swift             # Konum/şehir modeli
│   ├── Company.swift              # Otobüs/havayolu firması
│   ├── Passenger.swift            # Yolcu detayları
│   ├── Booking.swift              # Rezervasyon bilgisi
│   └── Enums.swift                # Ulaşım türleri vb.
│
├── Services/
│   ├── SearchService.swift        # Arama API çağrıları
│   ├── BookingService.swift       # Rezervasyon işlemleri
│   ├── LocationService.swift      # Konum verisi
│   └── NetworkManager.swift       # Temel API istemcisi
│
├── Components/
│   ├── CustomSearchBar.swift      # Yeniden kullanılabilir arama çubuğu
│   ├── LoadingView.swift          # Yükleme göstergesi
│   ├── ErrorView.swift            # Hata görüntüleme
│   └── EmptyStateView.swift       # Boş durum
│
├── Utilities/
│   ├── Extensions/
│   │   ├── Color+Extension.swift   # Özel renkler
│   │   ├── Date+Extension.swift    # Tarih formatlama
│   │   └── View+Extension.swift    # Görünüm değiştiricileri
│   ├── Constants.swift             # Uygulama sabitleri
│   └── Helpers.swift               # Yardımcı fonksiyonlar
│
└── Resources/
    ├── Assets.xcassets            # Görseller, renkler, simgeler
    ├── Localizable.strings        # Türkçe yerelleştirme
    └── Info.plist                 # Uygulama yapılandırması
```

---

## 🎨 Tasarım Sistemi

### Renk Paleti

```swift
extension Color {
    // Ana Renkler
    static let obiletOrange = Color(hex: "E74C3C")
    static let obiletBlue = Color(hex: "3498DB")
    
    // Arkaplan Renkleri
    static let backgroundPrimary = Color(hex: "FFFFFF")
    static let backgroundSecondary = Color(hex: "F8F9FA")
    static let cardBackground = Color(hex: "FFFFFF")
    
    // Metin Renkleri
    static let textPrimary = Color(hex: "2C3E50")
    static let textSecondary = Color(hex: "7F8C8D")
    static let textTertiary = Color(hex: "BDC3C7")
    
    // Vurgu Renkleri
    static let success = Color(hex: "27AE60")
    static let warning = Color(hex: "F39C12")
    static let error = Color(hex: "E74C3C")
}
```

### Tipografi

```swift
extension Font {
    // Başlıklar
    static let headerLarge = Font.system(size: 28, weight: .bold)
    static let headerMedium = Font.system(size: 22, weight: .semibold)
    static let headerSmall = Font.system(size: 18, weight: .semibold)
    
    // Gövde
    static let bodyLarge = Font.system(size: 16, weight: .regular)
    static let bodyMedium = Font.system(size: 14, weight: .regular)
    static let bodySmall = Font.system(size: 12, weight: .regular)
    
    // Özel
    static let priceFont = Font.system(size: 24, weight: .bold)
    static let buttonFont = Font.system(size: 16, weight: .semibold)
}
```

---

## 🐛 Sorun Giderme

### Yaygın Sorunlar

**Sorun**: Uygulama başlangıçta çöküyor
**Çözüm**: 
- Xcode 14+ yüklü olduğundan emin olun
- Derleme klasörünü temizleyin (Cmd + Shift + K)
- Deployment target'ın iOS 15+ olduğunu doğrulayın

**Sorun**: Görseller görüntülenmiyor
**Çözüm**:
- Assets.xcassets'te eksik görselleri kontrol edin
- Görsel adlarının kod referanslarıyla eşleştiğini doğrulayın
- Görsellerin hedefe dahil edildiğinden emin olun

**Sorun**: Renkler cihazda farklı görünüyor
**Çözüm**:
- Assets'te renk uzayını kontrol edin
- Hem açık hem koyu modlarda test edin
- Color varlıklarının sRGB renk uzayı kullandığını doğrulayın

**Sorun**: Tarih seçici doğru görünmüyor
**Çözüm**:
- Uygun tarih formatlama olduğundan emin olun
- Yerel ayarları kontrol edin
- Takvim bileşeni başlatmayı doğrulayın

**Sorun**: Arama sonuç döndürmüyor
**Çözüm**:
- Şu anda sahte veri kullanır
- Canlı sonuçlar için gerçek API entegrasyonu uygulayın
- Gerçek API kullanıyorsanız ağ izinlerini kontrol edin

---

## 🗺️ Yol Haritası

### Planlanan Özellikler

- [ ] Obilet/benzer servis ile **Gerçek API Entegrasyonu**
- [ ] **Kullanıcı Kimlik Doğrulaması** (Kayıt, Giriş, Sosyal giriş)
- [ ] **Ödeme Entegrasyonu** (Kredi kartı, Apple Pay)
- [ ] **Koltuk Seçimi** animasyonu ve detayları
- [ ] **Fiyat Takibi** ve bildirimler
- [ ] **Çoklu Dil Desteği** (İngilizce, Türkçe)
- [ ] Önbelleğe alınmış veri ile **Çevrimdışı Mod**
- [ ] Rezervasyon güncellemeleri için **Push Bildirimleri**
- [ ] Biletler için **QR Kod Oluşturma**
- [ ] **Apple Wallet Entegrasyonu**
- [ ] Uyarlanabilir düzenlerle **iPad Desteği**
- [ ] **watchOS Yardımcı Uygulaması**
- [ ] Hızlı arama için **Widget**
- [ ] Arkadaşlarla **Sefer Paylaş**
- [ ] Firmalar için **İnceleme ve Değerlendirme** sistemi
- [ ] **Erişilebilirlik** iyileştirmeleri (VoiceOver, Dinamik Tip)

### UI/UX İyileştirmeleri

- [ ] Gelişmiş animasyonlar ve geçişler
- [ ] İskelet yükleme ekranları
- [ ] Yenilemek için çekme işlevselliği
- [ ] Dokunsal geri bildirim
- [ ] Etkileşimli koltuk haritaları
- [ ] Sefer karşılaştırma görünümü
- [ ] Fiyat takvimi görünümü
- [ ] Son aramalar geçmişi
- [ ] Favori rotalar
- [ ] Esnek tarih araması

### Teknik İyileştirmeler

- [ ] Birim testleri kapsamı
- [ ] UI testleri otomasyonu
- [ ] Performans optimizasyonu
- [ ] Daha iyi hata işleme
- [ ] Önbellekleme stratejisi
- [ ] Analitik entegrasyonu
- [ ] Çökme raporlama
- [ ] A/B test framework'ü

---

## 📄 Lisans

Bu proje MIT Lisansı altında lisanslanmıştır - detaylar için [LICENSE](LICENSE) dosyasına bakın.

```
MIT Lisansı

Telif Hakkı (c) 2024 Erdem Maliş

İzin, bu yazılımın ve ilişkili dokümantasyon dosyalarının ("Yazılım") bir kopyasını 
alan herhangi bir kişiye, Yazılım'ı kullanma, kopyalama, değiştirme, birleştirme, 
yayınlama, dağıtma, alt lisanslama ve/veya satma hakları dahil olmak üzere, 
sınırlama olmaksızın Yazılım'da işlem yapma izni ücretsiz olarak verilir.
```

---

## 🤝 Katkıda Bulunma

Bu SwiftUI yeteneklerini gösteren eğitim amaçlı bir projedir. Katkılar memnuniyetle karşılanır!

### Nasıl Katkıda Bulunulur

1. Depoyu fork edin
2. Özellik dalı oluşturun (`git checkout -b feature/HarikaBirOzellik`)
3. Değişikliklerinizi commit edin (`git commit -m 'Harika bir özellik ekle'`)
4. Dalınıza push edin (`git push origin feature/HarikaBirOzellik`)
5. Pull Request açın

### Katkı Kuralları

- Swift API Tasarım Kılavuzlarını takip edin
- Tutarlı kod stili koruyun
- Karmaşık mantık için yorumlar ekleyin
- Yeni özellikler için dokümantasyonu güncelleyin
- Birden fazla iOS versiyonunda test edin
- UI'nin tüm iPhone boyutlarında çalıştığından emin olun

---

## ⚠️ Sorumluluk Reddi

Bu proje, portföy ve öğrenme amaçlı oluşturulmuş eğitsel bir klondur. Obilet veya yan kuruluşlarından **herhangi biriyle bağlantılı, onaylanmış veya bağlı değildir**. Tüm ticari markalar, logolar ve marka adları ilgili sahiplerinin mülkiyetindedir.

Bu proje:
- Gerçek Obilet API'lerini kullanmaz
- Gerçek işlemler gerçekleştirmez
- Kullanıcı ödeme bilgilerini saklamaz
- Resmi bir Obilet uygulamasını temsil etmez

Gerçek bilet rezervasyonu için lütfen [www.obilet.com](https://www.obilet.com) adresindeki resmi Obilet uygulamasını veya web sitesini kullanın.

---

## 🙏 Teşekkürler

- **Obilet**: UI/UX tasarım ilhamı
- **SwiftUI Topluluğu**: Eğitimler ve en iyi uygulamalar
- **Apple**: SwiftUI framework'ü ve dokümantasyon
- **iOS Tasarım Desenleri**: Mimari rehberlik

---

## 📧 İletişim

**Geliştirici**: Mehmet Ali Sevdinoglu

- GitHub: [@malisevdinoglu](https://github.com/malisevdinoglu)
- LinkedIn: [Mehmet Ali Sevdinoglu](https://linkedin.com/in/erdem-malis)
- E-posta: [GitHub üzerinden iletişim](https://github.com/malisevdinoglu)

---

<div align="center">

**⭐ Bu projeyi yararlı buluyorsanız, lütfen yıldız vermeyi düşünün!**

💻 ve ☕ ile [Erdem Maliş](https://github.com/malisevdinoglu) tarafından yapılmıştır

**Eğitim Projesi - SwiftUI UI Klonu**

</div>
