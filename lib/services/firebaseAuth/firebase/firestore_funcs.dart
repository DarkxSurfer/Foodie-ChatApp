// Future getProduct() {
//     return firestore
//         .collection("product")
//         .get()
//         .then((value) => print("Product Get"))
//         .catchError((e) => print("this is error $e"));
//   }

//   addProduct() {
//     print(
//         "Working Button ${textEditingControlproductname.text} ${textEditingControlproductimg.text} ${textEditingControlproductprice.text}");
//     firestore
//         .collection("product")
//         .add(
//           {
//             "prodName": textEditingControlproductname.text,
//             "prodImg": textEditingControlproductimg.text,
//             "prodPrice": textEditingControlproductprice.text,
//           },
//         )
//         .then((value) => print("Product Added"))
//         .catchError((e) => print("this is error $e"));
//   }

//   deleteProduct(productid) {
//     firestore
//         .collection("product")
//         .doc("$productid")
//         .delete()
//         .then((value) => print("Product Deleted"))
//         .catchError((e) => print("this is error $e"));
//     print("this is productid $productid");
//   }

//   editProduct(productid,sender_msg) {
//     firestore
//         .collection("product")
//         .doc("$productid")
//         .update({
//          "sender_msg": sender_msg
//         })
//         .then((value) => print("Product Updated"))
//         .catchError((e) => print("this is error $e"));
//     print("this is productid $productid");
//   }
