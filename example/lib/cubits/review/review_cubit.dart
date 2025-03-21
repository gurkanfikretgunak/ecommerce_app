import 'package:bloc/bloc.dart';
import 'package:example/cubits/review/review_state.dart';
import 'package:example/models/review_model/review_model.dart';
import 'package:example/respository/review_respository/review_respository.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());

  Future<void> postReview(Review review) async {
    emit(ReviewInitial());
    try {
      await ReviewRespository().postReview(review);

      emit(ReviewSuccess("Review posted successfully!"));
    } catch (e) {
      emit(ReviewError("Failed to post review: ${e.toString()}"));
    }
  }
}
