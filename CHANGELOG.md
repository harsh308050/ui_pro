# Changelog

All notable changes to this package will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project follows [Semantic Versioning](https://semver.org/).

---

## [1.0.2] - 2026-01-08

### Added

#### New Widgets
- **UIProBottomNav.fluid()** - Fluid bottom navigation with wave animation and elastic transitions
  - Wave effect with customizable colors
  - Smooth elastic icon animations
  - Scale factor and animation speed controls
  - Supports 20px vertical padding for proper animation space
- **UIProSwipeableTile** - Swipeable list tiles with customizable actions
  - Swipe-to-delete functionality
  - Customizable background builders
  - Confirmation callbacks before swipe actions
  - Card and normal tile variants
  - Swipe threshold and movement duration controls
- **UIProDoubleTapExit** - Exit confirmation wrapper
  - Two styles: SnackBar and Dialog
  - Fully customizable snackbar configuration
  - Custom dialog buttons and callbacks
  - Configurable tap interval
- **UIProEmptyState** - Empty state widget for lists
  - Customizable icon, title, and description
  - Optional action button
  - Custom image support

#### Enhanced Components
- **UIProButton**
  - Added `UIProIconButton` for circular icon buttons
  - Loading state support for icon buttons
  - Tooltip support
  - Custom splash colors and radius
  - Three variants: filled, outlined, text
  - Leading and trailing icon support
  - Custom loading widgets
  - Disabled state animations

- **UIProTextField**
  - Added `UIProTextField.email()` constructor with email validation
  - Added `UIProTextField.password()` constructor with visibility toggle
  - Added `UIProTextField.phone()` constructor for phone input
  - Added `UIProTextField.search()` constructor with clear button
  - Added `UIProTextField.multiline()` constructor for text areas
  - Built-in validation for email and password
  - Focus animations with customizable colors
  - Character counter support
  - Comprehensive customization options

- **UIProListView**
  - Enhanced shimmer loading states
  - Empty state widget support
  - Pull-to-refresh capability
  - Customizable shimmer item count
  - Scroll physics controls

- **UIProAppBar**
  - Badge support for action buttons
  - Tooltip support for actions
  - Custom action widgets
  - Flexible styling options
  - Center title option

- **UIProShimmer**
  - Added `UIProShimmerBuilder` for conditional shimmer
  - Added `UIProShimmerWrap` for wrapping content
  - Pre-built shimmer list and grid layouts
  - Custom shimmer colors (base and highlight)
  - Multiple shapes: rectangle, circle, text

#### New Loaders
- **UIProLoader.horizontalRotatingDots()** - Three rotating dots animation
- **UIProLoader.progressiveDots()** - Progressive dots scaling animation
- **UIProLoader.waveDots()** - Wave-like dots animation
- **UIProLoader.hexagonDots()** - Hexagonal dots formation
- **UIProLoader.flickr()** - Two-color flickering dots

### Improved
- Enhanced documentation with comprehensive examples
- Better Material Theme integration
- Improved animation performance (60 FPS)
- Optimized shimmer rendering
- Better dark mode support
- Enhanced accessibility

### Fixed
- Fixed fluid bottom navigation overflow issues
- Fixed selected icon cutoff in fluid navigation (added 20px top padding)
- Fixed shimmer animation glitches
- Fixed focus animation timing in text fields
- Fixed button loading state transitions

### Documentation
- Comprehensive README with all widgets
- Usage examples for every component
- Migration guide
- Troubleshooting section
- Best practices guide
- Complete API documentation

---

## [1.0.1] - 2026-01-07

### Changed
- Updated minimum Flutter version support to 3.0.0
- Updated Dart SDK constraint to >=2.17.0 <4.0.0
- Improved compatibility with older Flutter versions

### Notes
- Broader SDK version support for maximum compatibility

---

## [1.0.0] - 2026-01-07

### Added
- Initial release of the package
- Core UI components with theme-aware design
- Fully customizable widgets compatible with Flutter themes
- Light and dark mode support
- Responsive layouts for multiple screen sizes
- Well-documented public APIs

#### Initial Widgets
- **UIProButton** - Customizable button with loading states
- **UIProTextField** - Text input with validation
- **UIProListView** - List with shimmer loading
- **UIProAppBar** - Customizable app bar
- **UIProBottomNav** - Standard and floating navigation
- **UIProShimmer** - Shimmer loading effects

### Notes
- First stable public version
- APIs may evolve based on community feedback

---

## Development Guidelines

### Version Format
- MAJOR.MINOR.PATCH (e.g., 1.0.2)
- **MAJOR**: Breaking changes
- **MINOR**: New features (backwards compatible)
- **PATCH**: Bug fixes (backwards compatible)

### Release Checklist
- [ ] Update version in pubspec.yaml
- [ ] Update CHANGELOG.md
- [ ] Update README.md if needed
- [ ] Run tests: `flutter test`
- [ ] Check formatting: `dart format .`
- [ ] Check analysis: `flutter analyze`
- [ ] Test example app
- [ ] Create git tag
- [ ] Publish to pub.dev