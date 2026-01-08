enum SwipeDirection {
  /// The [UIProSwipeableTile] can be swiped by dragging either left or right.
  horizontal,

  /// The [UIProSwipeableTile] can be swiped by dragging in the reverse of the
  /// reading direction (e.g., from right to left in left-to-right languages).
  endToStart,

  /// The [UIProSwipeableTile] can be swiped by dragging in the reading direction
  /// (e.g., from left to right in left-to-right languages).
  startToEnd,

  /// The [UIProSwipeableTile] cannot be swiped by dragging.
  none,
}
