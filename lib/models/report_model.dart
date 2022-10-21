class ReportModel {
  String? message;
  String? status;
  int? modules;
  int? courses;
  int? trainingAttempts;
  List<Coursereports>? coursereports;

  ReportModel(
      {this.message,
      this.status,
      this.modules,
      this.courses,
      this.trainingAttempts,
      this.coursereports});

  ReportModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    modules = json['modules'];
    courses = json['courses'];
    trainingAttempts = json['training_attempts'];
    if (json['coursereports'] != null) {
      coursereports = <Coursereports>[];
      json['coursereports'].forEach((v) {
        coursereports!.add(new Coursereports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    data['modules'] = modules;
    data['courses'] = courses;
    data['training_attempts'] = trainingAttempts;
    if (coursereports != null) {
      data['coursereports'] =
          coursereports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coursereports {
  int? id;
  int? userId;
  int? moduleId;
  int? subPart;
  String? type;
  String? feedbackType;
  int? totalQuestions;
  int? correctAnswers;
  int? trainingAttempts;
  int? evaluationAttempts;
  String? lastEvaluationAttempts;
  int? lastScore;
  int? avg;
  String? createdAt;
  String? updatedAt;

  Coursereports(
      {this.id,
      this.userId,
      this.moduleId,
      this.subPart,
      this.type,
      this.feedbackType,
      this.totalQuestions,
      this.correctAnswers,
      this.trainingAttempts,
      this.evaluationAttempts,
      this.lastEvaluationAttempts,
      this.lastScore,
      this.avg,
      this.createdAt,
      this.updatedAt});

  Coursereports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    moduleId = json['module_id'];
    subPart = json['sub_part'];
    type = json['type'];
    feedbackType = json['feedback_type'];
    totalQuestions = json['total_questions'];
    correctAnswers = json['correct_answers'];
    trainingAttempts = json['training_attempts'];
    evaluationAttempts = json['evaluation_attempts'];
    lastEvaluationAttempts = json['last_evaluation_attempts'];
    lastScore = json['last_score'];
    avg = json['avg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['module_id'] = moduleId;
    data['sub_part'] = subPart;
    data['type'] = type;
    data['feedback_type'] = feedbackType;
    data['total_questions'] = totalQuestions;
    data['correct_answers'] = correctAnswers;
    data['training_attempts'] = trainingAttempts;
    data['evaluation_attempts'] = evaluationAttempts;
    data['last_evaluation_attempts'] = lastEvaluationAttempts;
    data['last_score'] = lastScore;
    data['avg'] = avg;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
