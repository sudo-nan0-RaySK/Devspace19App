class Response{
  bool success;
  String reason;
  String name;

  Response({
    this.success,
    this.reason,
    this.name
  });

  factory Response.fromJson(Map<String, dynamic> parsedJson){
    return Response(
      success: parsedJson['success'],
      reason : parsedJson['reason'],
      name:parsedJson['user']
    );
  }
}