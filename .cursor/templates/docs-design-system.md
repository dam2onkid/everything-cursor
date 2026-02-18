---
phase: project-design-system
title: Design System
description: Cross-platform UI/UX language, theme, component patterns, and visual style guide for Next.js (web) and Expo (mobile)
---

# Design System

## Changelog

| Date       | Action  | Summary          |
| ---------- | ------- | ---------------- |
| YYYY-MM-DD | Created | Initial creation |

## Design Philosophy

- Core design principles guiding the application's look and feel
- Target user profile and experience goals
- Cross-platform consistency: shared visual language across web (Next.js) and mobile (Expo)
- Platform-appropriate interactions: respect native conventions per platform

## Platforms

| Platform | Framework | Styling Approach       | Notes                        |
| -------- | --------- | ---------------------- | ---------------------------- |
| Web      | Next.js   | CSS variables / Tailwind / CSS-in-JS | Server & client components   |
| Mobile   | Expo (React Native) | StyleSheet / NativeWind / styled-components | iOS & Android targets        |

## Color Palette

Shared tokens — implemented as CSS variables (web) and theme constants (mobile).

| Role       | Token              | Value   | Web (CSS)               | Mobile (RN)                | Usage              |
| ---------- | ------------------ | ------- | ----------------------- | -------------------------- | ------------------ |
| Primary    | `color.primary`    | #000000 | `--color-primary`       | `theme.colors.primary`     | Buttons, links     |
| Secondary  | `color.secondary`  | #000000 | `--color-secondary`     | `theme.colors.secondary`   | Accents, badges    |
| Background | `color.bg`         | #000000 | `--color-bg`            | `theme.colors.bg`          | Page/screen background |
| Surface    | `color.surface`    | #000000 | `--color-surface`       | `theme.colors.surface`     | Cards, modals, sheets |
| Error      | `color.error`      | #000000 | `--color-error`         | `theme.colors.error`       | Error states       |
| Success    | `color.success`    | #000000 | `--color-success`       | `theme.colors.success`     | Success states     |
| Warning    | `color.warning`    | #000000 | `--color-warning`       | `theme.colors.warning`     | Warning states     |

### Dark Mode

| Token              | Light   | Dark    |
| ------------------ | ------- | ------- |
| `color.bg`         | #FFFFFF | #000000 |
| `color.surface`    | #F5F5F5 | #1A1A1A |
| `color.text`       | #111111 | #EEEEEE |

- Web: CSS `prefers-color-scheme` + class toggle
- Mobile: `useColorScheme()` from React Native / Expo

## Typography

Shared scale — font families differ per platform.

| Role    | Web Font    | Mobile Font      | Size (web / mobile) | Weight | Usage          |
| ------- | ----------- | ---------------- | ------------------- | ------ | -------------- |
| H1      | -           | System default   | 32px / 32           | Bold   | Screen titles  |
| H2      | -           | System default   | 24px / 24           | Semi   | Section titles |
| Body    | -           | System default   | 16px / 16           | Normal | Paragraphs     |
| Caption | -           | System default   | 12px / 12           | Normal | Labels, hints  |
| Code    | Monospace   | Monospace        | 14px / 14           | Normal | Code snippets  |

- Web: `next/font` for optimized loading
- Mobile: Expo `expo-font` or system fonts

## Spacing & Layout

Shared spacing scale used on both platforms.

| Token | Value | Web        | Mobile          | Usage              |
| ----- | ----- | ---------- | --------------- | ------------------ |
| xs    | 4     | 4px / 0.25rem | 4               | Tight spacing      |
| sm    | 8     | 8px / 0.5rem  | 8               | Component internal |
| md    | 16    | 16px / 1rem   | 16              | Section spacing    |
| lg    | 24    | 24px / 1.5rem | 24              | Page sections      |
| xl    | 32    | 32px / 2rem   | 32              | Major separations  |

## Component Patterns

### Buttons

| Variant     | Web Component        | Mobile Component          |
| ----------- | -------------------- | ------------------------- |
| Primary     | `<Button>`           | `<Button>` / `Pressable`  |
| Secondary   | `<Button variant>`   | `<Button variant>`         |
| Ghost       | `<Button variant>`   | `<Button variant>`         |
| Destructive | `<Button variant>`   | `<Button variant>`         |

- Size variants: sm, md, lg
- States: default, hover (web), pressed (mobile), active, disabled, loading
- Web: hover/focus states via CSS
- Mobile: `Pressable` feedback, haptics where appropriate

### Forms

- Input fields, selects, checkboxes, radio buttons
- Validation states: default, error, success
- Label and help text patterns
- Web: native HTML inputs with controlled components
- Mobile: `TextInput`, `Switch`, custom pickers

### Navigation

| Pattern            | Web (Next.js)                  | Mobile (Expo)                     |
| ------------------ | ------------------------------ | --------------------------------- |
| Top navigation     | Header / navbar                | Stack header / custom header      |
| Side navigation    | Sidebar (desktop)              | Drawer navigator                  |
| Bottom navigation  | N/A or footer                  | Bottom tab navigator              |
| Routing            | App Router (`app/`)            | Expo Router (`app/`)              |

### Feedback

| Pattern       | Web                          | Mobile                            |
| ------------- | ---------------------------- | --------------------------------- |
| Toast         | Toast component              | Toast / native alert              |
| Loading       | Skeleton, spinner            | ActivityIndicator, skeleton       |
| Empty state   | Illustration + CTA           | Illustration + CTA                |
| Error state   | Error boundary + fallback UI | Error boundary + fallback screen  |
| Pull to refresh | N/A                        | `RefreshControl`                  |

### Platform-Specific Patterns

**Web only:**
- Hover states, tooltips, cursor changes
- Keyboard shortcuts
- Right-click context menus

**Mobile only:**
- Swipe gestures (e.g., swipe to delete)
- Haptic feedback
- Safe area insets (`SafeAreaView` / `useSafeAreaInsets`)
- Platform-specific UI (iOS sheets, Android material)

## Responsive Strategy

### Web Breakpoints

| Breakpoint | Value  | Target          |
| ---------- | ------ | --------------- |
| sm         | 640px  | Mobile web      |
| md         | 768px  | Tablet          |
| lg         | 1024px | Desktop         |
| xl         | 1280px | Wide desktop    |

### Mobile Adaptive Layout

| Strategy              | Usage                                    |
| --------------------- | ---------------------------------------- |
| `Dimensions` API      | Screen-size-dependent layouts            |
| `useWindowDimensions`  | Responsive component sizing              |
| `Platform.OS`         | iOS vs Android conditional styling       |
| Flex layout           | Primary layout mechanism                 |
| Safe areas            | Notch / home indicator avoidance         |

## Accessibility

- WCAG compliance target (AA / AAA) for web
- iOS VoiceOver & Android TalkBack support for mobile
- Minimum contrast ratios (4.5:1 normal text, 3:1 large text)
- Web: semantic HTML, ARIA attributes, keyboard navigation
- Mobile: `accessibilityLabel`, `accessibilityRole`, `accessibilityHint`
- Touch targets: minimum 44x44pt (mobile), 44x44px (web)

## Animation & Motion

| Aspect     | Web                              | Mobile                                |
| ---------- | -------------------------------- | ------------------------------------- |
| Library    | CSS transitions / Framer Motion  | React Native Reanimated / Animated    |
| Duration   | 150-300ms typical                | 200-350ms typical                     |
| Easing     | ease-in-out                      | Easing.bezier or spring               |
| Principles | Subtle, purposeful, non-blocking | 60fps, native driver, gesture-driven  |

## Shared Token Strategy

Recommended approach for keeping web and mobile in sync:

- Define tokens in a shared JSON/TS file (e.g., `packages/tokens/`)
- Generate platform-specific outputs:
  - Web: CSS custom properties or Tailwind config
  - Mobile: React Native theme object
- Single source of truth prevents drift between platforms

## Related Documents

| Document                            | Description                            |
| ----------------------------------- | -------------------------------------- |
| [Overview](./overview.md)           | Project concept & documentation index  |
| [Architecture](./architecture.md)   | Tech stack & folder structure          |
| [Database](./database.md)           | Schema & relationships                 |
| [API](./api.md)                     | Endpoints & conventions                |
| [Roadmap](./roadmap.md)             | Versions & milestones                  |
