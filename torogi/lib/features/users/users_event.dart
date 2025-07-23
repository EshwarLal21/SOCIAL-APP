abstract class UserEvent {}

class LoadFeaturedUsers extends UserEvent {
  final String userId;

  LoadFeaturedUsers(this.userId);
}
