# DoorBuddy — Report Key Points
**COMPX221-26A | Andrew Graham 1685046**

---

## Project Overview
DoorBuddy is a digital door kiosk replacing static paper timetables on academic staff office doors. Built in Processing/Java at 1280×720px. Three user types: unauthenticated public visitor, authenticated staff, authenticated admin. CSV files serve as the data source.

---

## Design Decisions to Justify

### Three-Bucket Colour System
The CSV spec defines 13 title codes (Cla, Mmm, Mst, Msu, Mae, Res, Una, Ava, May, Ofh, Wfh, Lun, Unc). These were deliberately abstracted into three canonical display states for the kiosk:
- **Available** (green `#CDE6C6`) — Ava, Ofh
- **Flexible** (amber `#FFE2C1`) — May, Wfh
- **Unavailable** (pink `#F8B6B7`) — Una, Cla, all meeting types, Res, Lun, Unc

Rationale: a visitor at a door needs to know one thing — can I knock? Granular codes like "StaffMeeting" vs "ResearchMeeting" are irrelevant to that question. The three-bucket system communicates availability clearly and consistently. Detailed codes are preserved in the data model and would be meaningful in a full staff portal.

### ScheduleScreen Interaction Model
The colour key buttons (Unavailable / Flexible / Available) double as the status change mechanism on ScheduleScreen. Staff selects a cell, selects a status, clicks SAVE. This eliminates the need for a separate edit popout panel on the kiosk. Rationale: the kiosk's primary staff action is changing availability status — not editing room numbers or course codes. Administrative detail editing belongs in a separate staff portal, not the kiosk interface.

### Kiosk vs Staff Portal Separation
Several features were deliberately scoped out of the kiosk and noted as staff portal functionality:
- Editing room numbers and course codes
- Per-booking 15-minute confirmation at individual segment level
- Full booking state management (approved → cannot be directly rejected without cancellation workflow)
- Flexible slot booking resolution — flexible status is intentionally left as pending; staff resolves via portal

### LoginScreen Not Extending AbstractScreen
LoginScreen is a standalone class held as a separate sketch-level variable. It does not extend AbstractScreen because it serves a fundamentally different purpose — authentication overlay — rather than a navigable screen. It uses its own show()/hide() methods for ControlP5 visibility management.

### ControlP5 DropdownList Avoided
ControlP5's DropdownList has known reliability issues in Processing. The status selector was implemented as hand-drawn Button objects instead. This is a deliberate design decision, not a limitation.

### Screen Navigation Pattern
- `currentScreen: AbstractScreen` held at sketch level
- Sketch polls flag getters (`getShowLogin()`, `getShowBooking()`, `getShowHome()`) each frame
- Transitions triggered by setting Boolean flags in screen `mousePressed()`, read in sketch `draw()`
- LoginScreen overlay controlled separately via `_loginActive` Boolean

### dayToColumn() and timeToRow() in AbstractScreen
These grid helper methods were placed in AbstractScreen so both HomeScreen and ScheduleScreen inherit them directly, avoiding a sibling-screen dependency. Integer division on the time value `(time - 800) / 100` maps 24hr CSV time integers directly to row indices.

### BookingScreen Construction
BookingScreen is constructed fresh at transition time with the selected TimeSlot, not in setup(). This ensures it always receives current slot state. It may receive a null TimeSlot — intentional design for the message-only contact path.

---

## Prototype Constraints to Declare

### Authentication
- Password is hardcoded as a final String — not a secure authentication system
- Password field is plain text — masking not implemented
- ADMIN_NAME is hardcoded — real deployment would require configuration

### Data
- WEEK_DISPLAY is hardcoded — Calendar logic to derive current week was considered but deferred
- OFFICE is hardcoded — all staff share the same office location in this prototype
- No CSV write-back — all changes (status updates, new bookings) are in-memory only and lost on application close
- CSV-loaded bookings have empty email and placeholder timeSegment values

- grey fallback for unknown Availability codes
- -1 guard skips out-of-bounds rows. The blank grey squares are actually the right behaviour.
- out-of-bounds time values are silently skipped, ensuring the application remains stable with malformed or extended CSV data."

### Notifications
- `sendNotification()` prints to console only — real deployment would require external messaging infrastructure (SMTP, SMS API, etc.)
- Notification output is a prototype stub representing what would be an email or push notification in production

### Input
- Keyboard and mouse assumed — a production kiosk would require an on-screen keyboard and touch-optimised targets
- ControlP5 Textfield is single-line only — the message/note field does not wrap

### ControlP5 Font Issue
- ControlP5 globally resets Processing's text state — `textSize(16)` must be called immediately after every `super.draw()` call. This is a known library behaviour, not a bug in the application code.

### Booking
- Multi-segment booking not implemented — visitors select one 15-minute segment per submission
- Flexible slot booking confirmation is unresolved at kiosk level — intentionally deferred to staff portal
- In-memory bookings made during a session are lost if `loadTimeSlotsForStaff()` is called for a different staff member

---

## OO Design Points to Highlight

### Inheritance Hierarchy
- AbstractScreen ← HomeScreen, BookingScreen, ScheduleScreen
- LoginScreen is standalone (does not extend AbstractScreen)
- AbstractScreen holds shared constants, header rendering, grid labels, colour key, and grid helper methods

### Key Design Patterns
- Single Button class reused across all screens — consistent interaction model
- String role field on Staff rather than separate subclasses — KISS principle
- Screen switching via object reference (`currentScreen = scheduleScreen`) rather than integer state variable
- Table passed as method parameter to TimeSlot rather than stored as a field — scalability decision

### Method Naming
- `notify()` is a final method on Java's Object class — cannot be overridden. Renamed to `sendNotification()` — important OO correctness point
- String comparison uses `.equals()` throughout — not `==`

### Encapsulation
- TimeSlot fields private, accessed via getters/setters
- `_isSelected` on TimeSlot set by HomeScreen/ScheduleScreen, not self-managed — interaction logic lives at screen level using inherited grid constants

---

## UX Design Points to Highlight

### Public Visitor Flow
1. Arrive at kiosk → HomeScreen grid visible immediately, no login required
2. Click an available slot → BookingScreen with 15-minute segment selection
3. Fill name, email, optional course and message → SUBMIT → confirmation → auto-return to HomeScreen

### Staff Flow
1. STAFF button → Login overlay → authenticate → ScheduleScreen
2. Click a slot → select status colour → SAVE → slot updates immediately, notification sent to any affected bookings
3. HOME → return to HomeScreen

### Colour Key as Interaction
On ScheduleScreen the colour key serves dual purpose — legend and interactive status selector. Visual consistency between the key colours and the grid cell colours reinforces the mapping for the user.

### Booking Indicator Bar
Pink bar grows upward from cell bottom — 14px per booking, maximum 4 bookings (56px, nearly filling the 57px cell). Provides at-a-glance booking load without obscuring slot colour or course code text.

### Nothing = Nothing
Blank/pending booking segments display nothing in BookingScreen — absence of confirmation text communicates pending state without adding noise.

---

## GenAI Declaration
Claude (Anthropic) was used as a development aid throughout this project. Usage included architectural planning and discussion, debugging logical errors, reviewing code structure, and session continuity via handoff summaries. All design decisions were made by the student and can be individually defended. Code was written, reviewed, and understood by the student — AI assistance is analogous to using documentation, Stack Overflow, or a study group, and has been used in that spirit. This usage is declared transparently in accordance with assignment guidelines.

---

## Suggested Report Structure
1. Introduction — project brief, DoorBuddy concept, kiosk context
2. Design Process — personas, user flows, Figma prototype reference
3. Architecture — class structure, OO decisions, UML reference
4. Screen-by-Screen Walkthrough — annotated screenshots for each screen
5. Design Decisions — three-bucket colour system, kiosk vs portal scope, interaction model
6. Prototype Constraints — full list with rationale for each
7. Reflection — what worked, what would change, AI tool declaration
8. References — APA
