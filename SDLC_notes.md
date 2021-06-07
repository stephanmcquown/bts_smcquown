 

# SDLC - 5 Steps

1. Requirements: What will be made
2. Design: How it will be made
3. Implementation: Building, making it
4. Verification: Testing it
5. Maintenance: Fixing and extending (new features)

## WRSPM Models (World Requirements Specifications Program Machine)

- World: Assumptions used to define sys environment; develop system
- Requirements: Define problem in terms of user; what does user want product to do
- Specifications: Technical requirements; links *World* and *Requirements*
- Program: Logic and code itself
- Machine: Hardware specifications

How elements are catagorized ? 
  
|Environment|Interface|System|
|---|---|---|
|World <br> Requirements | Specifications | Program <br> Machine |


### WRSPM Variables

- Environment Hidden (EH): Elements of environments hidden to system IE ATM card (machine does not know what card looks like being used)
- Environment Visible (EV): Elements of environments visible to system IE ATM cards magstripe
- System Visible (SV): Elements of system visible to environment; IE buttons, screen, UI
- System Hidden (SH): Elements of system hidden from environment; IE software running ATM 

---

## Requirements

- What software ***should*** do
- Non-technical user needs ***no programming jargon*** IE layman's terms
- Two broad categories
  - *Functional*: What system should do, IE features **how responds to input**
  - *Non-Functional*: What goals should be met IE user expectations (biz constraints EG how fast should it work, security)
    - Product Requirements: Something product must do; how product must integrate w the world
    - Organizational Requirements: Company policies and procedures, EG must be developed with Scrum Methodology
    - External Requirements: External laws, regs; EG must use SSL encryption due to law XYZ

### Specifications

- Technical definition of what is needed to meet requirements **NOT HOW**
- IE MySQL database with C# controller and HTML CSS front end

---

## Design

### Architecture

- breaking larger systems to smaller focussed systems
  - benefits
    - flexibility
    - division of labor (can work on small bits of project) == faster dev
    - helps determine where to buy vs build components
     
EG  

Say you have a website.  One could put all the code in ONE document.  This is cumbersome to debug.  Instead, one could split this into a front end and back end.  By simple consequence of that architecture change, one has 1/2 the code to debug when their is a problem.  The work can occur concurrently.

NOTES  
- Think big; large sections of the app
- Organize into major areas.  Often, this splits into UI, middle, backend (MVC)

### Architecture Patterns 

No one size fits all, approx 5 - 6 popular patters
- **Pipe and Filter**
  - Use "filters" and channel data between "pipes"
  - Must be able to re-arrange order of "filters" and retain functionality
  - Input type and output type must be same
  - Can have differnt number of arguments vs reutrn (ie 3,5,7 and return 5 only BUT is same data type...maybe a "median" filter in this scenario)
  - Can daisy chain multiple filters, CHAIN is the PIPE
- **Client Server**
  - Central server w "Clients" IE other machines that ask the server for info
  - Named for bc Server runs softward and Client runs software
  - Server returns information back out
  - IE the internet (Webserver is server and Browser is client), online games
- **Master Slave**
   - Commands only go downstream.  The master is often called the "Controller"
   - Example is database replication; replicated DBs DO NOT do anything but take instruction from the controller
- **Layered Pattern**
  - Layers only communicate w/in each other
  - EG Model View Controller (MVC)
    - Model == database
    - Controller == routes data to and from view
    - View == what the user sees, the UI (HTML JavaScript, React etcetera)

### Software Architecture Process

- Control how program 
  - Decomposed
  - Interacts w self
  - Interacts w outside world
- Model how control structure of system will behave
- Break project into
  - <u>Subsystem</u>: Independent system which holds independent value; HAS BUSINESS VALUE - CAN BE USED IN OTHER SYSTEMS OR <strong>SOLD AS STANDALONE</strong>
  - <u>Module</u>: Cannot function alone; component of subsystem
  
### Software Design - design is not coding and coding is not design

- <u>Activity</u>: Working to design the software

#### Stages of Design

1. Break larger problem into smaller problems
2. Understand each problem
3. Identify potential solutions
   1. <mark> Often will refer to requirements doc here</mark>**BRAINSTORM here, come up w as many options**
4. Describe solution abstactions
  1. Design docs that ARE NOT technical
  2. Often use graphs / models to show how areas of software hang together
5. Repeat until everything is abstracted
6. Component design
7. Data structure design
8. Algorithm design

A note on 6 - 8, often is forgone in Agile etcetera because these components often change when we realize the code does not work

### Modularity

Goal is to balance; have loose coupling and strong cohesion

- <u>Coupling</u>: How well modules work together; strength of connections between modules / subsystems **aim to be loose**
  - Tight: Changes in one module require changes in other modules; think global variables / data
    - Content: Module A depends on B AND B cannot have it's inner workings changed w/out breaking A
    - Common: Several modules access AND MANIPULATE same global data; causes race conditions and dirty reads; a bug propogates from on module to ALL the modules
    - External: Several moduels have access to same MODULE BUT EXTERNAL so we do not have control to the workings of the EXTERNAL module
  - Medium: 
    - Control: passed data CHANGES INTERNAL LOGIC of other module AND changes in module B can screw up module A; usually relies on flags to affect behaviour in subordinate modules
    - Data-Structure: Multiple modules share same data structure.  IF data structure changes, it breaks all the downstream modules.  A get / set module between the data structure can help with this
  - Loose: Modules communicate only necessary information; modules become modular
    - Data: Modules PASS data to share
    - Message: Messages / commands are passed between modules
    - None
- <u>Cohesion</u>: Single purpose / designed goal
  - Weak: many modules w little purpose, randomly grouped
    - Coincidental: linked bc in same file; EG single file program, mishmash controller, spaghetti
    - Temporal: linked bc events happen at same time
    - Logical: linked by same general category
  - Medium: focused task BUT
    - Procedural: order of execution passes from one command to next BUT has multi-UNRELATED purposes; 
      - EG update database, print PO ...two tasks are sequential but functionally different goals
    - Communicational: support same input / output data BUT operationally / functionally different
    - Sequential: output for first mod is input for next; NOT CONFUSE W PROCEDURAL
  - Strong:
    - Functional: activities for ONE problem-related task (one only); EG GetPayment
    - Object: activities modify ONE object; EG Contains GetUserName SetUserPass (all user related and all attributes of user)
- Goals
  1. Abstraction: Remove complexity (EG Machine Language > Assembly Language > Java...we can use Java bc of )
  2. Decomposability: Can take apart
  3. Composability: Can put back together
  4. Understandablility: Smaller blocks more understandable than larger code blocks
  5. Continuity: Change one place and changes everywhere in project
  6. Protectability: One road leads to Rome, not all
- <u>Information Hiding</u>: Hide complexity using "Black Box"; in [black box] out; PentaSLOW does this
  - Methods (Functions)
  - Libraries
  - Classes
- <u> Data Encapsulation </u>: Hide details from user; provide tools to manipulate data via controlled channels
  1. Getters and Setters - Setters can have biz logic in them, Getters can have authentications  to prevent unallowed gets

---

## Implementation

- Most of time spent
- Follow style guide for code (how to indent, etc)
- Code written for ppl not computers ERR on the side of read-able / comprehensible
- Modules should be easy to understand
- Shorter code != better code
- Break up actions into methods

### Buy vs Build

- May be able to save time and money buy purchasing; IE MS Office, spend $100 OR build?  Build would be crazy

### Deployment

- Deployment: mix between testing and implementation
  - Should be built w ability to retreat (HOW CAN WE REVERT)

<u>Deployment Planing</u>

- Dependent on size of change; bigger == more planning
- Areas
  - Database activity (changing how it works?)
  - 3rd part software integration
  - Run time changes
  - Training (both user and biz side): site used to work a certain way and NOW IT DOES NOT
  - Downtime
  - Backups
  - Network
  - Memory
- **MUST HAVE PLAN TO ROLLBACK**

<u> Deployment Rollback </u>

- IF errors generally you rollback
- Look for point of no return
- Every step of process, determine if rollback better option

---

## Verification

### Testing

<u> Testing </u>: Process of finding errors BUT cannot ensure absence of them (for all but govt security)

- We can test
  - Code
  - Implementation
  - (other) Testing

<u>Test Data</u>: Inputs that test the system <br>
<u>Test Cases</u>: How we operate the system w given data <br>
<u>Oracle</u>: The set "good" outcomes; what out should be from givens <br>

**Bugs vs Features**

<u>Bug</u>: error OR deviation from expected behavior

- <u>Failure</u>: Code deviates from expected behavior
- <u>Error</u>: Part of code that causes failure
- <u>Fault</u>: What outcome actually was

**Verification and Validation**

- <u>Verification</u>: Does software work vs specs
- <u>Validation</u>: Building what user NEEDS / WANTS; the right thing IE can build to spec BUT not what customer wants

**Testing Techniques**

- <u>Unit Testing</u>: Test smallest unit of software (typically a module) 
  - Isolate and test w dummy vals
- <u>Integration Testing</u>: Test communication / architecture of program; how modules hang together
  - <u>Incremental Testing</u>: Test module by module (one at a time)
    - Top-Down Testing: typically proceeds through MAIN and then downstream
      - <u> Stub</u>: Template of module CONTAINS funtions BUT RETURNS DUMMY VALUES BACK; can test the function calls w/out having to have the functions fully coded
    - <u>Bottom-Up Testing</u>: Start with low-level modules (buillding blocks that MAIN calls)
      - <u>Driver</u>: Template with execution controls THIS basically contains procedural logic; the temporal flow
  - <u> Non-incremental </u> TESTS whole thing
- <u> Back to Back </u>: Compare known good to new version (make sure V2 out == V1 out)
  - Use to test old (existing) functionality

### Test Planning

**Who should test ?**

1. Developer  
    - Can do technical tests DOES system work
    - Tends to test lightly; have blind spots due to providing expected inputs and events
2. Tester
    - Goals: test everything; break program (find all failure modes)
    - Typically held responsible for bugs
3. User
    - Knows how they will use the system
    - Simply try to use (does not try to break OR go light)

**Automatic vs Manual**

- Manual: individual goes and PERFORMS test (IE enter data on site and submit)
- Automatic: Create software to run testing (software to test THE modules program etc)

**Black-Box Testing**

- <u>Black Box Testing </u>: no technical aspects checked; uses input **BLACK BOX**output (input and output require oracles)
- <u>Boundary values </u>: High and low values input, if outs pass, everything inbetween assumed good
- <u>Cause Effect Graphing</u>: Inputs generate graphs of effect
- <u>Pair-Wise Testing</u>: Params tested in all combinations to test all scenarios 
- <u>State-Based Testing</u>: Uses a state machine I DO NOT UNDERSTAND THIS

**White-Box Testing**

- Technical aspects checked (memory leaks, variable are used right)
- <u>Control Flow</u>: tests procedural logic, can you reach every if (all parts of procedural logic)
- <u>Data Flow</u>: tests variable declarations, uses, and typing

**Testing Problems**

- Complete (exhaustive) testing is impossible
- More bugs found, more time it takes to find remaining bugs (idea of low hanging fruit, increased marginal costs of improvement)
- Can never guarantee bug free program, even Windows cannot do this
- For given test MORE bugs found portend MORE bugs exists (IE a high defect rate in the sample means the whole is likely highly defective)

---

# Software Development Models

- Two classes
  - Predictive (linear): Has predictable end value (been done before for this to be known)
  - Adaptive (flexible): No clear process (likely to change over time)

## Waterfall Model

- Step through process from top to bottom (typically the SDLC steps) *predictive*
  - Efficient and simple
  - Exponential expense when problems come up in test ESPECIALLY late in process; have to go back to beginning!

## V-Model

- Uses **Verification** at each step
- Enables finding bugs SOONER and thereby lowers exponential expense of bugs

1. Requirements : Acceptance Testing
2. Design : System Testing
3. Architecture : Integration Testing
4. Module : Unit Testing
5. Implentation

## Sashimi Model 

- Do a little of each phase concurrently as proceeding through project
- Works best when each phase has different programmers working on it (requirements, design, implementation, etc)
- Can result in error and redesign, and errors more prevelant bc requirements still being defined as other phases worked on

## Incremental Model

- Build steps over time, assembly line method, do not have working software until final step
- Each major components (back-end, front-end) are put through whole SDLC as we build to end product
- Allows sending components for verification, so is iterative in a sense, and allows inclusion of OTHER models in components (V, Waterfall)

## Iterative Model

- Build operable prototypes and adjust; prototype should be able to do what final product will do (but will be poor quality, iteration will improve the quality)

## Unified Process Framework

- Has elements of both iterative and incremental
- **Phases**
  - <u>Inception</u>: Primarly feasibility (schedule, cost), biz modeling
    - **DELIVERABLE** life cycle goals
  - <u>Elaboration</u>: Requirements, analysis & design; address known risks, verify and validate system architecture
    - Develop **proof of concept** core code to test; does it do what we think? 
    - **DELIVERABLE** system architecture plans and prototype
  - <u>Contruction</u>: Implementation (building the thing) LONGEST PHASE
    - Features delivered in short iterations EACH delivering workable release of software
    - **DELIVERABLE** continual improving of software
  - <u>Transition</u>: Software deployed to end users who provide verification and make final refinement
    - **DELIVERABLE** Final Product  
- **Pros**
  - Adaptive
  - Quality + reuse focuses
  - Good risk management
  - Flexible to include other models
- **Cons**
  - Complicated
  - Lots of overhead (hurts small projects)
  - Lots of staff (need more programmers, managers, testers)

## Spiral Model

A risk oriented model, often used w experimental ideas

**4 Quadrants** iterate around these quads EXPANDING scope and depth w each iteration 

1. Determine Objectives Alternatives **THE PLAN**
2. Identify and Resolve Risk
3. Development and Tests **CODE** but starts as prototype
4. Plan Next Iteration **HOW ARE WE GOING TO DEVELOP**

**Pros**

- Very adaptive
- Risk focused
- Options for go/no-go

**Cons**

- Complicated
- Costs more to manage
- Needs constant stakeholder engagement

---

## Agile

<u>Ideas</u> we use to develop models with (<u>**THERE IS NO**</u> "Agile Model")

### Precepts

- Lots of unexpected problems arise
- Software is complicated and cannot be 100% predicted
- At end, software often did not meet original requirements
- Market moves, and products can be outdated by time they are finished

### Agile Manifesto

1. Individuals and interactions over process and tools
2. Working software over comprehensive documentation
3. Customer collaboration over contract negotiation
4. Responding to change over following plan

### <u>Scrum</u>

1 - 4 week "sprints" that involve plan build learn repeat; ITERATE to finished product  
**Roles**  
Product Owner - Stakeholders (execs, customers, users); help prioritize *next steps*  
Scrum Master - Leads team to adhere to Scrum tenets  
Team - People building software (engineers, designers, basic coders)  

#### Flow  
1. Product Backlog - list of to ideas, requirements **no priority set yet**
2. Sprint Planning Meeting - **prioritization** of *Product Backlog*
3. Sprint Backlog - set of ideas we are working on **set deadline**; OBJECTIVES
4. Sprint Review - demo sprint and review with stakeholders, start setting next backlog
5. Sprint Retrospective - review with software team to improve internal processes

#### Implementation  
Daily Scrum meeting:
- What **was done**
- What we plan **to do**
- What **roadblocks** exist (and **dealing with**)
- Track schedule

### <u>Kanban</u>

Japanese methodology of continuous improvement  
Project <u>workflow</u> broken into 5 segments.  Work being done in each segment is quantified as "cards".  Try to equalize "cards" in each segment
1. Backlog
2. Analyze
3. Develop
4. Test
5. Release  

### Kanban Properties

- Visualize workflow (put on wall, MAKE VISUAL)
- Limit WIP
- Manage flow
- Make process policies explicit **DOCUMENTATION** no grey
- Improve colloboratively (have group meetings on how we improve process)

### Kanban Principles

- Start with what you know
- Agree to persue incremental evolution
- Respect current process, roles, responsibilities, titles
- Encourage acts of leadership **at all levels**


### Lean Startup

Experimental way of building products  
You build a simple product, see if it succeeds, refine
Have idea of GO and NO GO

1. Learn (assumption)
2. Build (experiment)
3. Measure (metric)

## Scrum In Depth

The 3-5-3: 3 artifacts, 5 events, 3 goals.  This is the essence of Scrum.  Also can add 3 pilars and 5 values

### Values 

1. Roles (3): the people
    - Dev Team
    - Product Owner
    - Scrum Master  
2. Artifacts (3): 
    - Sprint Backlog
    - Product Increment
    - Product Backlog  
3. Events (5): ideas around implementation
    - Sprint Planning
    - Daily Scrum
    - The Sprint  
    - Sprint Review
    - Sprint Retrospective
4. Values (5): core tenants to adhere to
    - Focus: <u>Focus on work and goals of team</u>
    - Respect: Respect each other as capable of job and responsibilities
    - Commitment: Commit to achieving goals of team
    - Courage: Do right thing work on tough problems
    - Openness: Open transparaent about work and challenges AND communication
5. Pilars (3): based on ***empiricism*** - **knowledge come from experience, progress based on reality**
    - Transparency: See what is going on in order to adapt  
    - Inspection: Look at what needs to be done / improved  
    - Adaption: Make changes based on knowledge gained, define next steps / improvements 


### Roles

- **Product Owner**: responsible for maximize value and managing product; owns goals and trajectory; ensures commitments are met
  - Communication with MGMT / outside people / stake holders
  - Takes vision of stake holders and makes *Product Backlog* (next steps for sprints)
  - Ensures value of team and provides feedback to all *Roles* in org
- **Scrum Master**: responsible to impelement and maintain Scrum framework;  grease in the wheels
  - Facilitates meetings IE *Daily Standup* DOES NOT RUN IT
  - Educate dev team on their job and goals
  - Encourages collaboration, mitigate disputes, disciplines
  - Removes blocks for team
  - Keeps team happy w high morale
- **Dev Team**: the people who do the coding; typically 3 - 9 members
  - Ideally they are all FULL STACK developers, even extending to design work
  - Work w *Product Owner* to create and refine the vision (user stories)
  - Organizes to complement strengths IE person X focuses on back end, person Y focuses on controller, person Z does view
  - Researches, designs, and prototypes user stories
  - Develop and maintain iterations (take product backlog and convert into sprint)

### Implementation

- **Product Backlog**: prioritized set of work created from visoin and it's requirements; updated AFTER EVERY SPRINT REVIEW
  - Many tools avail: Excel, Clubhouse
  - Priorities broken into very high, high medium, low
  - Has estimated hours or delivery dates
  - Has who is responsible
- **Sprint Planning Meeting**: Sets expectations, structure, creates sprint backlog, no additonal features can be added from *product backlog*
  - 2-4 hour meeting on day sprint begins, cannot go over time
  - Take product backlog and turns to sprint backlog
  - *Scrum master*: secures conference room, keeps meeting moving and on topic, ensures meeting aligns w *sprint goal*
  - *Product owner*: product backlog is ready, can explain what stakeholder visions (user stories) mean; can clarify backlog items, explain criteria ACTIONAL ITEMS w specificity
  - *Dev team*: determine tasks that work to goal, how much can be accomplished
    - WHOLE dev team needs to be present at planning meeting
- **Sprint Goal**: Two line summary of to do
- **Sprint**: of 1 - 4 weeks; includes daily stand ups
  - Planning *done* in sprint
  - Take product backlog with direction from **Product Owner** and **Dev Team** input AND DERIVE **GOAL**
    - This begets the **Sprint Backlog**, a subset of the Product Backlog that drives to the goal
    - What did you do yesterday, what are you doing today, what are your impediments
    - DOES NOT GO INTO DETAIL
  - Sprint Review: Show working product; based on feedback you do new sprint; have retrospective on sprint to improve point forward sprint
- **Daily Scrum (standup)**: 15 minutes collaborative meeting, focuses on sprint goal, occurs inside scrum loop
  - Scrum Master keeps meeting going and timebound; notes blockers and schedules time to remove blockers; randomly calls dev team members to speak - team communicates between themselves; ensure people are engaged and know what others are talking about
  - Dev Team reviews 3 questions per person
    - <mark>What done yesterday?</mark>
    - <mark>What doing today?</mark>
    - <mark>What is in way?</mark>
- **Sprint Review**: Review the product, plan next phases, organize priorities
  - Go over sprint results
  - Discuss demo work, get feedback
  - Update status of project
  - Collaborate on Plan Ahead
- **Sprint Retrospective**: Open 2 - 4 hour meeting w all roles (product owner, etc) coming together to discuss how to get better; popular method is the "start stop continue", list things submitted anonymously that should be "stopped" "continued" or "started"; all this w goal of improving!