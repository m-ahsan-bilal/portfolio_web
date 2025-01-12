import 'package:ahsan_dev/utils/app_resources.dart';
import 'package:ahsan_dev/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ExpandableTextField extends StatefulWidget {
  final double height;
  final double maxHeight;
  final double dividerHeight;
  final double dividerSpace;
  // final Widget child;

  const ExpandableTextField({
    required Key key,
    // required this.child,
    this.height = 44,
    this.maxHeight = 300,
    this.dividerHeight = 40,
    this.dividerSpace = 2,
  }) : super(key: key);

  @override
  _ExpandableTextFieldState createState() => _ExpandableTextFieldState();
}

class _ExpandableTextFieldState extends State<ExpandableTextField> {
  late double _height, _maxHeight, _dividerHeight, _dividerSpace;

  @override
  void initState() {
    super.initState();
    _height = widget.height;
    _maxHeight = widget.maxHeight;
    _dividerHeight = widget.dividerHeight;
    _dividerSpace = widget.dividerSpace;
  }

  final messageController = TextEditingController();
  final messageFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: _height,
            child: Stack(children: [
              TextFormField(
                textAlignVertical: TextAlignVertical.top,
                controller: messageController,
                focusNode: messageFocus,
                maxLines: null,
                expands: true,
                decoration: AppResources.decoration.fieldDecoration(
                  context: context,
                  hintText: "Message",
                ),
                style: const TextStyle(fontSize: 16),
              ),
              Positioned(
                  bottom: 8,
                  right: 8,
                  child: GestureDetector(
                    child: Image.asset('assets/images/resize.png',
                        height: 15, width: 15),
                    onPanUpdate: (details) {
                      setState(() {
                        _height += details.delta.dy;

                        // prevent overflow if height is more/less than available space
                        var maxLimit =
                            _maxHeight - _dividerHeight - _dividerSpace;
                        var minLimit = 44.0;

                        if (_height > maxLimit) {
                          _height = maxLimit;
                        } else if (_height < minLimit) _height = minLimit;
                      });
                    },
                  )),
            ]),
          ),
          SizedBox(height: _dividerSpace),
          Align(
            alignment: Alignment.topLeft,
            child: CustomButton(
              text: 'Send Message',
              color: const Color(0xff0B3FF7),
              onPressed: () {},
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
