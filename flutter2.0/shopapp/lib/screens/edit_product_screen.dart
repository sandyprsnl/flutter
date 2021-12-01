import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/product.dart';
import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routName = '/edit-product';
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: '',
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );

  var _initValues = {
    'title': '',
    'description': '',
    'imageUrl': '',
    'price': '',
  };

  var isLoading = false;
  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateIamgeUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    if (args['updateProduct']) {
      // final productId = ModalRoute.of(context)!.settings.arguments as String;
      final productId = args['id'];
      // ignore: unnecessary_null_comparison
      if (productId != null) {
        final product =
            Provider.of<Products>(context, listen: false).findById(productId);
        _editedProduct = product;
        _initValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          // 'imageUrl': product.imageUrl,
          'imageUrl': '',
          'price': _editedProduct.price.toString(),
        };
        _imageController.text = _editedProduct.imageUrl;
      }
    }

    super.didChangeDependencies();
  }

  void _updateIamgeUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageController.text.startsWith('http') &&
              !_imageController.text.startsWith('https')) ||
          (!_imageController.text.endsWith('.png') &&
              !_imageController.text.endsWith('.jpg') &&
              !_imageController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _saveForm() async {
    final isValidate = _form.currentState!.validate();
    if (!isValidate) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      isLoading = true;
    });
    // ignore: unnecessary_null_comparison
    if (_editedProduct.id != null && _editedProduct.id.isNotEmpty) {
      await Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
      Navigator.of(context).pop();
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct);
      } catch (error) {
        await showDialog<Null>(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('An Error occured!'),
                  content: Text('Somthing went Wrong'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text('OK'))
                  ],
                ));
      }
      //  finally {
      //   setState(() {
      //     isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateIamgeUrl);
    _imageController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Products'),
        actions: <Widget>[
          IconButton(onPressed: _saveForm, icon: Icon(Icons.save))
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _initValues['title'],
                      decoration: InputDecoration(
                        labelText: 'Title',
                        errorStyle: TextStyle(fontSize: 16),
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {},
                      onSaved: (value) {
                        _editedProduct = Product(
                          id: _editedProduct.id,
                          isFevorite: _editedProduct.isFevorite,
                          title: value!,
                          description: _editedProduct.description,
                          price: _editedProduct.price,
                          imageUrl: _editedProduct.imageUrl,
                        );
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Title is Empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['price'],
                      decoration: InputDecoration(
                        labelText: 'Price',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        _editedProduct = Product(
                          id: _editedProduct.id,
                          isFevorite: _editedProduct.isFevorite,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          price: double.parse(value.toString()),
                          imageUrl: _editedProduct.imageUrl,
                        );
                      },
                      validator: (pricevalue) {
                        if (pricevalue == null ||
                            pricevalue.isEmpty ||
                            pricevalue.length == 0) {
                          return "please enter a price";
                        }
                        if (double.tryParse(pricevalue) == null) {
                          return "Enter a valid number";
                        }
                        if (double.parse(pricevalue) <= 0) {
                          return "Please enter a number greater then 0";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['description'],
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                      maxLines: 3,
                      // textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a description";
                        }
                        if (value.length < 10) {
                          return "Should be at least 10 characters long.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          id: _editedProduct.id,
                          isFevorite: _editedProduct.isFevorite,
                          title: _editedProduct.title,
                          description: value!,
                          price: _editedProduct.price,
                          imageUrl: _editedProduct.imageUrl,
                        );
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 8, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: _imageController.text.isEmpty
                              ? Text('Enter A URL')
                              : FittedBox(
                                  child: Image.network(_imageController.text),
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Image Url'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageController,
                            focusNode: _imageUrlFocusNode,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a Image URL';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return "Please enter a valid URL";
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                print(!value.endsWith('.jpg'));
                                return "Please enter a valid image URL";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                id: _editedProduct.id,
                                isFevorite: _editedProduct.isFevorite,
                                title: _editedProduct.title,
                                description: _editedProduct.description,
                                price: _editedProduct.price,
                                imageUrl: value!,
                              );
                            },
                            onFieldSubmitted: (_) {
                              _saveForm();
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
