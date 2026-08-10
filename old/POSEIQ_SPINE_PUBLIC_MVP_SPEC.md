# PoseIQ Spine — Public MVP / Learning Launch Spec

## Product
**URL:** `spine.poseiq.com`  
**Working prototype:** https://inspiring-starlight-085bed.netlify.app/  
**Positioning:** A playful digital spine lab where a person can see, fit, and move a 3D spine model with their own body.

## Core promise
**Your movement. Your spine model.**

The public MVP should do two jobs:
1. Create an immediate “wow” moment.
2. Teach us what users actually want from PoseIQ Spine.

## Core experience

### 1. Instant 3D spine
The page opens directly into a clean interactive 3D spine + pelvis.
- Rotate
- Zoom
- Explore
- No login
- No setup
- Fast mobile-first load

### 2. Camera → shared stage
User turns the camera on.

The live person, tracked body landmarks, and 3D spine all appear in the **same view**.

This is the signature PoseIQ Spine interaction.

### 3. Snap to me
A clear CTA: **Snap to me**

The 3D spine:
- aligns to the visible trunk
- scales to the person
- positions with the pelvis/trunk
- follows observable trunk movement
- remains visually editable

This should feel playful and almost game-like.

### 4. Make it mine
Allow simple visual fitting:
- Lumbar curve
- Thoracic curve
- Pelvic tilt
- Trunk lean
- Body scale

Later, replace sliders or supplement them with direct manipulation/control points.

### 5. Move
Once snapped, movement drives the visible model.

Start with:
- flexion / extension
- lateral bend
- rotation

Then add:
- sit-to-stand
- squat
- walking
- selected functional tasks

### 6. Information emerges progressively
Do not overwhelm the user.

Start with a few understandable metrics:
- Trunk lean
- Shoulder tilt
- Flexion ROM
- Symmetry
- Smoothness / control

Allow **“Show more”** for deeper outputs.

## Scientific language

Every output must be visibly classified as:

### Measured
Directly derived from observable camera landmarks or motion.

### Modeled
A property of the fitted 3D spine/pelvis model.

### Estimated
A quantity inferred using assumptions or algorithms.

Never imply that RGB video directly measures:
- individual vertebral angles
- disc position
- disc pressure
- facet loading
- internal spinal geometry
- pathology

Core wording:
> The fitted 3D spine is a model constrained by visible posture and movement. It is not a direct measurement of individual vertebrae, discs, facets, or internal spinal structures.

## Public MVP learning system — PoseIQ Pulse

Attach **PoseIQ Pulse** to the product from day one.

The goal is not surveillance or heavy analytics. The goal is to learn whether people understand, enjoy, and value the experience.

### Anonymous event telemetry
Capture:
- page_opened
- model_rotated
- model_zoomed
- camera_clicked
- camera_started
- camera_failed
- tracking_started
- snap_clicked
- snap_success
- snap_failed
- auto_fit_clicked
- lumbar_adjusted
- thoracic_adjusted
- pelvic_tilt_adjusted
- trunk_lean_adjusted
- movement_detected
- metric_expanded
- reset_clicked
- feedback_opened
- feedback_submitted
- session_duration
- device category
- browser category
- coarse viewport size

Do **not** upload or store camera video in the first public MVP.

### Session funnel
Pulse should make this funnel visible:

**Visit → Explore → Camera → Track → Snap → Move → Inspect → Feedback**

Key questions:
- What percentage turn on camera?
- What percentage successfully track?
- What percentage snap?
- Do people actually move after snapping?
- Which model controls are touched?
- Which metrics are opened?
- How long do they stay?
- Where do they leave?

## Lightweight user feedback

After a meaningful interaction, not immediately on page load:

**Was this useful or interesting?**
- Yes
- Not yet

Then optional:
**What would you use this for?**
- Understand my movement
- Clinical assessment
- Teaching / education
- Research
- Sport / performance
- Just exploring
- Other

Optional free text:
**What would you want PoseIQ Spine to show you next?**

Optional email:
**Want to test the next version?**
[ email ]

Email must be optional and clearly separated from anonymous product telemetry.

## First-public-version UI

Keep the page extremely simple:

### Header
PoseIQ Spine  
Small PoseIQ mark  
Optional “About” / scientific boundary

### Main stage
The shared camera + skeleton + 3D spine scene should dominate the page.

Primary CTA:
**Turn camera on**

When tracking:
**Snap to me**

### Controls
Compact bottom sheet / side panel:
- Lumbar
- Thoracic
- Pelvis
- Scale
- Reset

### Metrics
Only 3–5 visible initially.

### Pulse feedback
Tiny unobtrusive feedback tab/button.

## Wow details worth adding before public sharing
- Smooth animated spine snap
- Brief glow/highlight when registration succeeds
- Better pelvis anchor
- Mobile full-screen stage
- Mirror camera correctly
- Front/side view handling
- Tracking confidence indicator
- Clear “step back / move into frame” guidance
- Graceful camera permission failure
- Loading state for 3D + tracking libraries
- Reset to neutral in one tap
- Capture/share a screenshot later, only with explicit user action

## Technical hardening before `spine.poseiq.com`
- Separate development and production environments
- Remove MVP/debug labels
- Production error handling
- HTTPS
- Mobile Safari + Android Chrome test
- Desktop Chrome/Edge/Safari test
- Camera permission testing
- Tracking performance / FPS checks
- Lazy-load heavy libraries
- Basic accessibility
- Privacy page
- Terms / research disclaimer if needed
- Analytics consent approach appropriate to deployed regions
- No raw video storage by default
- No health diagnosis claims

## Minimal backend
For the first learning launch, backend can stay tiny.

Suggested data:
- anonymous_session_id
- timestamp
- event_name
- event_properties
- app_version
- device/browser metadata
- optional_feedback
- optional_email only if voluntarily submitted

Possible stack:
- Netlify frontend
- Supabase for Pulse events + feedback
- Netlify Functions / Supabase Edge Function if needed

Keep the 3D and pose processing local in-browser where practical.

## Pulse dashboard
A tiny internal dashboard is enough initially:

### Today / 7 days / 30 days
- Visitors
- Camera start %
- Tracking success %
- Snap %
- Movement-after-snap %
- Median active session
- Feedback positive %
- Emails captured

### Top interactions
- Most adjusted model parameter
- Most viewed metric
- Most common intended use
- Most common failure point

## Learning rules

Do not add features because they sound cool.

Use the public MVP to decide:

### KILL
People do not understand or use it.

### KEEP
People explore it, but there is weak pull for deeper use.

### BUILD
Users repeatedly request a specific useful capability.

### DOUBLE DOWN
Users complete the core flow, return, share it, volunteer contact details, or ask to use it clinically/research-wise.

## Likely next product layers

Only after learning:

### Spine Profile
Save/compare sessions.

### Guided movement tests
Standardised flexion, extension, rotation, lateral bending, sit-to-stand.

### Clinician mode
Share a test link and review movement results.

### Education mode
Explore how posture/model parameters affect visible geometry.

### Research mode
Export movement time series and metadata.

### Sensor fusion
Camera + IMU + force + EMG + imaging when justified.

### Advanced 3D
More anatomically detailed model, segment-level assumptions, better fitting, side/front multi-view, eventually calibrated multi-camera or sensor-supported modelling.

## Public-launch definition of done

We can share `spine.poseiq.com` publicly when:

- 3D model loads reliably
- camera works on common phones/laptops
- person + tracking + spine are one shared view
- Snap to me feels visually convincing
- user can move and see the model respond
- basic model fitting works
- 3–5 useful metrics update
- measured/modeled/estimated distinction is visible
- scientific boundary is present but not intrusive
- no camera video is uploaded
- Pulse events are recorded
- feedback works
- optional email capture works
- major errors are logged
- page looks good enough to share without explanation

## Product principle

**Impress → interact → learn → build.**

The first public Spine product does not need to solve spine biomechanics.

It needs to make the idea tangible, scientifically honest, enjoyable enough to explore, and instrumented well enough that real users tell us what PoseIQ Spine should become next.
