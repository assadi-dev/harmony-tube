bool isHttpUrl(String potentialUrl) {
  final uri = Uri.tryParse(potentialUrl);
  if (uri == null) {
    return false;
  }
  return uri.isScheme('http') || uri.isScheme('https');
}