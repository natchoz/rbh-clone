enum ActionStatus {
  initial,
  loading,
  success,
  error,
}

abstract class ActionState {
  const ActionState({this.status = ActionStatus.initial});
  final ActionStatus status;
}
