# ObiletClone

ObiletClone, popüler seyahat platformu Obilet'in otobüs sefer listeleme ve arama sonuç ekranını SwiftUI ile yeniden oluşturan modern bir iOS uygulamasıdır. Şehirlerarası seyahatlerde farklı firmalara ait sefer saatleri, güzergah bilgileri ve bilet fiyatlarını tek ekranda sadeleştirerek kullanıcıların en uygun seyahat seçeneğini hızlıca bulmasını sağlar.

## Özellikler (Features)
- **Dinamik Sefer Kartları:** Kalkış saati, tahmini yolculuk süresi, varış ve kalkış otogarları, koltuk yerleşim düzeni (2+1) ve güncel bilet fiyatını tek bir kart bileşeni üzerinde sunar.
- **Güzergah ve Tarih Navigasyonu:** Üst başlık şeridinde kalkış-varış noktalarını ve seyahat tarihini gösterir; önceki ve sonraki gün geçişlerini pratik butonlarla simüle eder.
- **Çoklu Sıralama Seçenekleri:** Seferleri artan fiyata veya en erken kalkış saatine göre anlık olarak sıralar; tek dokunuşla orijinal listeleme düzenine sıfırlama imkanı sunar.
- **Kapsamlı Filtreleme:** Sefer listesini yalnızca 2+1 koltuk düzenine sahip otobüslerle sınırlandırmayı sağlar; sabah, öğlen ve akşam gibi farklı sefer zaman dilimlerine göre filtreleme butonları içerir.
- **Firma Kimlik ve Logo Desteği:** Kamil Koç, Metro, Seç ve Lüks Adana gibi seyahat firmalarının logolarını yerel katalogdan eşleştirir, logo bulunamadığında otomatik yedek SF simgesi gösterir.
- **Modern ve Duyarlı Arayüz:** iOS arayüz tasarım yönergelerine tam uyumlu, temiz gölgelendirmelere ve akıcı kaydırma deneyimine sahip özel SwiftUI bileşenleri barındırır.

##  Teknolojiler & Mimari (Tech Stack)
- **Frontend / Mobile:** iOS 17+, Swift 5.9+, SwiftUI (NavigationStack, LazyVStack, ConfirmationDialog, PresentationDetents, SF Symbols).
- **Mimari / State / DB:** MVVM (Model-View-ViewModel) mimari deseni, Swift Observation framework (`@Observable` makrosu), Mock veri servis katmanı (`MockTripService`), `UUID` ve `Hashable` protokolleriyle güçlendirilmiş tip güvenli yerel veri modelleri.

##  Kurulum (Getting Started)
```bash
# Depoyu yerel makinenize klonlayın
git clone https://github.com/malisevdinoglu/ObiletClone_SwiftUI.git

# Proje çalışma dizinine geçiş yapın
cd ObiletClone_SwiftUI

# Projeyi Xcode ile açın
open ObiletClone.xcodeproj
```

Uygulamayı çalıştırma adımları:
- Projeyi Xcode 15 veya üzeri bir sürümde açın.
- Hedef cihaz listesinden iOS 17.0+ sürümüne sahip bir iPhone Simülatörü seçin.
- `Cmd + R` kısayolunu kullanarak projeyi doğrudan derleyip çalıştırın; harici CocoaPods, SPM veya üçüncü parti paket kurulumu gerektirmez.
