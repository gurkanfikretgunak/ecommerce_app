import 'package:flutter/material.dart';

enum ToastType {
  success,
  error,
  warning,
  info,
}

class ToastMessageLabel extends StatelessWidget {
  final String title;
  final String description;
  final ToastType type;
  final Duration duration;

  const ToastMessageLabel({
    super.key,
    required this.title,
    required this.description,
    this.type = ToastType.info,
    this.duration = const Duration(seconds: 3),
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  void show(BuildContext context) {
    final color = _getBackgroundColor(type);
    final icon = _getIcon(type);

    final overlay = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  icon,
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(overlay);

    Future.delayed(duration, () {
      overlay.remove();
    });
  }

  Color _getBackgroundColor(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Colors.green;
      case ToastType.error:
        return Colors.red;
      case ToastType.warning:
        return Colors.orange;
      case ToastType.info:
      default:
        return Colors.blue;
    }
  }

  Icon _getIcon(ToastType type) {
    switch (type) {
      case ToastType.success:
        return const Icon(Icons.check_circle, color: Colors.white);
      case ToastType.error:
        return const Icon(Icons.error, color: Colors.white);
      case ToastType.warning:
        return const Icon(Icons.warning, color: Colors.white);
      case ToastType.info:
      default:
        return const Icon(Icons.info, color: Colors.white);
    }
  }
}
