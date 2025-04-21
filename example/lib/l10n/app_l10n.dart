import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_l10n_en.dart';
import 'app_l10n_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
  ];

  /// No description provided for @onboardingTextOne1.
  ///
  /// In en, this message translates to:
  /// **'CLASSY'**
  String get onboardingTextOne1;

  /// No description provided for @onboardingTextOne2.
  ///
  /// In en, this message translates to:
  /// **'FROM HEAD'**
  String get onboardingTextOne2;

  /// No description provided for @onboardingTextOne3.
  ///
  /// In en, this message translates to:
  /// **'TO TOE'**
  String get onboardingTextOne3;

  /// No description provided for @onboardingTextTwo1.
  ///
  /// In en, this message translates to:
  /// **'FLY AWAY'**
  String get onboardingTextTwo1;

  /// No description provided for @onboardingTextTwo2.
  ///
  /// In en, this message translates to:
  /// **'WITH YOUR'**
  String get onboardingTextTwo2;

  /// No description provided for @onboardingTextTwo3.
  ///
  /// In en, this message translates to:
  /// **'STYLE'**
  String get onboardingTextTwo3;

  /// No description provided for @onboardingTextThree1.
  ///
  /// In en, this message translates to:
  /// **'CLOTHES'**
  String get onboardingTextThree1;

  /// No description provided for @onboardingTextThree2.
  ///
  /// In en, this message translates to:
  /// **'FOR A BIG'**
  String get onboardingTextThree2;

  /// No description provided for @onboardingTextThree3.
  ///
  /// In en, this message translates to:
  /// **'PLANET'**
  String get onboardingTextThree3;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN'**
  String get signIn;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN WITH GOOGLE'**
  String get signInWithGoogle;

  /// No description provided for @signInWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN WITH FACEBOOK'**
  String get signInWithFacebook;

  /// No description provided for @haventAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get haventAnAccount;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @createYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Your Account'**
  String get createYourAccount;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP'**
  String get signUp;

  /// No description provided for @signUpWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP WITH GOOGLE'**
  String get signUpWithGoogle;

  /// No description provided for @signUpWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP WITH FACEBOOK'**
  String get signUpWithFacebook;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlist;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT'**
  String get account;

  /// No description provided for @winterSale.
  ///
  /// In en, this message translates to:
  /// **'WINTER SALE'**
  String get winterSale;

  /// No description provided for @saleOff.
  ///
  /// In en, this message translates to:
  /// **'SALE OFF'**
  String get saleOff;

  /// No description provided for @mergingStyleWith.
  ///
  /// In en, this message translates to:
  /// **'MERGING STYLE WITH'**
  String get mergingStyleWith;

  /// No description provided for @elegance.
  ///
  /// In en, this message translates to:
  /// **'ELEGANCE'**
  String get elegance;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'CATEGORIES'**
  String get categories;

  /// No description provided for @allCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get allCategories;

  /// No description provided for @hotDeal.
  ///
  /// In en, this message translates to:
  /// **'HOT DEAL'**
  String get hotDeal;

  /// No description provided for @theCollection.
  ///
  /// In en, this message translates to:
  /// **'The Collection'**
  String get theCollection;

  /// No description provided for @newSeason.
  ///
  /// In en, this message translates to:
  /// **'NEW SEASON'**
  String get newSeason;

  /// No description provided for @loremIpsum.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet'**
  String get loremIpsum;

  /// No description provided for @startFrom.
  ///
  /// In en, this message translates to:
  /// **'  startFrom'**
  String get startFrom;

  /// No description provided for @newArrival.
  ///
  /// In en, this message translates to:
  /// **'NEW ARRIVAL'**
  String get newArrival;

  /// No description provided for @onSale.
  ///
  /// In en, this message translates to:
  /// **'ON SALE'**
  String get onSale;

  /// No description provided for @percentOff.
  ///
  /// In en, this message translates to:
  /// **'{percent}% Off'**
  String percentOff(int percent);

  /// No description provided for @allProduct.
  ///
  /// In en, this message translates to:
  /// **'All Product'**
  String get allProduct;

  /// No description provided for @shirts.
  ///
  /// In en, this message translates to:
  /// **'Shirts'**
  String get shirts;

  /// No description provided for @polos.
  ///
  /// In en, this message translates to:
  /// **'Polos'**
  String get polos;

  /// No description provided for @jeans.
  ///
  /// In en, this message translates to:
  /// **'Jeans'**
  String get jeans;

  /// No description provided for @trousers.
  ///
  /// In en, this message translates to:
  /// **'Trousers'**
  String get trousers;

  /// No description provided for @jackets.
  ///
  /// In en, this message translates to:
  /// **'Jackets'**
  String get jackets;

  /// No description provided for @shoes.
  ///
  /// In en, this message translates to:
  /// **'Shoes'**
  String get shoes;

  /// No description provided for @accessories.
  ///
  /// In en, this message translates to:
  /// **'Accessories'**
  String get accessories;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'SUCCESS'**
  String get success;

  /// No description provided for @viewCart.
  ///
  /// In en, this message translates to:
  /// **'VIEW CART'**
  String get viewCart;

  /// No description provided for @cartSuccessDescription.
  ///
  /// In en, this message translates to:
  /// **'Dolor magna eget est lorem ipsum dolor sit amet consectetur.'**
  String get cartSuccessDescription;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color:'**
  String get color;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size:'**
  String get size;

  /// No description provided for @pleaseSignInReview.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to leave a review.'**
  String get pleaseSignInReview;

  /// No description provided for @relatedProduct.
  ///
  /// In en, this message translates to:
  /// **'RELATED PRODUCT'**
  String get relatedProduct;

  /// No description provided for @errorPrefix.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String errorPrefix(String message);

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @paymentPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get paymentPageTitle;

  /// No description provided for @pleaseLoginToContinue.
  ///
  /// In en, this message translates to:
  /// **'Please log in to continue.'**
  String get pleaseLoginToContinue;

  /// No description provided for @cartIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Cart is Empty'**
  String get cartIsEmpty;

  /// No description provided for @proceedToCheckout.
  ///
  /// In en, this message translates to:
  /// **'Proceed To Checkout'**
  String get proceedToCheckout;

  /// No description provided for @emptyCartWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Cart Is Empty'**
  String get emptyCartWarningTitle;

  /// No description provided for @emptyCartWarningDesc.
  ///
  /// In en, this message translates to:
  /// **'The cart is empty, you cannot proceed without products in your cart.'**
  String get emptyCartWarningDesc;

  /// No description provided for @youAlsoViewed.
  ///
  /// In en, this message translates to:
  /// **'YOU ALSO VIEWED'**
  String get youAlsoViewed;

  /// No description provided for @orderFailed.
  ///
  /// In en, this message translates to:
  /// **'Order Failed'**
  String get orderFailed;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No Data'**
  String get noData;

  /// No description provided for @pleaseUpdateAddress.
  ///
  /// In en, this message translates to:
  /// **'Please update your address'**
  String get pleaseUpdateAddress;

  /// No description provided for @noEmail.
  ///
  /// In en, this message translates to:
  /// **'No Email'**
  String get noEmail;

  /// No description provided for @noPhone.
  ///
  /// In en, this message translates to:
  /// **'No Phone'**
  String get noPhone;

  /// No description provided for @noPaymentMethodFound.
  ///
  /// In en, this message translates to:
  /// **'No Payment Method Found'**
  String get noPaymentMethodFound;

  /// No description provided for @orderNow.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get orderNow;

  /// No description provided for @noAddressOrPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'No Address Or Payment Method found'**
  String get noAddressOrPaymentMethod;

  /// No description provided for @addAddressAndPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Please add an address and payment method to proceed.'**
  String get addAddressAndPaymentMethod;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'ADDRESS'**
  String get address;

  /// No description provided for @noAddressFound.
  ///
  /// In en, this message translates to:
  /// **'No Address Found'**
  String get noAddressFound;

  /// No description provided for @failedToLoadBillingDetails.
  ///
  /// In en, this message translates to:
  /// **'Failed to load billing details.'**
  String get failedToLoadBillingDetails;

  /// No description provided for @unexpectedState.
  ///
  /// In en, this message translates to:
  /// **'Unexpected state.'**
  String get unexpectedState;

  /// No description provided for @addNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get addNewAddress;

  /// No description provided for @newAddress.
  ///
  /// In en, this message translates to:
  /// **'NEW ADDRESS'**
  String get newAddress;

  /// No description provided for @validationError.
  ///
  /// In en, this message translates to:
  /// **'Validation Error'**
  String get validationError;

  /// No description provided for @formError.
  ///
  /// In en, this message translates to:
  /// **'Form Error'**
  String get formError;

  /// No description provided for @pleaseFixErrors.
  ///
  /// In en, this message translates to:
  /// **'Please fix the errors in the form'**
  String get pleaseFixErrors;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @billingDetails.
  ///
  /// In en, this message translates to:
  /// **'BILLING DETAILS'**
  String get billingDetails;

  /// No description provided for @streetAddress.
  ///
  /// In en, this message translates to:
  /// **'Street address'**
  String get streetAddress;

  /// No description provided for @townCity.
  ///
  /// In en, this message translates to:
  /// **'Town/City'**
  String get townCity;

  /// No description provided for @setDefaultAddress.
  ///
  /// In en, this message translates to:
  /// **'Set Default Address'**
  String get setDefaultAddress;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'PAYMENT METHOD'**
  String get paymentMethod;

  /// No description provided for @noPaymentMethodsFound.
  ///
  /// In en, this message translates to:
  /// **'No payment methods found'**
  String get noPaymentMethodsFound;

  /// No description provided for @failedToLoadPaymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Failed to load payment methods.'**
  String get failedToLoadPaymentMethods;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @addNewCard.
  ///
  /// In en, this message translates to:
  /// **'Add New Card'**
  String get addNewCard;

  /// No description provided for @nameOnCard.
  ///
  /// In en, this message translates to:
  /// **'Name On Card'**
  String get nameOnCard;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get cardNumber;

  /// No description provided for @expMonth.
  ///
  /// In en, this message translates to:
  /// **'Exp Month'**
  String get expMonth;

  /// No description provided for @expDate.
  ///
  /// In en, this message translates to:
  /// **'Exp Date'**
  String get expDate;

  /// No description provided for @cvv.
  ///
  /// In en, this message translates to:
  /// **'Cvv'**
  String get cvv;

  /// No description provided for @orderSuccess.
  ///
  /// In en, this message translates to:
  /// **'ORDER SUCCESS'**
  String get orderSuccess;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'MY ORDERS'**
  String get myOrders;

  /// No description provided for @continueShopping.
  ///
  /// In en, this message translates to:
  /// **'CONTINUE SHOPPING'**
  String get continueShopping;

  /// No description provided for @orderSuccessDescription.
  ///
  /// In en, this message translates to:
  /// **'Dolor magna eget est lorem ipsum dolor sit amet consectetur.'**
  String get orderSuccessDescription;

  /// No description provided for @myOrder.
  ///
  /// In en, this message translates to:
  /// **'My Order'**
  String get myOrder;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get accountSettings;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @paymentInformation.
  ///
  /// In en, this message translates to:
  /// **'Payment Information'**
  String get paymentInformation;

  /// No description provided for @privacySetting.
  ///
  /// In en, this message translates to:
  /// **'Privacy Setting'**
  String get privacySetting;

  /// No description provided for @generalSetting.
  ///
  /// In en, this message translates to:
  /// **'General Setting'**
  String get generalSetting;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @changeAccount.
  ///
  /// In en, this message translates to:
  /// **'Change Account'**
  String get changeAccount;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get dateOfBirth;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @region.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get region;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @searchProduct.
  ///
  /// In en, this message translates to:
  /// **'Search Product ...'**
  String get searchProduct;

  /// No description provided for @noProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No Products Found'**
  String get noProductsFound;

  /// No description provided for @changeSearchTerm.
  ///
  /// In en, this message translates to:
  /// **'Please select filters or change your search term'**
  String get changeSearchTerm;

  /// No description provided for @searchResult.
  ///
  /// In en, this message translates to:
  /// **'Search Result'**
  String get searchResult;

  /// No description provided for @applyFilter.
  ///
  /// In en, this message translates to:
  /// **'Apply Filter'**
  String get applyFilter;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return L10nEn();
    case 'tr':
      return L10nTr();
  }

  throw FlutterError(
      'L10n.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
