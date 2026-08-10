# PoseIQ Spine --- Production Roadmap

## Product decision

**PoseIQ Spine is a sub-60-second camera-based Spine Motion Profile.**

The product should do one thing extremely well:

> Open → camera → simple guided movements → useful movement profile →
> save/share result.

No unnecessary dashboard. No decorative spine model in the core test. No
long explanation before starting. Advanced information belongs behind
**Settings / About / Science**.

The goal of the first public version is not to prove every possible
feature. It is to make the smallest useful product people actually use,
then learn what they ask for.

------------------------------------------------------------------------

## Core v1 experience

### Home

Almost nothing.

**PoseIQ Spine**\
**Your spine movement profile in under 60 seconds.**

`Start`

Optional small links: - How it works - Science - Settings

### Test

The **camera fills the screen**.

PoseIQ guides the user with very short prompts:

1.  **Turn side-on**
2.  **Hold still --- neutral locked**
3.  **Bend forward × 3**
4.  **Face camera**
5.  **Hold still --- neutral locked**
6.  **Bend left & right × 3**
7.  **Done**

Live information should be minimal: - current angle - rep count -
tracking / framing status - simple movement instruction

No fixed countdown that rushes the user. The test should usually finish
in under a minute because it progresses when the required movements are
completed.

### Result

The result appears immediately as a clean card/modal over the
experience.

Minimum report: - Flexion - Extension - Left side bend - Right side
bend - Side-to-side difference - Tracking confidence - date/time

Keep interpretation restrained:

**Your Spine Motion Profile**\
A repeatable snapshot of observable trunk movement.

Actions: - **Save PNG** - **Share** - **Copy result** - **Test again**

Later: - Compare with previous result - PDF/clinical report - cloud
history

------------------------------------------------------------------------

# What we deliberately do NOT build yet

For the public MVP, avoid:

-   vertebra-by-vertebra estimates
-   fake lumbar curvature measurements
-   disc loading estimates
-   diagnosis
-   complicated 3D spine reconstruction
-   giant dashboards
-   accounts/login unless genuinely needed
-   dozens of metrics
-   normative claims we have not validated
-   excessive onboarding
-   long scientific explanations during the test
-   features nobody has requested yet

The animated spine concept can remain as an experiment, education
visual, course asset, or later optional feature. **It does not need to
be in the core product.**

------------------------------------------------------------------------

# Measurement definition

PoseIQ Spine v1 measures **observable trunk motion from camera pose
landmarks**.

Primary movements:

### Sagittal view

-   trunk flexion from calibrated neutral
-   trunk extension from calibrated neutral
-   three repetitions

### Frontal view

-   left lateral flexion
-   right lateral flexion
-   side-to-side difference
-   three repetitions each way

The product should prioritize: 1. robust landmark detection 2. correct
view/orientation 3. stable neutral calibration 4. clean movement cycles
5. repeatability 6. transparent confidence/quality checks

If the data are poor, PoseIQ asks the user to repeat the movement.
**Never manufacture a result.**

------------------------------------------------------------------------

# Production roadmap

## Phase 1 --- Measurement engine

**Next few sessions**

Goal: make the measurement boringly reliable.

-   [ ] Test on multiple people
-   [ ] Test different heights/body shapes
-   [ ] Test light/dark clothing
-   [ ] Test cluttered and clean backgrounds
-   [ ] Test laptop webcams
-   [ ] Test Android Chrome
-   [ ] Test iPhone Safari
-   [ ] Test desktop Chrome/Edge/Safari where possible
-   [ ] Test front and rear phone cameras
-   [ ] Verify camera mirroring does not change anatomical left/right
-   [ ] Verify flexion/extension sign for both directions the person can
    face
-   [ ] Improve automatic side/front view recognition if useful
-   [ ] Make neutral lock stable and obvious
-   [ ] Reject poor torso visibility
-   [ ] Reject implausible angle jumps
-   [ ] Smooth measurements without visibly lagging
-   [ ] Improve rep detection
-   [ ] Make extension optional rather than forcing uncomfortable
    movement
-   [ ] Record test cases and known limitations

**Exit criterion:** ten ordinary users can complete the test without us
explaining how it works.

------------------------------------------------------------------------

## Phase 2 --- CAD-style minimal UI

**Week 1**

Use the same product philosophy as PoseIQ CAD:

**the experience is the product, not the surrounding website.**

-   [ ] Full-screen camera after Start
-   [ ] Remove almost all chrome
-   [ ] One instruction at a time
-   [ ] Large readable instruction
-   [ ] Tiny tracking indicator
-   [ ] Angle only when useful
-   [ ] Rep count only when useful
-   [ ] Beautiful transitions between side/front stages
-   [ ] Simple success moment at completion
-   [ ] Result opens as a clean overlay/card
-   [ ] Settings hidden behind one small control
-   [ ] Science/About hidden away from the main workflow
-   [ ] Mobile-first responsive design
-   [ ] Accessible tap targets and readable contrast
-   [ ] No unnecessary scrolling during the test

Target feeling:

> **Open it and immediately know what to do.**

------------------------------------------------------------------------

## Phase 3 --- Result card + sharing

**Week 1**

Create a result people actually want to keep.

-   [ ] Beautiful PoseIQ Spine result card
-   [ ] Flexion
-   [ ] Extension
-   [ ] Left/right side bend
-   [ ] asymmetry/difference
-   [ ] quality/confidence indicator
-   [ ] date
-   [ ] PoseIQ branding
-   [ ] Export result as PNG
-   [ ] Native Share API where supported
-   [ ] Copy concise text summary
-   [ ] Test again
-   [ ] Save locally
-   [ ] Optional QR/share link later

The PNG should work naturally in: - clinical notes - coaching
conversations - research pilots - messages - social posts - personal
progress tracking

------------------------------------------------------------------------

## Phase 4 --- Product hardening

**Week 1--2**

-   [ ] HTTPS production hosting
-   [ ] `spine.poseiq.com`
-   [ ] camera permission handling
-   [ ] graceful MediaPipe/model loading state
-   [ ] GPU → CPU fallback
-   [ ] offline/error messaging
-   [ ] favicon/PWA metadata
-   [ ] installable PWA if worthwhile
-   [ ] analytics via PoseIQ Pulse
-   [ ] privacy statement
-   [ ] science/limitations page
-   [ ] basic accessibility pass
-   [ ] performance testing
-   [ ] cache model/assets where sensible
-   [ ] test slow connections
-   [ ] test orientation changes
-   [ ] prevent screen sleep during active test where supported
-   [ ] clear browser/device compatibility message only when necessary

------------------------------------------------------------------------

## Phase 5 --- Small validation study

**Week 2 and onward**

Do not wait for perfect academic validation before learning, but begin
collecting evidence immediately.

Simple first study:

-   repeated PoseIQ measurements
-   same person / same session
-   different sessions
-   compare against a practical reference measure where possible
-   quantify repeatability
-   estimate measurement error
-   investigate camera-distance sensitivity
-   investigate camera-angle sensitivity
-   investigate clothing/background effects

Questions we want answered:

-   How repeatable is flexion?
-   How repeatable is extension?
-   How repeatable is lateral flexion?
-   What setup creates unacceptable error?
-   How many repetitions give the best reliability/effort tradeoff?
-   Can the test reliably detect meaningful within-person change?

This becomes the basis for stronger scientific claims later.

------------------------------------------------------------------------

# Launch

Once the core flow is stable:

## `spine.poseiq.com`

Position it simply:

> **Your Spine Motion Profile in under 60 seconds.**

Secondary line:

> Camera-based movement measurement. No markers. No wearables.

Then let people use it.

Do not explain everything before the test.

------------------------------------------------------------------------

# Who we test with

Start broad because the same simple measurement can reveal different use
cases.

### Clinicians

Ask: - Would you repeat this during rehab? - Which result matters? -
What would make it useful in your workflow? - What is missing?

### Sport / coaches

Ask: - Would you use this for screening, warm-up, fatigue, mobility or
return-to-training? - Which comparison would matter?

### General users

Ask: - Did you understand it without instruction? - Was the result
interesting/useful? - Would you repeat it? - What did you expect it to
tell you?

### Researchers

Ask: - Is the measurement definition clear? - What validation would make
it useful? - What export/data features would matter?

------------------------------------------------------------------------

# Feedback rule

Do **not** build every suggestion.

Capture requests in PoseIQ Pulse and classify:

-   **Bug** --- fix
-   **Confusion** --- simplify
-   **Repeated request** --- investigate
-   **Interesting one-off** --- park
-   **Changes the core value** --- test before building

A feature earns its way into PoseIQ Spine.

------------------------------------------------------------------------

# Metrics for the first public weeks

Keep analytics tiny.

Track:

-   visits
-   Start clicked
-   camera successfully started
-   neutral successfully calibrated
-   side test completed
-   front test completed
-   report generated
-   PNG saved/shared
-   test repeated
-   failure reason
-   device/browser
-   optional feedback

The most important funnel:

**Visit → Start → Complete → Save/Share → Repeat**

------------------------------------------------------------------------

# Course opportunity

## Udemy / PoseIQ Course

### **Spine Biomechanics in Under an Hour**

PoseIQ Spine becomes the interactive companion.

Possible compact structure:

1.  What the spine actually does
2.  Flexion and extension
3.  Lateral flexion and rotation
4.  Trunk motion vs vertebral motion
5.  What a camera can and cannot measure
6.  Movement variability and asymmetry
7.  Reliability vs validity
8.  Pain is not an angle
9.  Measuring yourself with PoseIQ Spine
10. Interpreting change over time
11. Applications in clinic, sport and research
12. Where AI/computer vision may take spine assessment

The course teaches the science.\
**PoseIQ Spine lets people experience it.**

That pairing is much stronger than either alone.

------------------------------------------------------------------------

# Later, only if users pull us there

Potential v2/v3 ideas:

-   longitudinal comparison
-   baseline vs today
-   clinician dashboard
-   coach/team mode
-   patient share link
-   downloadable PDF
-   raw CSV/data export
-   research mode
-   rotation test
-   sitting test
-   repeated functional tasks
-   automatic movement quality metrics
-   multi-camera experiments
-   optional 3D educational spine
-   integration with PoseIQ Live
-   integration with PoseIQ Pulse
-   API / embeddable assessment

None of these are required to launch v1.

------------------------------------------------------------------------

# Definition of done

PoseIQ Spine v1 is done when:

> Someone opens `spine.poseiq.com` on a phone or computer, taps
> **Start**, follows the camera instructions without help, completes the
> movements in roughly one minute, receives a credible movement profile,
> saves or shares the result, and understands enough to want to repeat
> it.

Then we stop polishing.

We put it in front of people.

**Use → measure → listen → learn → improve.**

------------------------------------------------------------------------

## North Star

**Simple enough to use.\
Useful enough to repeat.\
Scientific enough to trust.\
Small enough to ship.**
