class Response{
  bool success;
  String reason;

  Response({
    this.success,
    this.reason
  });

  factory Response.fromJson(Map<String, dynamic> parsedJson){
    return Response(
      success: parsedJson['success'],
      reason : parsedJson['reason'],
    );
  }
}