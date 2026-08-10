# PoseIQ Spine Version Log

Purpose: keep a short, practical record of what changed in each version, why it changed, and what should be tested next.

Product north star: **Simple enough to use. Useful enough to repeat. Scientific enough to trust. Small enough to ship.**

---

## v3 — Working measurement prototype

**Role:** Functional starting point.

### What it did
- Camera-based torso tracking with MediaPipe.
- Side-view neutral calibration.
- Three forward bends.
- Front-view neutral calibration.
- Three left and three right lateral bends.
- Flexion, extension, side-bend and asymmetry result values.
- GPU with CPU fallback.

### Main limitation
- Looked and behaved like a webpage with hero section, side dashboard and scrolling results.
- Rep detection depended on fixed thresholds and orientation assumptions.

---

## v4 — CAD-style full-screen product shell

**Goal:** Make the experience itself the product.

### Changed
- Rebuilt the UI around a full-screen camera workspace.
- Removed the permanent side dashboard and decorative spine model.
- One instruction at a time.
- Floating glass controls and minimal tracking status.
- Contextual angle and rep count only when useful.
- Result shown as an overlay rather than a separate page.
- Save/share/copy/test-again actions integrated into the result card.

### Kept
- v3 measurement engine as the starting point.

---

## v5 — Forward-bend orientation fix

**Problem:** Forward bends could move on screen but remain at 0/3 because the sign used to identify flexion depended on which way the person stood side-on.

### Changed
- First clear completed forward bend establishes the session's forward direction.
- Rep counted only after returning toward neutral.
- Restart clears the learned direction.

### Result
- Forward bending works regardless of left-facing or right-facing side view.

---

## v6 — Adaptive rep detection and robust result rendering

**Problems:**
- Lateral bending required an unnecessarily large fixed excursion.
- Single extreme frames could influence reported range.
- Result-card CSS made numeric values visually confusing.

### Changed
- Lateral-bend entry/exit thresholds adapt to calibrated neutral noise.
- Small genuine movements can count while neutral jitter is rejected.
- Result values made more robust to single-frame spikes.
- Result number typography fixed.
- Tracking wording made more transparent.

---

## v7 — Defensible kinematic definition

**Goal:** Make the mathematical output easier to defend scientifically.

### Changed
- Corrected MediaPipe normalized coordinates for image aspect ratio before angle calculation:
  - `dx = (shoulder_x - hip_x) * image_width`
  - `dy = (hip_y - shoulder_y) * image_height`
  - angle from `atan2(dx, dy)`.
- Neutral noise estimated robustly using median absolute deviation scaled by 1.4826.
- Flexion and lateral-bend result = median peak of the three completed repetitions.
- Side difference = absolute difference between left and right median peaks.
- Tracking quality = percentage of usable measurement frames.
- Removed claimed extension ROM because the guided protocol does not include a dedicated extension trial.
- Added scientific explanation of what the numbers mean and what they do not mean.

### Measurement scope
PoseIQ Spine measures **gross observable 2D trunk inclination relative to the user's calibrated neutral**. It does not directly measure individual vertebrae, spinal curvature, discs, loading, pathology or diagnosis.

---

## v8 — Visual movement guidance and clearer science access

**Goal:** Reduce first-time-user ambiguity without adding complexity.

### Changed
- Added simple silhouette/vector guidance inside the camera workspace for:
  - turning side-on,
  - forward bending,
  - facing the camera,
  - left/right lateral bending.
- Added a visible **What the numbers mean** link on the result card.
- Added the same explanation through Settings.
- Slightly increased transition time between movement stages.
- Kept v7 measurement logic and visual design intact.

---

## v9 — Screen-free cues, performance and framing safeguards

**Goal:** Improve real-world mobile use without changing the core experience.

### Added

#### 1. Audio and haptic rep feedback
- Gentle cue on neutral lock.
- Short cue when a repetition is completed.
- Completion cue when the profile is finished.
- Uses `navigator.vibrate()` where supported.
- Uses a lightweight Web Audio oscillator for sound cues.
- Sound can be switched off from the existing Settings sheet.
- No spoken voice prompts were added, keeping the experience quiet and minimal.

#### 2. Pose inference throttled to ~30 FPS
- `requestAnimationFrame` still drives the application loop.
- MediaPipe inference runs only when approximately 33 ms have elapsed.
- Reduces unnecessary mobile CPU/GPU load, heat and battery use during the short test.

#### 3. Early framing / boundary warning
- Watches shoulder landmarks for proximity to the top or side edges.
- If shoulders approach the outer ~8% of the frame, the user sees **Step back slightly** before the movement is accepted.
- Prevents reps being built from partly clipped torso geometry.

#### 4. Higher result-card text contrast
- Secondary text on white metric cards darkened for better readability in bright environments.

### Deliberately not added
- No accounts.
- No dashboards.
- No new biomechanical outputs.
- No diagnosis or normative interpretation.
- No continuous speech coaching.

### Test next
- iPhone Safari and Android Chrome.
- Laptop webcam.
- Side-on facing both directions.
- Portrait and landscape orientation.
- Small, medium and large lateral bends.
- Tall user / close camera to confirm edge warning.
- Compare device heat and smoothness against v8.
- Confirm sound cue works after Start and can be disabled.
- Repeat 3 to 5 full tests under the same setup and inspect within-person repeatability.

---

# Template for every version from v10 onward

## vX — Short version name

**Goal:** one sentence.

### Problem observed
- What user/test exposed the problem?

### Changed
- Only concrete changes made in this version.

### Measurement impact
- None / describe exactly what definition or calculation changed.

### UX impact
- What the user will notice.

### Deliberately not changed
- Anything intentionally preserved.

### Test next
- 3–6 concrete checks before another build.

### Decision
- **KEEP / FIX / REVERT / VALIDATE** after testing.
