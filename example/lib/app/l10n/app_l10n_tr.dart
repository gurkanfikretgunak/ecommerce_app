import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class L10nTr extends L10n {
  L10nTr([String locale = 'tr']) : super(locale);

  @override
  String get onboardingTextOne1 => 'Baştan';

  @override
  String get onboardingTextOne2 => 'Aşağı';

  @override
  String get onboardingTextOne3 => 'şıklık';

  @override
  String get onboardingTextTwo1 => 'Stilinizle';

  @override
  String get onboardingTextTwo2 => 'özgürce';

  @override
  String get onboardingTextTwo3 => 'uçun';

  @override
  String get onboardingTextThree1 => 'Büyük bir';

  @override
  String get onboardingTextThree2 => 'gezegen için';

  @override
  String get onboardingTextThree3 => 'kıyafetler';

  @override
  String get email => 'E-posta';

  @override
  String get enterEmail => 'E-postanızı girin';

  @override
  String get password => 'Şifre';

  @override
  String get enterPassword => 'Şifrenizi girin';

  @override
  String get rememberMe => 'Beni Hatırla';

  @override
  String get forgotPassword => 'Şifremi Unuttum';

  @override
  String get signIn => 'GİRİŞ YAP';

  @override
  String get signInWithGoogle => 'GOOGLE İLE GİRİŞ YAP';

  @override
  String get signInWithFacebook => 'FACEBOOK İLE GİRİŞ YAP';

  @override
  String get haventAnAccount => 'Hesabınız yok mu?';

  @override
  String get register => 'Kaydol';

  @override
  String get createYourAccount => 'Hesap Oluştur';

  @override
  String get firstName => 'Ad';

  @override
  String get lastName => 'Soyad';

  @override
  String get phoneNumber => 'Telefon Numarası';

  @override
  String get confirmPassword => 'Şifreyi Onayla';

  @override
  String get signUp => 'KAYIT OL';

  @override
  String get resetPassword => 'Şifreyi Sıfırla';

  @override
  String get resetPasswordDescription => 'Hesabınıza erişmek için e-posta adresinizi yazın, size bir şifre sıfırlama bağlantısı gönderelim.';

  @override
  String get resetPasswordMailSent => 'Şifre sıfırlama e-postası gönderildi.';

  @override
  String get checkYourInbox => 'Lütfen e-posta kutunuzu kontrol edin.';

  @override
  String get signUpWithGoogle => 'GOOGLE İLE KAYIT OL';

  @override
  String get signUpWithFacebook => 'FACEBOOK İLE KAYIT OL';

  @override
  String get home => 'Ana Sayfa';

  @override
  String get wishlist => 'Favoriler';

  @override
  String get cart => 'Sepet';

  @override
  String get search => 'Arama';

  @override
  String get account => 'Hesap';

  @override
  String get winterSale => 'KIŞ İNDİRİMİ';

  @override
  String get saleOff => 'İNDİRİM';

  @override
  String get mergingStyleWith => 'STİL VE';

  @override
  String get elegance => 'ZARAFET BİR ARADA';

  @override
  String get categories => 'KATEGORİLER';

  @override
  String get allCategories => 'Tüm Kategoriler';

  @override
  String get hotDeal => 'FIRSATLAR';

  @override
  String get theCollection => 'Koleksiyon';

  @override
  String get newSeason => 'YENİ SEZON';

  @override
  String get loremIpsum => 'Lorem ipsum dolor sit amet';

  @override
  String get newSeasonDescription => 'Yeni sezon, yeni stil — sadece 30 dolardan başlayan fiyatlarla!';

  @override
  String get winterSaleDescription => 'Yeni sezon, yeni stil! %50’ye varan kış indirimi başladı.';

  @override
  String get startFrom => 'başlayan';

  @override
  String get newArrival => 'YENİ GELENLER';

  @override
  String get onSale => 'İNDİRİMDE';

  @override
  String percentOff(int percent) {
    return '%$percent İndirim';
  }

  @override
  String get allProduct => 'Tüm Ürünler';

  @override
  String get shirts => 'Gömlekler';

  @override
  String get polos => 'Polo Gömlekler';

  @override
  String get jeans => 'Kot Pantolonlar';

  @override
  String get trousers => 'Pantolonlar';

  @override
  String get jackets => 'Ceketler';

  @override
  String get shoes => 'Ayakkabılar';

  @override
  String get accessories => 'Aksesuarlar';

  @override
  String get success => 'BAŞARILI';

  @override
  String get viewCart => 'SEPETİ GÖRÜNTÜLE';

  @override
  String get description => 'Açıklama';

  @override
  String get cartSuccessDescription => 'Ürün sepetinize başarıyla eklendi. Alışverişe devam edebilir veya ödemeye geçebilirsiniz';

  @override
  String get goBack => 'Geri Dön';

  @override
  String get color => 'Renk:';

  @override
  String get size => 'Beden:';

  @override
  String get pleaseSignInReview => 'Yorum yapmak için lütfen giriş yapın.';

  @override
  String get addReview => 'YORUM EKLE';

  @override
  String get yourReview => 'Yorumunuz * ';

  @override
  String get yourRating => 'Puanınız * ';

  @override
  String get submit => 'GÖNDER';

  @override
  String get relatedProduct => 'İLGİLİ ÜRÜNLER';

  @override
  String get addToCard => 'Sepete Ekle';

  @override
  String errorPrefix(String message) {
    return 'Hata: $message';
  }

  @override
  String get wishlistEmpty => 'Favoriler Listesi Boş';

  @override
  String get productAddedToCart => 'Ürün Sepete Eklendi';

  @override
  String get productAddedToCartSuccess => 'Ürün sepetinize başarıyla eklendi. Alışverişe devam edebilir veya ödemeye geçebilirsiniz';

  @override
  String get wishlistError => 'Favoriler listeniz yüklenirken bir hata oluştu';

  @override
  String get ordersEmpty => 'Siparişler Boş';

  @override
  String get orderError => 'Siparişleriniz yüklenirken bir hata oluştu';

  @override
  String get checkout => 'Ödeme';

  @override
  String get successfully => 'Başarılı';

  @override
  String get payment => 'Ödeme';

  @override
  String get paymentPageTitle => 'Ödeme';

  @override
  String get pleaseLoginToContinue => 'Devam etmek için lütfen giriş yapın.';

  @override
  String get cartIsEmpty => 'Sepet Boş';

  @override
  String get proceedToCheckout => 'Ödemeye Geç';

  @override
  String get emptyCartWarningTitle => 'Sepet Boş';

  @override
  String get emptyCartWarningDesc => 'Sepet boş, sepetinizde ürün olmadan devam edemezsiniz.';

  @override
  String get youAlsoViewed => 'İNCELEDİĞİNİZ ÜRÜNLER';

  @override
  String get orderFailed => 'Sipariş Başarısız';

  @override
  String get noData => 'Kayıtlı Adres Yok';

  @override
  String get pleaseUpdateAddress => 'Lütfen adresinizi güncelleyin';

  @override
  String get noEmail => 'E-posta Yok';

  @override
  String get noPhone => 'Telefon Yok';

  @override
  String get noPaymentMethodFound => 'Ödeme Yöntemi Bulunamadı';

  @override
  String get orderNow => 'Şimdi Sipariş Ver';

  @override
  String get noAddressOrPaymentMethod => 'Adres veya Ödeme Yöntemi Bulunamadı';

  @override
  String get addAddressAndPaymentMethod => 'Devam etmek için lütfen bir adres ve ödeme yöntemi ekleyin.';

  @override
  String get address => 'ADRES';

  @override
  String get noAddressFound => 'Adres Bulunamadı';

  @override
  String get failedToLoadBillingDetails => 'Fatura detayları yüklenemedi.';

  @override
  String get unexpectedState => 'Beklenmeyen durum.';

  @override
  String get addNewAddress => 'Yeni Adres Ekle';

  @override
  String get newAddress => 'YENİ ADRES';

  @override
  String get validationError => 'Doğrulama Hatası';

  @override
  String get formError => 'Form Hatası';

  @override
  String get pleaseFixErrors => 'Lütfen formdaki hataları düzeltin';

  @override
  String get confirm => 'Onayla';

  @override
  String get billingDetails => 'FATURA BİLGİLERİ';

  @override
  String get streetAddress => 'Sokak adresi';

  @override
  String get townCity => 'İlçe/Şehir';

  @override
  String get setDefaultAddress => 'Varsayılan Adres Olarak Ayarla';

  @override
  String get country => 'Ülke';

  @override
  String get paymentMethod => 'ÖDEME YÖNTEMİ';

  @override
  String get noPaymentMethodsFound => 'Ödeme yöntemi bulunamadı';

  @override
  String get failedToLoadPaymentMethods => 'Ödeme yöntemleri yüklenemedi.';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get addNewCard => 'Yeni Kart Ekle';

  @override
  String get nameOnCard => 'Kart Üzerindeki İsim';

  @override
  String get cardNumber => 'Kart Numarası';

  @override
  String get expMonth => 'Son Ay';

  @override
  String get expDate => 'Son Yıl';

  @override
  String get cvv => 'Güvenlik Kodu';

  @override
  String get orderSuccess => 'SİPARİŞ BAŞARILI';

  @override
  String get myOrders => 'SİPARİŞLER';

  @override
  String get continueShopping => 'ALIŞVERİŞE DEVAM ET';

  @override
  String get orderSuccessDescription => 'Siparişiniz başarıyla alındı. Siparişlerinizi görüntüleyebilir veya alışverişe devam edebilirsiniz.';

  @override
  String get myOrder => 'Siparişler';

  @override
  String get accountSettings => 'Hesap';

  @override
  String get notification => 'Bildirimler';

  @override
  String get notificationIsEmpty => 'Bildirim Listesi Boş';

  @override
  String get paymentInformation => 'Ödeme Bilgileri';

  @override
  String get privacySetting => 'Gizlilik Ayarları';

  @override
  String get generalSetting => 'Genel Ayarlar';

  @override
  String get language => 'Dil';

  @override
  String get changeAccount => 'Hesap Değiştir';

  @override
  String get signOut => 'Çıkış Yap';

  @override
  String get profile => 'Profil';

  @override
  String get name => 'Ad';

  @override
  String get dateOfBirth => 'Doğum tarihi';

  @override
  String get gender => 'Cinsiyet';

  @override
  String get region => 'Bölge';

  @override
  String get changePassword => 'Şifre Değiştir';

  @override
  String get searchProduct => 'Ürün Ara ...';

  @override
  String get noProductsFound => 'Ürün Bulunamadı';

  @override
  String get changeSearchTerm => 'Lütfen filtre seçin veya arama terimini değiştirin';

  @override
  String get searchResult => 'Arama Sonucu';

  @override
  String get applyFilter => 'Filtreyi Uygula';

  @override
  String get markAsRead => 'Okundu Olarak İşaretle';

  @override
  String get filter => 'FİLTRELE';

  @override
  String get category => 'Kategori';

  @override
  String get price => 'FİYAT';

  @override
  String get turkish => 'Türkçe';

  @override
  String get english => 'İngilizce';

  @override
  String get profilePictureChanged => 'Profil Fotoğrafı Değiştirildi';

  @override
  String get profilePictureUpdatedSuccessfully => 'Profil fotoğrafınız başarıyla güncellendi.';

  @override
  String get changeProfilePicture => 'Profil Fotoğrafını Değiştir';

  @override
  String get selectNewProfilePicture => 'Galerinizden yeni bir profil fotoğrafı seçin.';

  @override
  String get change => 'Değiştir';

  @override
  String get save => 'Kaydet';

  @override
  String get changePasswordTitle => 'Şifre Değiştir';

  @override
  String get changePasswordInstruction => 'Şifrenizi güncellemek için lütfen mevcut şifrenizi doğrulayın ve yeni bir şifre belirleyin';

  @override
  String get currentPasswordHint => 'Mevcut Şifre';

  @override
  String get newPasswordHint => 'Yeni Şifre';

  @override
  String get confirmNewPasswordHint => 'Yeni Şifreyi Onayla';

  @override
  String get validationErrorTitle => 'Doğrulama Hatası';

  @override
  String get passwordChangedTitle => 'Şifre Değiştirildi';

  @override
  String get passwordChangedDescription => 'Şifre başarıyla değiştirildi';
}
