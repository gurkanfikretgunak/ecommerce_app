import 'app_l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get onboardingTextOne1 => 'CLASSY';

  @override
  String get onboardingTextOne2 => 'FROM HEAD';

  @override
  String get onboardingTextOne3 => 'TO TOE';

  @override
  String get onboardingTextTwo1 => 'FLY AWAY';

  @override
  String get onboardingTextTwo2 => 'WITH YOUR';

  @override
  String get onboardingTextTwo3 => 'STYLE';

  @override
  String get onboardingTextThree1 => 'CLOTHES';

  @override
  String get onboardingTextThree2 => 'FOR A BIG';

  @override
  String get onboardingTextThree3 => 'PLANET';

  @override
  String get email => 'Email';

  @override
  String get enterEmail => 'Enter Email';

  @override
  String get password => 'Password';

  @override
  String get enterPassword => 'Enter Password';

  @override
  String get rememberMe => 'Remember Me';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get signIn => 'SIGN IN';

  @override
  String get signInWithGoogle => 'SIGN IN WITH GOOGLE';

  @override
  String get signInWithFacebook => 'SIGN IN WITH FACEBOOK';

  @override
  String get haventAnAccount => 'Don’t have an account?';

  @override
  String get register => 'Register';

  @override
  String get createYourAccount => 'Create Your Account';

  @override
  String get firstName => 'First name';

  @override
  String get lastName => 'Last name';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get signUp => 'SIGN UP';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get resetPasswordDescription => 'Enter your email address to access your account. We\'ll send you a password reset link.';

  @override
  String get resetPasswordMailSent => 'Password reset email has been sent.';

  @override
  String get checkYourInbox => 'Please check your inbox.';

  @override
  String get signUpWithGoogle => 'SIGN UP WITH GOOGLE';

  @override
  String get signUpWithFacebook => 'SIGN UP WITH FACEBOOK';

  @override
  String get home => 'Home';

  @override
  String get wishlist => 'Wishlist';

  @override
  String get cart => 'Cart';

  @override
  String get search => 'Search';

  @override
  String get account => 'Account';

  @override
  String get winterSale => 'WINTER SALE';

  @override
  String get saleOff => 'SALE OFF';

  @override
  String get mergingStyleWith => 'MERGING STYLE WITH';

  @override
  String get elegance => 'ELEGANCE';

  @override
  String get categories => 'CATEGORIES';

  @override
  String get allCategories => 'All Categories';

  @override
  String get hotDeal => 'HOT DEAL';

  @override
  String get theCollection => 'The Collection';

  @override
  String get newSeason => 'NEW SEASON';

  @override
  String get loremIpsum => 'Lorem ipsum dolor sit amet';

  @override
  String get startFrom => '  startFrom';

  @override
  String get newArrival => 'NEW ARRIVAL';

  @override
  String get onSale => 'ON SALE';

  @override
  String percentOff(int percent) {
    return '$percent% Off';
  }

  @override
  String get allProduct => 'All Product';

  @override
  String get shirts => 'Shirts';

  @override
  String get polos => 'Polos';

  @override
  String get jeans => 'Jeans';

  @override
  String get trousers => 'Trousers';

  @override
  String get jackets => 'Jackets';

  @override
  String get shoes => 'Shoes';

  @override
  String get accessories => 'Accessories';

  @override
  String get success => 'SUCCESS';

  @override
  String get viewCart => 'VIEW CART';

  @override
  String get cartSuccessDescription => 'Dolor magna eget est lorem ipsum dolor sit amet consectetur.';

  @override
  String get goBack => 'Go Back';

  @override
  String get color => 'Color:';

  @override
  String get size => 'Size:';

  @override
  String get pleaseSignInReview => 'Please sign in to leave a review.';

  @override
  String get addReview => 'ADD A REVIEW';

  @override
  String get yourReview => 'Your Review * ';

  @override
  String get yourRating => 'Your Rating * ';

  @override
  String get submit => 'SUBMIT';

  @override
  String get relatedProduct => 'RELATED PRODUCT';

  @override
  String get addToCard => 'Add to Card';

  @override
  String errorPrefix(String message) {
    return 'Error: $message';
  }

  @override
  String get wishlistEmpty => 'Wishlist is Empty';

  @override
  String get productAddedToCart => 'Product Added to Cart';

  @override
  String get productAddedToCartSuccess => 'Product Added to Cart Successfully';

  @override
  String get wishlistError => 'An error occurred while loading your wishlist';

  @override
  String get ordersEmpty => 'Orders is Empty';

  @override
  String get orderError => 'An error occurred while loading your orders';

  @override
  String get checkout => 'Checkout';

  @override
  String get successfully => 'Successfully';

  @override
  String get payment => 'Payment';

  @override
  String get paymentPageTitle => 'Payment';

  @override
  String get pleaseLoginToContinue => 'Please log in to continue.';

  @override
  String get cartIsEmpty => 'Cart is Empty';

  @override
  String get proceedToCheckout => 'Proceed To Checkout';

  @override
  String get emptyCartWarningTitle => 'Cart Is Empty';

  @override
  String get emptyCartWarningDesc => 'The cart is empty, you cannot proceed without products in your cart.';

  @override
  String get youAlsoViewed => 'YOU ALSO VIEWED';

  @override
  String get orderFailed => 'Order Failed';

  @override
  String get noData => 'No Data';

  @override
  String get pleaseUpdateAddress => 'Please update your address';

  @override
  String get noEmail => 'No Email';

  @override
  String get noPhone => 'No Phone';

  @override
  String get noPaymentMethodFound => 'No Payment Method Found';

  @override
  String get orderNow => 'Order Now';

  @override
  String get noAddressOrPaymentMethod => 'No Address Or Payment Method found';

  @override
  String get addAddressAndPaymentMethod => 'Please add an address and payment method to proceed.';

  @override
  String get address => 'ADDRESS';

  @override
  String get noAddressFound => 'No Address Found';

  @override
  String get failedToLoadBillingDetails => 'Failed to load billing details.';

  @override
  String get unexpectedState => 'Unexpected state.';

  @override
  String get addNewAddress => 'Add New Address';

  @override
  String get newAddress => 'NEW ADDRESS';

  @override
  String get validationError => 'Validation Error';

  @override
  String get formError => 'Form Error';

  @override
  String get pleaseFixErrors => 'Please fix the errors in the form';

  @override
  String get confirm => 'Confirm';

  @override
  String get billingDetails => 'BILLING DETAILS';

  @override
  String get streetAddress => 'Street address';

  @override
  String get townCity => 'Town/City';

  @override
  String get setDefaultAddress => 'Set Default Address';

  @override
  String get country => 'Country';

  @override
  String get paymentMethod => 'PAYMENT METHOD';

  @override
  String get noPaymentMethodsFound => 'No payment methods found';

  @override
  String get failedToLoadPaymentMethods => 'Failed to load payment methods.';

  @override
  String get loading => 'Loading...';

  @override
  String get addNewCard => 'Add New Card';

  @override
  String get nameOnCard => 'Name On Card';

  @override
  String get cardNumber => 'Card Number';

  @override
  String get expMonth => 'Exp Month';

  @override
  String get expDate => 'Exp Date';

  @override
  String get cvv => 'Cvv';

  @override
  String get orderSuccess => 'ORDER SUCCESS';

  @override
  String get myOrders => 'MY ORDERS';

  @override
  String get continueShopping => 'CONTINUE SHOPPING';

  @override
  String get orderSuccessDescription => 'Dolor magna eget est lorem ipsum dolor sit amet consectetur.';

  @override
  String get myOrder => 'My Order';

  @override
  String get accountSettings => 'Account';

  @override
  String get notification => 'Notification';

  @override
  String get paymentInformation => 'Payment Information';

  @override
  String get privacySetting => 'Privacy Setting';

  @override
  String get generalSetting => 'General Setting';

  @override
  String get language => 'Language';

  @override
  String get changeAccount => 'Change Account';

  @override
  String get signOut => 'Sign Out';

  @override
  String get profile => 'Profile';

  @override
  String get name => 'Name';

  @override
  String get dateOfBirth => 'Date of birth';

  @override
  String get gender => 'Gender';

  @override
  String get region => 'Region';

  @override
  String get changePassword => 'Change Password';

  @override
  String get searchProduct => 'Search Product ...';

  @override
  String get noProductsFound => 'No Products Found';

  @override
  String get changeSearchTerm => 'Please select filters or change your search term';

  @override
  String get searchResult => 'Search Result';

  @override
  String get applyFilter => 'Apply Filter';

  @override
  String get markAsRead => 'Mark As Read';

  @override
  String get filter => 'FILTER';

  @override
  String get category => 'Category';

  @override
  String get price => 'PRICE';

  @override
  String get turkish => 'Turkish';

  @override
  String get english => 'English';
}
