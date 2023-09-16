import 'package:booking/exceptions.dart';
import 'package:booking/fonts.dart';
import 'package:flutter/material.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({super.key, required this.exception});
  final Exception exception;
  static const Map<Type, String> errorLabels = {
    NoInternetException:
        'Нет подключения к интернету.\nПроверьте подключение ипопробуйте снова',
    NotFoundException: 'Запрашиваемая вами страница не найдена',
    ServerException: 'Ошибка сервера',
  };
  static const Map<Type, Icon> errorIcons = {
    NoInternetException: Icon(Icons.wifi_off, size: 50, color: Colors.grey),
    NotFoundException: Icon(Icons.error_outline, size: 50, color: Colors.grey),
    ServerException: Icon(Icons.error_outline, size: 50, color: Colors.grey),
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            errorIcons[exception.runtimeType] ?? const SizedBox.shrink(),
            Text(
              errorLabels[exception.runtimeType] ?? 'Неизвестная ошибка',
              style: AppFonts.detailValue,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
