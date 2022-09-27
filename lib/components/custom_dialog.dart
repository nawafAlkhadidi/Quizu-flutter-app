import 'package:quiz_u/library.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, text, path, descriptions;
  final VoidCallback onPressed;
  const CustomDialogBox(
      {Key? key,
      required this.title,
      required this.text,
      required this.onPressed,
      required this.path,
      required this.descriptions})
      : super(key: key);

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: 20, top: 20 + 20, right: 20, bottom: 20),
          margin: const EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              widget.descriptions.isEmpty
                  ? const SizedBox(
                      height: 15,
                    )
                  : Text(
                      widget.descriptions,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
              widget.descriptions.isEmpty
                  ? const SizedBox()
                  : const SizedBox(
                      height: 15,
                    ),
              Align(
                alignment: Alignment.bottomRight,
                child: DefaultButton(
                  height: 50,
                  width: double.infinity,
                  textColor: Colors.black,
                  font: 20,
                  onPress: widget.onPressed,
                  text: widget.text,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(45)),
              child: SvgPicture.asset(widget.path, height: 200, width: 200),
              //
            ),
          ),
        ),
        Positioned(
            left: 260,
            top: 50,
            right: -20,
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.blue,
                  size: 30,
                ))),
      ],
    );
  }
}
