---
phase: project-design-system
title: Design System
description: Design identity, visual language, and UI tokens — the LLM's guide for generating UI that feels intentionally designed, not generically AI-generated
---

# Design System

## Design Identity

Before any tokens or components — define the soul of this product's visual language.

| Aspect          | Description                                                                                           |
| --------------- | ----------------------------------------------------------------------------------------------------- |
| Purpose         | What problem does this interface solve? Who uses it? What do they feel while using it?                |
| Tone            | Pick a BOLD direction. Examples: brutally minimal, maximalist chaos, retro-futuristic, organic/natural, luxury/refined, playful/toy-like, editorial/magazine, brutalist/raw, art deco/geometric, industrial/utilitarian. Commit fully — half-measures produce generic UI. |
| Reference       | Visual references that capture the vibe (e.g., "Stripe's clarity + Linear's density", a film, an art movement, a physical object). NOT a list of SaaS apps to copy. |
| Differentiation | What makes this UI UNFORGETTABLE? The one thing someone remembers after closing the tab.              |

## Design Principles

Principles that guide every UI decision. When trade-offs arise, higher-numbered principles yield to lower.

1. (e.g., "Every pixel earns its place — if it doesn't serve the user, remove it")
2. (e.g., "Content is the interface — UI disappears, content speaks")
3. (e.g., "Delight through restraint — one perfect animation beats ten mediocre ones")

## Color Palette

Design the palette as a system, not a list of hex values. Each color has a role and a reason.

| Role       | Token       | Value   | Usage                        | Why this color                    |
| ---------- | ----------- | ------- | ---------------------------- | --------------------------------- |
| Primary    | `primary`   | #------ | CTAs, key actions            | (rationale for this specific hue) |
| Secondary  | `secondary` | #------ | Supporting actions, accents  | (rationale)                       |
| Background | `bg`        | #------ | Page canvas                  | (rationale)                       |
| Surface    | `surface`   | #------ | Cards, modals, elevated      | (rationale)                       |
| Text       | `text`      | #------ | Body copy                    | (rationale)                       |
| Muted      | `muted`     | #------ | Secondary text, placeholders | (rationale)                       |
| Error      | `error`     | #------ | Destructive/error states     |                                   |
| Success    | `success`   | #------ | Confirmation/success states  |                                   |

**Palette strategy:** (e.g., "Dominant dark with a single sharp accent" / "Warm neutrals with cold highlights" / "Monochrome with one signature color")

**Dark mode:** (approach — e.g., "Invert luminance, preserve hue relationships" / "Separate palette, not a simple swap")

### Avoid

- Cliched purple-on-white gradients
- Evenly distributed palettes where every color competes for attention
- Default framework colors used as-is (Tailwind blue-500 as primary)

## Typography

Fonts carry personality. Generic fonts produce generic UI.

| Role    | Font              | Size  | Weight   | Line Height | Letter Spacing | Usage             |
| ------- | ----------------- | ----- | -------- | ----------- | -------------- | ----------------- |
| Display | (distinctive)     | 40-56 | Bold     | 1.1         | -0.02em        | Hero, page titles |
| H1      | (display or body) | 32    | Bold     | 1.2         | -0.01em        | Section titles    |
| H2      |                   | 24    | Semibold | 1.3         |                | Subsections       |
| Body    | (refined, readable) | 16  | Normal   | 1.6         |                | Content           |
| Caption |                   | 12-13 | Medium   | 1.4         | 0.01em         | Labels, metadata  |
| Mono    | (for code/data)   | 14    | Normal   | 1.5         |                | Code, tabular     |

**Pairing strategy:** (e.g., "Characterful display × clean body" / "Single family, weight contrast only")

### Avoid

- Inter, Roboto, Arial, system-ui as primary choices — these are the "I didn't choose a font" fonts
- More than 2 font families (weight/size contrast within families is sufficient)
- Uniform sizing with no clear hierarchy

## Spacing & Layout

| Token | Value | Usage                          |
| ----- | ----- | ------------------------------ |
| xs    | 4px   | Tight gaps, icon padding       |
| sm    | 8px   | Related element spacing        |
| md    | 16px  | Standard content spacing       |
| lg    | 24px  | Section separation             |
| xl    | 32px  | Major section breaks           |
| 2xl   | 48px  | Page-level spacing             |
| 3xl   | 64px  | Hero/feature section breathing |

**Base unit:** 4px (all values are multiples)

**Layout philosophy:** (e.g., "Generous whitespace, content breathes" / "Dense but organized, information-rich" / "Asymmetric, editorial grid-breaking")

**Max content width:** (e.g., 720px for reading, 1200px for dashboards)

## Motion & Interaction

Motion is communication, not decoration. Define the system, not individual animations.

| Property  | Value                  | Usage                                  |
| --------- | ---------------------- | -------------------------------------- |
| Duration  | 150ms / 250ms / 400ms | Micro / Standard / Emphasis            |
| Easing    | (e.g., cubic-bezier)  | Consistent feel across all transitions |
| Enter     | (e.g., fade + slide)  | Elements appearing                     |
| Exit      | (e.g., fade out)      | Elements leaving                       |
| Hover     | (e.g., subtle lift)   | Interactive feedback                   |
| Loading   | (e.g., skeleton/pulse)| Content loading states                 |

**Motion philosophy:** (e.g., "One orchestrated page-load sequence > scattered micro-interactions" / "Physics-based, everything has weight" / "Instant and snappy, no waiting")

### Avoid

- Motion for motion's sake — every animation must communicate something
- Slow transitions (>400ms) that make the UI feel sluggish
- Inconsistent easing across different components

## Backgrounds & Atmosphere

Flat solid colors are the default — defaults are forgettable. Define the visual texture.

- **Background treatment:** (e.g., "Subtle noise grain overlay" / "Gradient mesh" / "Clean solid" / "Layered transparencies")
- **Depth strategy:** (e.g., "Elevation via shadow" / "Border-only separation" / "Background tint layers")
- **Decorative elements:** (e.g., "None — pure content" / "Geometric accents at section breaks" / "Organic blob shapes as background texture")

## Component Patterns

High-level patterns — feature docs contain detailed component specs.

- **Buttons:** Variants (Primary, Secondary, Ghost, Destructive). Sizes (sm, md, lg). States (default, hover, active, disabled, loading).
- **Forms:** Label position (above/inline). Validation display (inline error, border color). Required field indicator.
- **Feedback:** Toast (transient messages). Inline (persistent errors). Skeleton (loading). Empty state (no data).
- **Cards:** Elevation style. Border treatment. Padding scale. Hover behavior.
- **Navigation:** Pattern (sidebar/topbar/tabs). Active state. Mobile behavior.

## Accessibility

Non-negotiable constraints that override aesthetic preferences.

- Color contrast: 4.5:1 (normal text), 3:1 (large text / UI components)
- Touch targets: minimum 44×44px
- Focus indicators: visible, high-contrast, consistent
- Semantic HTML elements, ARIA labels where needed
- Reduced motion: respect `prefers-reduced-motion`, provide static fallbacks
- Color alone must never be the only indicator of state
