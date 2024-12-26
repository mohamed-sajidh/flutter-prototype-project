// import 'dart:io';

// import 'package:bricksnmix/Controller/CartController.dart';
// import 'package:bricksnmix/Controller/ProductDetailsController.dart';
// import 'package:bricksnmix/Controller/WishlistController.dart';
// import 'package:bricksnmix/Screens/cart/user_cart.dart';
// import 'package:bricksnmix/Screens/product_details/add_to_cart_bottom_sheet.dart';
// import 'package:bricksnmix/Screens/product_details/reviews_page.dart';
// import 'package:bricksnmix/domain/Product.dart';
// import 'package:bricksnmix/generated/appColors.dart';
// import 'package:bricksnmix/generated/assets.dart';
// import 'package:bricksnmix/utils/config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class ProductDetailsPage extends StatefulWidget {
//   final int prodId;
//   const ProductDetailsPage({super.key, required this.prodId});

//   @override
//   State<ProductDetailsPage> createState() => _ProductDetailsPageState();
// }

// class _ProductDetailsPageState extends State<ProductDetailsPage> {
//   @override
//   Widget build(BuildContext context) {
//     String SERVER_URL = ApiConfig.baseUrl;
//     ProductDetailsController productDetailsController =
//         Get.put(ProductDetailsController());
//     WishlistController wishlistController = Get.put(WishlistController());
//     CartController cartController = Get.put(CartController());
//     PageController pageController = PageController();

//     cartController.addedToCartChange();

//     var screeenSize = MediaQuery.of(context).size;
//     var width = screeenSize.width;
//     var height = screeenSize.height;

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           Obx(() {
//             if (productDetailsController.productList.isEmpty) {
//               return const CircularProgressIndicator();
//             } else {
//               return IconButton(
//                 icon: Icon(
//                   productDetailsController.productList[0].isWishlisted
//                       ? Icons.favorite
//                       : Icons.favorite_border,
//                   color: productDetailsController.productList[0].isWishlisted
//                       ? Appcolors.red
//                       : Appcolors.black,
//                 ),
//                 onPressed: () {
//                   if (productDetailsController.productList[0].isWishlisted) {
//                     productDetailsController.deleteFromWishlist(widget.prodId);
//                   } else {
//                     productDetailsController.addToWishlist(widget.prodId);
//                   }
//                   setState(() {});
//                 },
//               );

//               // return IconButton(
//               //   icon: Icon(
//               //     Icons.favorite_border,
//               //     color: productDetailsController.productList[0].isWishlisted
//               //         ? Appcolors.red
//               //         : Appcolors.black,
//               //   ),
//               //   onPressed: () {
//               //     productDetailsController.productList[0].isWishlisted
//               //         ? wishlistController.deleteHiveWishlist(prodId)
//               //         : productDetailsController.addToWishlist(prodId);
//               //   },
//               // );
//             }
//           })
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           await productDetailsController.getSingleProduct(widget.prodId);
//         },
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: width * 0.05, // Responsive padding
//             vertical: height * 0.03,
//           ),
//           child: GetBuilder(
//             init: ProductDetailsController(),
//             builder: (controller) {
//               return Obx(
//                 () {
//                   if (controller.isLoading.isTrue) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (controller.productList.isEmpty) {
//                     return const Center(
//                       child: Text(
//                         "Product Not Found",
//                         style: TextStyle(
//                           color: Appcolors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     );
//                   } else {
//                     return Column(
//                       children: [
//                         Expanded(
//                           child: SingleChildScrollView(
//                             child: Column(
//                               children: [
//                                 SingleChildScrollView(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       SizedBox(
//                                         height: height * 0.35,
//                                         child: PageView.builder(
//                                           controller: pageController,
//                                           itemCount: controller.productList[0]
//                                               .productImages.length,
//                                           itemBuilder: (context, index) {
//                                             String imageUrl = controller
//                                                 .productList[0]
//                                                 .productImages[index]
//                                                 .imageUrl;

//                                             return imageUrl.isNotEmpty
//                                                 ? Image.network(
//                                                     imageUrl,

//                                                     fit: BoxFit.fitHeight,
//                                                     // fit: BoxFit.cover,
//                                                     errorBuilder: (context,
//                                                             error,
//                                                             stackTrace) =>
//                                                         Image.asset(Assets
//                                                             .noImageAvailable),
//                                                   )
//                                                 : Image.asset(
//                                                     Assets.noImageAvailable);
//                                           },
//                                         ),
//                                       ),
//                                       SizedBox(height: height * 0.02),
//                                       Center(
//                                         child: SmoothPageIndicator(
//                                           controller: pageController,
//                                           count: controller.productList[0]
//                                               .productImages.length,
//                                           effect: const ExpandingDotsEffect(
//                                             dotHeight: 8,
//                                             dotWidth: 5,
//                                             activeDotColor:
//                                                 Appcolors.forestGreen,
//                                             dotColor: Appcolors.grey,
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: height * 0.02),
//                                       Row(
//                                         children: [
//                                           Expanded(
//                                             child: Text(
//                                               controller.productList[0].name,
//                                               style: const TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                               maxLines: 2,
//                                               overflow: TextOverflow.visible,
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 8, vertical: 4),
//                                             decoration: BoxDecoration(
//                                               color: Appcolors.forestGreen,
//                                               borderRadius:
//                                                   BorderRadius.circular(4),
//                                             ),
//                                             child: const Text(
//                                               'Most sold',
//                                               style: TextStyle(
//                                                   color: Appcolors.pureWhite),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: height * 0.001),
//                                       Row(
//                                         children: [
//                                           RatingBar.builder(
//                                             initialRating: controller
//                                                     .productList[0]
//                                                     .productRating ??
//                                                 0.0,
//                                             minRating: 1,
//                                             direction: Axis.horizontal,
//                                             allowHalfRating: true,
//                                             itemCount: 5,
//                                             ignoreGestures: true,
//                                             itemSize: 20,
//                                             itemBuilder: (context, _) =>
//                                                 const Icon(
//                                               Icons.star,
//                                               color: Appcolors.forestGreen,
//                                               //size: 2,
//                                             ),
//                                             onRatingUpdate: (rating) {
//                                               print(rating);
//                                             },
//                                           ),
//                                           const SizedBox(width: 4),
//                                           Text(
//                                             '(${controller.productList[0].productReviewCount} Reviews)',
//                                             style: const TextStyle(
//                                               fontSize: 16,
//                                               color: Appcolors.textGrey,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: height * 0.01),
//                                       Row(
//                                         children: [
//                                           Text(
//                                             "\$${controller.productList[0].actualPrice.toString()}",
//                                             style: const TextStyle(
//                                               fontSize: 18,
//                                               color: Appcolors.textGrey,
//                                               fontWeight: FontWeight.bold,
//                                               decoration:
//                                                   TextDecoration.lineThrough,
//                                             ),
//                                           ),
//                                           const SizedBox(width: 8),
//                                           Text(
//                                             '\$${controller.productList[0].price.toString()}',
//                                             style: const TextStyle(
//                                               fontSize: 24,
//                                               fontWeight: FontWeight.bold,
//                                               color: Appcolors.black,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: height * 0.01),
//                                       Row(
//                                         children: [
//                                           Container(
//                                             padding: const EdgeInsets.symmetric(
//                                               horizontal: 8,
//                                               vertical: 4,
//                                             ),
//                                             decoration: BoxDecoration(
//                                               color: Appcolors.red,
//                                               borderRadius:
//                                                   BorderRadius.circular(4),
//                                             ),
//                                             child: Text(
//                                               "${controller.productList[0].offerPercent} %",
//                                               style: const TextStyle(
//                                                 color: Appcolors.pureWhite,
//                                               ),
//                                             ),
//                                           ),
//                                           const SizedBox(width: 8),
//                                           Text(
//                                             'Delivery in ${controller.productList[0].deliveryTime} Days',
//                                             style: const TextStyle(
//                                               fontSize: 16,
//                                               color: Appcolors.textGrey,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: height * 0.01),
//                                       const Text(
//                                         'Description',
//                                         style: TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold,
//                                             color: Appcolors.black),
//                                       ),
//                                       SizedBox(height: height * 0.01),
//                                       Container(
//                                         padding: EdgeInsets.all(width * 0.02),
//                                         decoration: BoxDecoration(
//                                           color: Appcolors.pastelOrange,
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                         child: Text(
//                                           controller.productList[0].description,
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                             color: Appcolors.black,
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: height * 0.02),
//                                       const Text(
//                                         'Ratings & Reviews',
//                                         style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       SizedBox(height: height * 0.02),
//                                       SingleChildScrollView(
//                                         child: SizedBox(
//                                           width: double.infinity,
//                                           //height: 500.0,
//                                           child: Transform(
//                                             transform: Matrix4.identity(),
//                                             child: const ReviewsSection(),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: height * 0.02),
//                                       const Text(
//                                         'Have doubts regarding this product?',
//                                         style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       SizedBox(height: height * 0.02),
//                                       const Text(
//                                         'View Similar',
//                                         style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.orange.shade100,
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               height: 30.0,
//                               width: double.infinity,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 15.0,
//                                 vertical: 0.01,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       const Icon(
//                                         Icons.local_shipping,
//                                         color: Colors.orange,
//                                       ),
//                                       const SizedBox(width: 8.0),
//                                       RichText(
//                                         text: TextSpan(
//                                           children: [
//                                             const TextSpan(
//                                               text: 'Order now for ',
//                                               style: TextStyle(
//                                                 color: Appcolors.black,
//                                                 fontSize: 14.0,
//                                               ),
//                                             ),
//                                             TextSpan(
//                                               text:
//                                                   '${controller.productList[0].offerPercent}% off shipping!',
//                                               style: const TextStyle(
//                                                 color: Appcolors.black,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 14.0,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(
//                                       Icons.info_outline,
//                                       color: Appcolors.black,
//                                       size: 20,
//                                     ),
//                                     onPressed: () {
//                                       showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         shape: const RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.vertical(
//                                             top: Radius.circular(16),
//                                           ),
//                                         ),
//                                         builder: (context) => Padding(
//                                           padding: const EdgeInsets.all(16.0),
//                                           child: SingleChildScrollView(
//                                             child: Column(
//                                               mainAxisSize: MainAxisSize.min,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     const Text(
//                                                       'FREE shipping',
//                                                       style: TextStyle(
//                                                         fontSize: 18,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: Colors.black,
//                                                       ),
//                                                     ),
//                                                     IconButton(
//                                                       onPressed: () {
//                                                         Navigator.of(context)
//                                                             .pop();
//                                                       },
//                                                       icon: const Icon(
//                                                         Icons.close,
//                                                         color: Appcolors.black,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 RichText(
//                                                   text: TextSpan(
//                                                     children: [
//                                                       const TextSpan(
//                                                         text:
//                                                             'Minimum Order Quantity is ',
//                                                         style: TextStyle(
//                                                           fontSize: 15,
//                                                           color:
//                                                               Appcolors.black,
//                                                         ),
//                                                       ),
//                                                       TextSpan(
//                                                         text:
//                                                             '${controller.productList[0].minOrderQuantity}. ',
//                                                         style: const TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Appcolors
//                                                               .forestGreen,
//                                                         ),
//                                                       ),
//                                                       const TextSpan(
//                                                         text:
//                                                             'If you purchase more than the minimum order quantity, you get ',
//                                                         style: TextStyle(
//                                                           fontSize: 15,
//                                                           color:
//                                                               Appcolors.black,
//                                                         ),
//                                                       ),
//                                                       const TextSpan(
//                                                         text: 'Free shipping!',
//                                                         style: TextStyle(
//                                                           fontSize: 15,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Appcolors
//                                                               .forestGreen,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),

//                                                 // const SizedBox(height: 16.0),
//                                                 // const Row(
//                                                 //   children: [
//                                                 //     Icon(
//                                                 //       Icons.local_offer,
//                                                 //       color: Colors.black,
//                                                 //     ),
//                                                 //     SizedBox(width: 8),
//                                                 //     Expanded(
//                                                 //       child: Text(
//                                                 //         'Exclusive for first order',
//                                                 //         style: TextStyle(
//                                                 //           fontSize: 16,
//                                                 //           fontWeight:
//                                                 //               FontWeight.bold,
//                                                 //         ),
//                                                 //       ),
//                                                 //     ),
//                                                 //   ],
//                                                 // ),
//                                                 // const SizedBox(height: 16.0),
//                                                 // const Text(
//                                                 //   'A special offer for first-time Alibaba.com buyers',
//                                                 //   style: TextStyle(
//                                                 //     fontSize: 14,
//                                                 //     color: Appcolors.black,
//                                                 //   ),
//                                                 // ),
//                                                 const SizedBox(height: 16.0),
//                                                 const Row(
//                                                   children: [
//                                                     Icon(
//                                                       Icons.rule,
//                                                       color: Colors.black,
//                                                     ),
//                                                     SizedBox(width: 8),
//                                                     Text(
//                                                       'Detailed rules',
//                                                       style: TextStyle(
//                                                         fontSize: 16,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 const SizedBox(height: 16.0),
//                                                 Text(
//                                                   controller.productList[0]
//                                                       .description,
//                                                   style: const TextStyle(
//                                                     fontSize: 14,
//                                                     color: Appcolors.black,
//                                                   ),
//                                                 ),
//                                                 const SizedBox(height: 16.0),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: height * 0.001),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: OutlinedButton(
//                                     onPressed: () {
//                                       controller.getMinimumQuantity(
//                                           controller.productList[0].id);
//                                       cartController.isAddedToCart.isTrue
//                                           ? Get.to(() => const MyCart())
//                                           : showAddtoCartBottomSheet(
//                                               context,
//                                               controller.productList[0].id,
//                                               controller.productList[0].name,
//                                               controller.productList[0].price,
//                                               controller.productList[0]
//                                                   .minOrderQuantity,
//                                               controller.productList[0]
//                                                   .productImages[0].imageUrl,
//                                             );
//                                     },
//                                     style: ElevatedButton.styleFrom(
//                                       side: BorderSide(
//                                         color: Appcolors.forestGreen,
//                                         width: width * 0.005,
//                                       ),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                     ),
//                                     child: Text(
//                                       cartController.isAddedToCart.isTrue
//                                           ? 'Go to Cart'
//                                           : 'Add to Cart',
//                                       style: const TextStyle(
//                                         color: Appcolors.forestGreen,
//                                         fontSize: 18,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: width * 0.04),
//                                 Expanded(
//                                   child: ElevatedButton(
//                                     onPressed: () {},
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Appcolors.forestGreen,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                     ),
//                                     child: const Text(
//                                       'Buy Now',
//                                       style: TextStyle(
//                                         color: Appcolors.pureWhite,
//                                         fontSize: 18,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
