// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void removeLoadingContainer() {
  html.window.document.getElementById('loading-container')?.remove();
}
