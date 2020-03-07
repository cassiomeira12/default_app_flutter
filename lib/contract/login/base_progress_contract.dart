abstract class BaseProgressContract {
  showProgress();
  hideProgress();
  onFailure(String error);
  onSuccess();
}