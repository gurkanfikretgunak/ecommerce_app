import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfilePictureLabel extends StatefulWidget {
  final String? title;
  final String description;
  final String buttonText;
  final Color? buttonColor;
  final double? buttonHeight;
  final double? titleFontSize;
  final String? imagePath;
  final Function(String)? onImageSelected;
  final VoidCallback? onPressed;

  const ChangeProfilePictureLabel(
      {super.key,
      this.title,
      required this.description,
      required this.buttonText,
      this.buttonColor,
      this.buttonHeight,
      this.titleFontSize,
      required this.imagePath,
      this.onImageSelected,
      this.onPressed});

  @override
  State<ChangeProfilePictureLabel> createState() =>
      _ChangeProfilePictureLabelState();
}

class _ChangeProfilePictureLabelState extends State<ChangeProfilePictureLabel> {
  final ImagePicker _picker = ImagePicker();
  late String? _selectedImagePath;

  @override
  void initState() {
    super.initState();
    _selectedImagePath = widget.imagePath;
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImagePath = image.path;
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AccountPictureLabel(
                        imagePath: _selectedImagePath ?? "",
                        imageHeight: 120,
                        icon: Icons.edit,
                        imageWidth: 120,
                        onPressed: () {
                          _pickImage();
                        }),
                    context.emptySizedHeightBoxNormal,
                    HeadText(
                      fontSize: widget.titleFontSize ?? 30,
                      color: ColorConstant.instance.neutral1,
                      text: widget.title ?? "Change Profile Picture",
                    ),
                    context.emptySizedHeightBoxNormal,
                    SizedBox(
                      width: 300,
                      child: ContentText(
                        fontSize: 14,
                        softWrap: true,
                        color: ColorConstant.instance.neutral4,
                        text: widget.description,
                      ),
                    ),
                    context.emptySizedHeightBoxNormal,
                    Opacity(
                      opacity: _selectedImagePath != widget.imagePath ? 1 : 0.5,
                      child: CustomButton(
                        onPressed: _selectedImagePath != null
                            ? () {
                                if (_selectedImagePath != widget.imagePath) {
                                  widget.onImageSelected!(_selectedImagePath!);
                                }
                                Navigator.pop(context);
                              }
                            : null,
                        color: widget.buttonColor ??
                            ColorConstant.instance.primary_main,
                        height: widget.buttonHeight ?? 40,
                        text: widget.buttonText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
