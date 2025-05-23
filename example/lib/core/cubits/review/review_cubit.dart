import 'package:bloc/bloc.dart';
import 'package:example/core/cubits/review/review_state.dart';
import 'package:example/core/network/models/review_model/review_model.dart';
import 'package:example/core/network/repository/review_repository/review_repository.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());

  Future<void> postReview(Review review) async {
    emit(ReviewInitial());
    try {
      await ReviewRepository().postReview(review);

      emit(ReviewSuccess("Review posted successfully!"));
    } catch (e) {
      emit(ReviewError("Failed to post review: ${e.toString()}"));
    }
  }
}
