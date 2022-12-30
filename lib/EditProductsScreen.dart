import 'package:app/ProductsProvider.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:app/Product.dart';
import 'package:provider/provider.dart';

class EditProductsScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  State<EditProductsScreen> createState() => _EditProductsScreenState();
}

class _EditProductsScreenState extends State<EditProductsScreen> {
  final priceFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final imageURLController = TextEditingController();
  final imageURLFocusNode = FocusNode();
  final form = GlobalKey<FormState>();
  var editProduct =
  Product(id: '', title: '', imageUrl: '', description: '', price: 0);

  @override
  void initState() {
    // TODO: implement initState
    imageURLFocusNode.addListener(updateImageURL);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    imageURLFocusNode.removeListener(updateImageURL);
    priceFocusNode.dispose();
    descriptionFocusNode.dispose();
    imageURLController.dispose();
    imageURLFocusNode.dispose();
    super.dispose();
  }

  var initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageURL': '',
  };
  var isInit = true;

  void updateImageURL() {
    if (!imageURLFocusNode.hasFocus) {
      if ((!imageURLController.text.startsWith('http') &&
          !imageURLController.text.startsWith('https')) ||
          (!imageURLController.text.endsWith('.png') &&
              !imageURLController.text.endsWith('.jpg') &&
              !imageURLController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      final productID = ModalRoute.of(context)!.settings.arguments as String;
      if (productID != null) {
        editProduct = Provider.of<Products>(context, listen: false)
            .itemS
            .firstWhere((prod) => prod.id == productID);
        initValues = {
          'title': editProduct.title,
          'description': editProduct.description,
          'price': editProduct.price.toString(),
          //'imageURL': editProduct.imageUrl,
          'imageURL': '',
        };
        imageURLController.text = editProduct.imageUrl;
      }
    }
    isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void saveeForm() {
    final isValid = form.currentState!.validate();
    if (!isValid) {
      return;
    }
    form.currentState!.save();
    if (editProduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(editProduct.id, editProduct);
    } else {
      Provider.of<Products>(context, listen: false).addProduct(editProduct);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: saveeForm,
            icon: Icon(
              Icons.save_outlined,
              color: Colors.black87,
              size: 26.5,
            ),
          ),
        ],
        title: Text(
          'Edit Product',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
            fontSize: 23.2,
            fontFamily: 'Lato',
          ),
        ),
      ),
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(16.3),
        child: Form(
          key: form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: initValues['title'],
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    fontSize: 23.2,
                    fontFamily: 'Lato',
                  ),
                ),
                maxLength: 30,
                maxLines: 1,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(priceFocusNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a value.';
                  }
                  return null;
                },
                onSaved: (value) {
                  editProduct = Product(
                    id: editProduct.id,
                    title: value!,
                    imageUrl: editProduct.imageUrl,
                    description: editProduct.description,
                    price: editProduct.price,
                    isFavorite: editProduct.isFavorite,
                  );
                },
              ),
              TextFormField(
                initialValue: initValues['price'],
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    fontSize: 23.2,
                    fontFamily: 'Lato',
                  ),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: priceFocusNode,
                maxLength: 15,
                maxLines: 1,
                keyboardAppearance: Brightness.light,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(descriptionFocusNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a Price.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
                onSaved: (value) {
                  editProduct = Product(
                    id: editProduct.id,
                    title: editProduct.title,
                    imageUrl: editProduct.imageUrl,
                    description: editProduct.description,
                    price: double.parse(value!),
                    isFavorite: editProduct.isFavorite,
                  );
                },
              ),
              TextFormField(
                initialValue: initValues['description'],
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    fontSize: 23.2,
                    fontFamily: 'Lato',
                  ),
                ),
                maxLength: 150,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: descriptionFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid Description.';
                  }
                  if (value.length < 10) {
                    return 'Should be at least 10 characters long.';
                  }
                  return null;
                },
                onSaved: (value) {
                  editProduct = Product(
                    id: editProduct.id,
                    title: editProduct.title,
                    imageUrl: editProduct.imageUrl,
                    description: value!,
                    price: editProduct.price,
                    isFavorite: editProduct.isFavorite,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 102,
                    height: 102,
                    margin: EdgeInsets.only(
                      top: 9,
                      right: 11,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.redAccent,
                      ),
                    ),
                    child: imageURLController.text.isEmpty
                        ? Text(
                      'Enter image URL',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3,
                        fontSize: 13.2,
                        fontFamily: 'Lato',
                      ),
                    )
                        : FittedBox(
                      child: Image.network(imageURLController.text),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Image URL',
                        labelStyle: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                          fontSize: 23.2,
                          fontFamily: 'Lato',
                        ),
                      ),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: imageURLController,
                      focusNode: imageURLFocusNode,
                      onFieldSubmitted: (_) {
                        saveeForm();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an Image URL.';
                        }
                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return 'Please enter a valid URL.';
                        }
                        if (!value.endsWith('.png') &&
                            !value.endsWith('.jpg') &&
                            !value.endsWith('.jpeg')) {
                          return 'Please enter a valid Image URL.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        editProduct = Product(
                          id: editProduct.id,
                          title: editProduct.title,
                          imageUrl: value!,
                          description: editProduct.description,
                          price: editProduct.price,
                          isFavorite: editProduct.isFavorite,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}