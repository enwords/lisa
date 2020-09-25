import 'package:flutter/material.dart';
import 'package:lisa/services/article/create.dart';
import 'package:lisa/routes.dart';

class ArticleForm extends StatefulWidget {
  @override
  ArticleFormState createState() {
    return ArticleFormState();
  }
}

class ArticleFormState extends State<ArticleForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> formData = {'title': null, 'content': null};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Title *',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (String value) {
              formData['title'] = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Content *',
            ),
            keyboardType: TextInputType.multiline,
            minLines: 2,
            maxLines: null,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (String value) {
              formData['content'] = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Color(0xffff914d),
                    onPressed: () {
                      _submitForm();
                    },
                    child: Text('Submit'),
                  )
                ]),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
      _formKey.currentState.save(); //onSaved is called!
      var result = ArticleCreate().call(formData['title'], formData['content']);
      if (result != null) {
        Navigator.pushReplacementNamed(context, Routes.articles);
      }
    }
  }
}
