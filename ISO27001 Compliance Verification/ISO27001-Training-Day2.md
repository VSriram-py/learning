# DAY 2 — Risk Management & Support Processes
## ISO/IEC 27001:2022 ISMS Training for Critical Environments

**Duration:** Full Day (09:30 - 17:15)

**Focus:** Master risk assessment methodologies and establish support mechanisms for ISMS operation

---

## Session 1: Clause 6 — Risk Management Concepts (09:30–10:45)

### Learning Objectives
- Understand ISO 27001's risk-based approach to information security
- Differentiate between risk assessment and risk treatment
- Learn the core concepts: threat, vulnerability, likelihood, impact, risk
- Understand when assessments must be repeated

### Introduction to Risk Management

**Risk** is the effect of uncertainty on objectives. In information security, risk represents the potential that a threat will exploit a vulnerability, resulting in harm to information assets.

**Why Risk-Based Approach?**
- **Not all assets are equally valuable** - Focus resources on what matters most
- **Threats are constantly evolving** - Adaptive approach needed
- **Resources are finite** - Prioritization is essential
- **Regulatory requirement** - Banking regulators mandate risk-based security

### Core Risk Terminology

**Information Asset**
Anything of value to the organization that involves information:
- **Data:** Customer records, financial transactions, intellectual property
- **Systems:** Core banking platform, mobile apps, IoT networks
- **People:** Employees with knowledge, skills, or access
- **Infrastructure:** Servers, network devices, cloud services, IoT sensors
- **Physical:** Data centers, backup media, paper records

**Threat**
Potential cause of an unwanted incident that may result in harm:
- **Malicious Actors:** Cybercriminals, insider threats, nation-states, hacktivists
- **Accidental:** Human error, misconfiguration, unintentional data disclosure
- **Natural:** Floods, fires, earthquakes, power outages
- **Technical:** Hardware failure, software bugs, IoT device malfunction

**Vulnerability**
Weakness that can be exploited by a threat:
- **Technical:** Unpatched software, default credentials, weak encryption, insecure IoT protocols
- **Physical:** Unlocked server rooms, unsecured backup media, accessible wiring
- **Organizational:** Inadequate policies, poor security awareness, lack of segregation of duties
- **Human:** Susceptibility to social engineering, password reuse, negligence

**Likelihood**
Probability that a threat will exploit a vulnerability:
- Consider **threat capability** (sophistication, resources, motivation)
- Assess **control effectiveness** (existing protections)
- Evaluate **vulnerability exposure** (ease of exploitation)

**Impact**
Consequence if a risk materializes:
- **Financial:** Direct loss, fines, remediation costs, lawsuits
- **Operational:** Service disruption, productivity loss, recovery time
- **Reputational:** Customer trust erosion, brand damage, market share loss
- **Legal/Regulatory:** Fines, sanctions, license revocation
- **Human Safety:** In critical infrastructure, physical harm or loss of life

**Risk**
Risk = Likelihood × Impact (simplified formula)

**Control (Safeguard)**
Measure that modifies risk:
- **Preventive:** Stops incident from occurring (firewall, access control)
- **Detective:** Identifies when incident occurs (SIEM alerts, audit logs)
- **Corrective:** Reduces impact after incident (backup restoration, incident response)
- **Deterrent:** Discourages threat actors (security awareness, sanctions)

### Risk Assessment vs. Impact Assessment

**CRITICAL DISTINCTION for AI/IoT Systems:**

#### Risk Assessment (ISO 27001 Requirement)
**Purpose:** Evaluate business risks to information security objectives

**Focus:**
- Confidentiality, integrity, availability of information assets
- Business continuity and operational resilience
- Financial and reputational impact to the organization
- Compliance and regulatory consequences

**Questions:**
- What could go wrong with our systems and data?
- How likely is each scenario?
- What would be the business impact?
- How do we prioritize treatment?

**Example - IoT ATM Network:**
- **Asset:** 1,500 connected ATMs
- **Threat:** Malware infection via unpatched vulnerability
- **Impact:** $5M direct theft + $2M reputational damage + $1M regulatory fines
- **Likelihood:** High (known exploits, delayed patching)
- **Risk Level:** Critical
- **Treatment:** Accelerate patching, deploy application whitelisting, network segmentation

#### Impact Assessment (AI/Ethics Requirement)
**Purpose:** Evaluate potential harm to individuals and society from AI/automated systems

**Focus:**
- Human rights and dignity
- Discrimination and bias
- Privacy and autonomy
- Physical and psychological harm
- Social and environmental impact

**Questions:**
- Who could be harmed by this system?
- What types of harm are possible?
- Are vulnerable groups disproportionately affected?
- How do we mitigate human harm?

**Example - Facial Recognition for Branch Access:**
- **System:** AI-powered biometric authentication at bank branches
- **Potential Harms:**
  - False rejections denying service to customers (dignity, access to finance)
  - Demographic bias (lower accuracy for certain ethnic groups)
  - Privacy concerns (continuous surveillance, biometric data storage)
  - Mission creep (data used beyond original purpose)
  - Security breach of biometric database (irreversible harm - can't change your face)
- **Affected Groups:** All customers, disproportionate impact on minorities if bias exists
- **Mitigations:** Bias testing, human override process, minimal data retention, encryption, consent management

**When Both Are Needed:**
- **IoT Systems Affecting People:** Smart building access, health monitoring, surveillance
- **AI/ML in Banking:** Loan decisioning, fraud detection, customer profiling
- **Automated Decisions with Consequences:** Account closures, transaction blocking, credit scoring

**Integration Approach:**
1. Conduct **Risk Assessment** for business/security risks (ISO 27001 Clause 6)
2. Conduct **Impact Assessment** for human harm (GDPR DPIA, AI ethics frameworks)
3. Combine findings into comprehensive treatment plan
4. Select controls addressing both business risks and human harms

### Risk Assessment Methodology

ISO 27001 requires a defined **risk assessment process** but does not mandate a specific methodology.

#### Common Methodologies

**1. Qualitative Risk Assessment**
- Uses descriptive scales (Low, Medium, High, Critical)
- Faster, requires less data
- Suitable for initial assessments
- More subjective

**Likelihood Scale:**
- **Rare (1):** May occur only in exceptional circumstances (<10% annual probability)
- **Unlikely (2):** Could occur at some time (10-30% annual probability)
- **Possible (3):** Might occur at some time (30-60% annual probability)
- **Likely (4):** Will probably occur in most circumstances (60-90% annual probability)
- **Almost Certain (5):** Expected to occur in most circumstances (>90% annual probability)

**Impact Scale:**
- **Insignificant (1):** Negligible impact, resolved quickly, no regulatory attention
- **Minor (2):** Limited impact, short-term disruption, minimal cost (<$100K)
- **Moderate (3):** Significant impact, medium-term disruption, moderate cost ($100K-$1M)
- **Major (4):** Severe impact, long-term disruption, major cost ($1M-$10M), regulatory fines
- **Catastrophic (5):** Extreme impact, existential threat, massive cost (>$10M), license revocation

**Risk Matrix:**
```
          IMPACT →
L    │  1  │  2  │  3  │  4  │  5  │
I    ├─────┼─────┼─────┼─────┼─────┤
K  5 │ Med │ High│ High│ Crit│ Crit│
E  4 │ Low │ Med │ High│ High│ Crit│
L  3 │ Low │ Low │ Med │ High│ High│
I  2 │ Low │ Low │ Low │ Med │ High│
H  1 │ Low │ Low │ Low │ Low │ Med │
O    └─────┴─────┴─────┴─────┴─────┘
O
D
↓
```

**2. Quantitative Risk Assessment**
- Uses numerical values and formulas
- **Annual Loss Expectancy (ALE) = Single Loss Expectancy (SLE) × Annual Rate of Occurrence (ARO)**
- More precise, data-driven
- Requires historical data and statistical analysis
- Suitable for financial institutions with mature risk management

**Example - Quantitative Assessment:**
- **Asset:** Customer database (10M records)
- **Threat:** Data breach via SQL injection
- **Single Loss Expectancy (SLE):** $15M (regulatory fines $5M + notification costs $2M + customer compensation $3M + legal $2M + reputational $3M)
- **Annual Rate of Occurrence (ARO):** 0.3 (30% chance per year based on industry data)
- **Annual Loss Expectancy (ALE):** $15M × 0.3 = $4.5M
- **Control Cost:** Web application firewall + secure coding training = $500K
- **Risk Reduction:** 80% (ARO reduced to 0.06)
- **New ALE:** $15M × 0.06 = $900K
- **Annual Benefit:** $4.5M - $900K = $3.6M (ROI = 620%)

**3. Hybrid Approach**
- Combine qualitative for breadth and quantitative for critical assets
- Common in banking: qualitative for standard risks, quantitative for top 10-20 scenarios

### Setting Risk Criteria

**Risk Acceptance Criteria** define what level of risk the organization is willing to accept.

**Factors to Consider:**
- **Organizational risk appetite:** Board-approved tolerance for risk
- **Regulatory requirements:** Minimum standards mandated by law
- **Industry benchmarks:** Peer comparison and best practices
- **Financial capacity:** Ability to absorb losses
- **Stakeholder expectations:** Customer, investor, partner tolerance

**Example Risk Acceptance Criteria - Banking:**

| Risk Level | Description | Treatment Required |
|------------|-------------|-------------------|
| **Critical (20-25)** | Unacceptable risk; immediate action mandatory | Must treat within 30 days; executive escalation; may require service suspension |
| **High (12-19)** | Significant risk requiring priority treatment | Must treat within 90 days; documented mitigation plan; monthly monitoring |
| **Medium (5-11)** | Moderate risk; treatment planned and resourced | Treat within 12 months; quarterly review; accept with justification possible |
| **Low (1-4)** | Acceptable risk with routine monitoring | Monitor; treat if cost-effective; accept with management approval |

**IoT-Specific Consideration:**
- **Operational constraints:** Cannot patch IoT devices during business hours
- **Safety implications:** Certain IoT controls (HVAC, fire suppression) cannot be disrupted
- **Scale challenges:** 5,000 devices = 5,000x potential vulnerabilities

### When Assessments Must Be Repeated

**Mandatory Reassessment Triggers (ISO 27001 Requirement):**

1. **Planned Intervals**
   - Annual review minimum (best practice: quarterly for critical systems)
   - Board-approved schedule aligned with business planning cycle

2. **Significant Changes**
   - New systems or services deployed
   - Major technology changes (cloud migration, IoT rollout)
   - Organizational changes (mergers, restructuring, new locations)
   - Changes to asset value or sensitivity
   - Changes in threat landscape (new attack techniques, geopolitical events)

3. **Post-Incident**
   - After security incidents to identify control gaps
   - Near-misses revealing previously unidentified risks

**Banking/IoT Specific Triggers:**

4. **Data Changes**
   - New data types collected (e.g., biometric data from new IoT sensors)
   - Changes in data sensitivity or classification
   - New data processing purposes
   - Cross-border data transfers initiated

5. **Model Changes** (for AI/ML systems)
   - Algorithm updates or model retraining
   - Changes to training data sources
   - New features or input variables
   - Changes to decision thresholds

6. **Rollout Changes**
   - Pilot to production deployment
   - Geographic expansion of services
   - Scaling from 100 to 10,000 IoT devices
   - New customer segments with different risk profiles

7. **Regulatory Changes**
   - New laws or regulations (e.g., AI Act, updated PCI DSS)
   - Regulator guidance or enforcement actions
   - Industry standards updates

**Continuous Monitoring vs. Periodic Assessment:**
- **Monitoring:** Real-time detection of threats (SIEM alerts, IDS, log analysis) - Operational
- **Assessment:** Systematic evaluation of risk landscape - Strategic
- Both required; monitoring informs assessment

---

## BREAK (10:45–11:00)

---

## Session 2: Risk Assessment Methodology Workshop (11:00–12:30)

### Learning Objectives
- Apply risk assessment methodology to realistic scenarios
- Build risk matrices and criteria appropriate to organizational context
- Practice evaluating likelihood and impact for IoT and banking risks

### Workshop Activity: Build Your Risk Assessment Framework

**Objective:** Develop a complete risk assessment framework for a banking organization with IoT infrastructure.

#### Scenario: NeoBank Digital

**Profile:**
- Digital-only bank (no physical branches)
- 500,000 customers
- Services: Checking accounts, savings, personal loans, credit cards
- Technology: Cloud-native (AWS), mobile-first, API-driven architecture
- Recent IoT initiatives: Smart home integrations (connect bank accounts to IoT devices for automated payments)

**Current Challenges:**
- Rapid growth (50% YoY customer acquisition)
- Aggressive fintech competitors
- Increasing sophisticated phishing attacks
- API security concerns (100M+ API calls daily)
- IoT partner ecosystem security unknown

#### Part 1: Define Risk Scales (20 minutes)

**Task:** Create 5-level scales for Likelihood and Impact appropriate to NeoBank's context.

**Likelihood Scale Template:**
```
Level | Label | Description | Criteria | Annual Probability
------|-------|-------------|----------|-------------------
  5   |       |             |          |
  4   |       |             |          |
  3   |       |             |          |
  2   |       |             |          |
  1   |       |             |          |
```

**Impact Scale Template:**
```
Level | Label | Financial | Operational | Reputational | Regulatory
------|-------|-----------|-------------|--------------|------------
  5   |       |           |             |              |
  4   |       |           |             |              |
  3   |       |           |             |              |
  2   |       |           |             |              |
  1   |       |           |             |              |
```

**Guidance:**
- Consider NeoBank's size, revenue, customer base
- Align financial thresholds to budget and capital
- Account for digital-only model (higher operational dependency on IT)
- Reflect regulatory environment for digital banks

#### Part 2: Create Risk Matrix (15 minutes)

**Task:** Build 5×5 risk matrix and define risk levels with treatment requirements.

```
Risk Matrix:

          IMPACT →
L    │  1  │  2  │  3  │  4  │  5  │
I    ├─────┼─────┼─────┼─────┼─────┤
K  5 │     │     │     │     │     │
E  4 │     │     │     │     │     │
L  3 │     │     │     │     │     │
I  2 │     │     │     │     │     │
H  1 │     │     │     │     │     │
O    └─────┴─────┴─────┴─────┴─────┘
O
D
↓

Risk Levels:
- Critical (scores X-Y): [Treatment requirements]
- High (scores X-Y): [Treatment requirements]
- Medium (scores X-Y): [Treatment requirements]
- Low (scores X-Y): [Treatment requirements]
```

#### Part 3: Assess Sample Risks (45 minutes)

**Task:** Assess five risk scenarios using your framework.

**Risk Scenario 1: API Security Breach**
- **Asset:** Customer API (account access, transactions)
- **Threat:** Cybercriminals exploiting API vulnerabilities
- **Vulnerability:** Rate limiting insufficient; authentication tokens long-lived (24hr); lack of API security testing
- **Current Controls:** HTTPS encryption; OAuth 2.0; API gateway with basic logging

**Assess:**
- Likelihood (1-5): _____
- Impact (1-5): _____
- Risk Score: _____
- Risk Level: _____
- Treatment Required: _____

**Risk Scenario 2: IoT Smart Home Integration - Data Exposure**
- **Asset:** Customer financial data shared with IoT partner platforms
- **Threat:** IoT partner platform breach exposing bank customer data
- **Vulnerability:** No security assessment of IoT partners; data sharing agreements lack security requirements; unclear data retention by partners
- **Current Controls:** Data encrypted in transit; customers consent to sharing

**Assess:**
- Likelihood (1-5): _____
- Impact (1-5): _____
- Risk Score: _____
- Risk Level: _____
- Treatment Required: _____

**Risk Scenario 3: Insider Threat - Database Administrator**
- **Asset:** Customer database (500K records with PII and financial data)
- **Threat:** Malicious or negligent DBA exfiltrates customer data
- **Vulnerability:** DBAs have unrestricted access; no database activity monitoring; no data leakage prevention
- **Current Controls:** Background checks; NDAs; annual security training

**Assess:**
- Likelihood (1-5): _____
- Impact (1-5): _____
- Risk Score: _____
- Risk Level: _____
- Treatment Required: _____

**Risk Scenario 4: Cloud Service Provider Outage**
- **Asset:** AWS infrastructure hosting all banking services
- **Threat:** AWS regional outage
- **Vulnerability:** Single-region deployment; recovery time objective (RTO) not defined; disaster recovery plan untested
- **Current Controls:** AWS backup services; multi-availability zone deployment within region

**Assess:**
- Likelihood (1-5): _____
- Impact (1-5): _____
- Risk Score: _____
- Risk Level: _____
- Treatment Required: _____

**Risk Scenario 5: Phishing Attack Leading to Account Takeover**
- **Asset:** Customer accounts
- **Threat:** Cybercriminals using phishing to steal credentials
- **Vulnerability:** No multi-factor authentication (MFA) for customer logins; security awareness email warnings only; no anti-phishing technology
- **Current Controls:** Password complexity requirements; account lockout after failed attempts; fraud monitoring

**Assess:**
- Likelihood (1-5): _____
- Impact (1-5): _____
- Risk Score: _____
- Risk Level: _____
- Treatment Required: _____

#### Part 4: Prioritize and Document (20 minutes)

**Task:** 
1. Rank the five risks from highest to lowest
2. For the top 2 risks, propose specific Annex A controls (identify by number, e.g., A.8.20 Network Security)
3. Estimate treatment timeline and resources

**Risk Register Template:**
```
| Risk ID | Risk Description | Likelihood | Impact | Score | Level | Priority | Proposed Controls | Timeline | Resources |
|---------|------------------|------------|--------|-------|-------|----------|-------------------|----------|-----------|
| R001    |                  |            |        |       |       |          |                   |          |           |
```

#### Part 5: Group Presentations (10 minutes)

Each group presents:
- Their risk scales and rationale (1 minute)
- Top 2 risks and treatment approach (2 minutes)
- Key challenges encountered (1 minute)

---

## LUNCH BREAK (12:30–13:30)

---

## Session 3: Statement of Applicability (SoA) (13:30–14:30)

### Learning Objectives
- Understand the purpose and structure of the Statement of Applicability
- Learn how risk assessment results drive control selection
- Practice documenting control applicability with justifications

### What is the Statement of Applicability (SoA)?

The **Statement of Applicability (SoA)** is a mandatory ISO 27001 document that:
- Lists ALL 93 Annex A controls
- States which controls are implemented and which are excluded
- Provides justification for both inclusions and exclusions
- Links controls to risk treatment decisions
- Serves as a reference for auditors

**Purpose:**
- **Transparency:** Clear record of security control selection
- **Traceability:** Links controls to specific risks
- **Accountability:** Documents management decisions on risk treatment
- **Audit Trail:** Demonstrates systematic, risk-based approach

### SoA Structure

**Mandatory Elements:**
1. **Control Reference:** Annex A number (e.g., A.5.1, A.8.20)
2. **Control Title:** Name of the control
3. **Applicability Status:** Included or Excluded
4. **Justification for Inclusion:** Which risks does this control address?
5. **Justification for Exclusion:** Why is this control not needed?
6. **Implementation Status:** Not Started / In Progress / Implemented
7. **Reference to Documentation:** Where implementation is detailed (policies, procedures, configurations)

**Optional but Recommended:**
- Responsible party for implementation
- Implementation timeline
- Related risks (Risk IDs from risk register)
- Compliance mapping (PCI DSS, GDPR, regulatory requirements)

### Control Selection Process

**Step 1: Complete Risk Assessment**
- Identify all significant risks
- Evaluate likelihood and impact
- Determine which risks require treatment (above acceptance threshold)

**Step 2: Identify Applicable Annex A Controls**
- For each risk requiring treatment, review Annex A
- Select controls that directly address identified risks
- Consider control effectiveness and feasibility

**Step 3: Evaluate All 93 Controls**
- Even if not selected from risk assessment, consider all controls
- Some controls may be:
  - Regulatory requirements (must implement regardless of risk score)
  - Best practices for baseline security
  - Contractual obligations (customer or partner requirements)

**Step 4: Justify Exclusions**
- For excluded controls, document clear rationale:
  - Not applicable to organizational context
  - Risk outside scope of ISMS
  - Alternative control provides equivalent protection
  - Risk accepted and below threshold

**Step 5: Document in SoA**
- Create comprehensive SoA document
- Obtain management approval
- Maintain as living document (update when risks or controls change)

### Sample SoA Entries - Banking IoT Context

**Example 1: Organizational Control - Included**

| Control ID | Control Title | Status | Justification for Inclusion | Implementation Status | Reference Documentation |
|------------|---------------|--------|----------------------------|----------------------|-------------------------|
| A.5.7 | Threat Intelligence | ✅ Included | Addresses R042 (Advanced Persistent Threat targeting banking sector) and R018 (Zero-day vulnerabilities in IoT devices). Required to proactively identify emerging threats to our connected ATM network and cloud infrastructure. Banking regulator guidance recommends threat intelligence capability. | Implemented | • Threat Intelligence Policy v2.1<br>• Subscriptions: FS-ISAC, Recorded Future<br>• Weekly threat briefings to security team<br>• IoT vendor security bulletins monitored |

**Example 2: Technological Control - Included**

| Control ID | Control Title | Status | Justification for Inclusion | Implementation Status | Reference Documentation |
|------------|---------------|--------|----------------------------|----------------------|-------------------------|
| A.8.9 | Configuration Management | ✅ Included | Critical for R055 (IoT device misconfiguration leading to unauthorized access) and R062 (Configuration drift exposing vulnerabilities). Managing 5,000+ IoT devices requires systematic configuration standards. PCI DSS requirement for secure configurations of network devices. | In Progress (75%) | • Configuration Management Procedure v1.2<br>• Baseline configurations defined for IoT device types<br>• Ansible automation for 80% of devices<br>• Quarterly configuration audits<br>• Target completion: Q2 2026 |

**Example 3: Physical Control - Excluded**

| Control ID | Control Title | Status | Justification for Exclusion | Implementation Status | Reference Documentation |
|------------|---------------|--------|----------------------------|----------------------|-------------------------|
| A.7.3 | Securing Offices, Rooms and Facilities | ❌ Excluded | NeoBank is a digital-only bank with no physical branches or customer-facing facilities. Headquarters office security is managed by building landlord with commercial-grade controls (badge access, security guards, CCTV). This falls outside ISMS scope as defined (digital banking services). | N/A | • ISMS Scope Statement v3.0 (Section 2.3: Physical Locations)<br>• Building lease security addendum<br>• Landlord ISO 9001 certificate |

**Example 4: People Control - Included (Regulatory Requirement)**

| Control ID | Control Title | Status | Justification for Inclusion | Implementation Status | Reference Documentation |
|------------|---------------|--------|----------------------------|----------------------|-------------------------|
| A.6.1 | Screening | ✅ Included | Addresses R038 (Insider threat - malicious employee) and R041 (Negligent handling of customer data). National Banking Authority requires background checks for all employees with access to customer financial data. Industry best practice for financial services sector. | Implemented | • Pre-employment Screening Policy v3.0<br>• Background check vendor: Verified LLC<br>• Checks include: criminal history, credit check (finance roles), employment history, education verification<br>• 100% compliance for all new hires since Jan 2024 |

### Special Considerations for Exclusions

**Legitimate Exclusions:**
✅ Controls addressing risks outside organizational scope
✅ Controls for physical security when organization has no physical assets (e.g., fully cloud-based)
✅ Controls for technologies not used (e.g., mainframe security for cloud-native org)
✅ Controls superseded by alternative, equivalent controls

**Problematic Exclusions (Audit Failures):**
❌ Excluding controls because "too difficult" or "too expensive" without accepting the risk formally
❌ Excluding regulatory-mandated controls
❌ Excluding controls for high-risks without alternative treatment
❌ Vague justifications ("Not applicable" without explanation)

### SoA Workshop Exercise

**Task:** Complete SoA entries for 5 controls based on NeoBank Digital scenario.

**Controls to Assess:**
1. **A.5.23 - Information Security for Use of Cloud Services**
2. **A.8.5 - Secure Authentication**
3. **A.8.12 - Data Leakage Prevention**
4. **A.7.1 - Physical Security Perimeters**
5. **A.6.7 - Remote Working**

**For each control:**
- Decide: Include or Exclude?
- Write justification (2-3 sentences referencing specific risks or reasons)
- If included: Specify implementation status and reference documentation
- If excluded: Provide clear, auditable rationale

**Template:**
```
Control ID: A.X.X
Control Title: [Name]
Status: ✅ Included / ❌ Excluded
Justification: [Your response]
Implementation Status: [If included]
Reference Documentation: [If included]
```

---

## Session 4: Clause 6 — Risk Treatment Planning (14:30–15:30)

### Learning Objectives
- Understand the four risk treatment options
- Create risk treatment plans linked to Annex A controls
- Learn to document treatment decisions and timelines

### Risk Treatment Options

Once risks are assessed and prioritized, you must decide how to address each risk above the acceptance threshold.

**ISO 27001 defines four treatment options:**

#### 1. Risk Modification (Mitigation)
**Apply controls to reduce likelihood or impact**

**Most Common Approach:**
- Implement Annex A controls
- Deploy technical safeguards
- Establish procedures and policies
- Provide training and awareness

**Examples - Banking IoT:**
- **Risk:** Malware infection of ATM fleet
- **Treatment:** Deploy application whitelisting (A.8.7), network segmentation (A.8.22), enhanced monitoring (A.8.16)
- **Result:** Likelihood reduced from "Likely (4)" to "Unlikely (2)"

- **Risk:** Unauthorized access to IoT device management console
- **Treatment:** Implement multi-factor authentication (A.8.5), restrict IP ranges, regular access reviews (A.5.18)
- **Result:** Likelihood reduced from "Possible (3)" to "Rare (1)"

#### 2. Risk Avoidance
**Eliminate the risk by not performing the activity**

**When Appropriate:**
- Risk is too high and cannot be adequately mitigated
- Activity is not essential to business operations
- Alternative approaches exist with lower risk

**Examples:**
- **Risk:** Third-party IoT vendor has poor security practices
- **Treatment:** Cancel partnership; select alternative vendor with ISO 27001 certification
- **Result:** Risk eliminated

- **Risk:** Storing customer biometric data creates unacceptable data breach liability
- **Treatment:** Redesign authentication system to use device-based biometrics (data stays on customer's phone, not bank servers)
- **Result:** Risk avoided (bank never possesses biometric data)

#### 3. Risk Sharing (Transfer)
**Share risk with other parties**

**Common Mechanisms:**
- **Cyber Insurance:** Transfer financial impact of breaches
- **Outsourcing:** Cloud service provider assumes infrastructure security risks (shared responsibility model)
- **Contractual Clauses:** Supplier assumes liability for security failures

**Important:** Risk transfer does NOT eliminate organizational responsibility under ISO 27001 or regulations

**Examples:**
- **Risk:** Financial loss from ransomware attack
- **Treatment:** Purchase $10M cyber insurance policy with ransomware coverage
- **Result:** Financial impact partially transferred to insurer; organization still responsible for prevention

- **Risk:** Cloud infrastructure security vulnerabilities
- **Treatment:** Select AWS/Azure with SOC 2 and ISO 27001 certifications; contractual security SLAs
- **Result:** Provider shares responsibility for infrastructure security; organization retains responsibility for data security and configuration

#### 4. Risk Retention (Acceptance)
**Knowingly accept the risk without additional controls**

**When Appropriate:**
- Risk level below acceptance threshold
- Cost of treatment exceeds potential impact
- Residual risk after applying controls is acceptable

**Requirements:**
- **Formal approval** by risk owner or management
- **Documented justification** for acceptance decision
- **Ongoing monitoring** to detect if risk level changes

**Examples:**
- **Risk:** Phishing attack targeting employees
- **Treatment Applied:** Security awareness training (A.6.3), email filtering (A.8.23), MFA (A.8.5)
- **Residual Risk:** Low (1×2 = 2)
- **Decision:** Accept residual risk with quarterly monitoring

**Never Accept:**
- Risks above defined acceptance criteria
- Regulatory-mandated controls
- Risks that could result in catastrophic impact

### Risk Treatment Plan

**Purpose:** Document how each risk above acceptance threshold will be treated.

**Essential Elements:**
1. **Risk Identification:** Risk ID, description, current risk level
2. **Treatment Option:** Modify / Avoid / Share / Retain
3. **Selected Controls:** Specific Annex A controls to implement (if modifying)
4. **Implementation Actions:** Specific tasks required
5. **Responsibilities:** Who will implement and own ongoing management
6. **Timeline:** Start date, milestones, completion date
7. **Resources Required:** Budget, personnel, technology
8. **Expected Outcome:** Target risk level after treatment (residual risk)
9. **Monitoring Plan:** How effectiveness will be measured

### Sample Risk Treatment Plan - Banking IoT

**Risk ID:** R055  
**Risk Description:** IoT device misconfiguration exposing network access  
**Asset:** 5,000 IoT devices (smart locks, cameras, sensors)  
**Current Risk Level:** High (L=4, I=4, Score=16)  
**Risk Owner:** VP of Operations  

---

**Treatment Option:** Risk Modification

**Selected Controls:**

| Control ID | Control Title | Implementation Priority |
|------------|---------------|------------------------|
| A.8.9 | Configuration Management | High (Primary control) |
| A.8.8 | Management of Technical Vulnerabilities | High (Supporting) |
| A.8.16 | Monitoring Activities | Medium (Detective) |
| A.5.37 | Documented Operating Procedures | Medium (Supporting) |

**Implementation Actions:**

| Action | Description | Responsible | Start Date | Completion Date | Status |
|--------|-------------|------------|------------|-----------------|---------|
| 1 | Define secure baseline configurations for each IoT device type (locks, cameras, sensors, BMS) | Security Architect | Feb 2026 | Mar 2026 | Not Started |
| 2 | Document configuration standards and hardening guides | Security Architect + Technical Writer | Mar 2026 | Apr 2026 | Not Started |
| 3 | Implement configuration management tool (Ansible) for automated deployment | IT Infrastructure Team | Feb 2026 | May 2026 | Planning |
| 4 | Deploy baseline configurations to 5,000 devices in phases (1000/month) | IT Field Technicians | Apr 2026 | Aug 2026 | Not Started |
| 5 | Establish configuration monitoring and alerting for unauthorized changes | Security Operations Center | Jun 2026 | Jul 2026 | Not Started |
| 6 | Conduct quarterly configuration compliance audits | Internal Audit | Sep 2026 | Ongoing | Not Started |
| 7 | Develop IoT patching procedure and schedule | IT Operations Manager | Mar 2026 | Apr 2026 | Not Started |

**Resources Required:**
- **Budget:** $250,000 (configuration management tool $50K/year, consultant $100K, training $20K, implementation labor $80K)
- **Personnel:** Security Architect (25% for 6 months), 2 Field Technicians (50% for 5 months), SOC Analyst (10% ongoing)
- **Technology:** Ansible Tower license, configuration scanning tool, SIEM integration

**Target Risk Level:** Medium (L=2, I=4, Score=8)  
**Residual Risk After Treatment:** Likelihood reduced from "Likely (4)" to "Unlikely (2)" due to automated enforcement and monitoring  

**Justification for Residual Risk:** Impact remains "Major (4)" because a successful attack could still affect multiple buildings if initial access is gained. However, likelihood is significantly reduced through preventive and detective controls. Residual risk is within acceptable range per risk acceptance criteria.

**Monitoring and Measurement:**
- **KPI 1:** Percentage of IoT devices compliant with baseline configuration (Target: 95%)
- **KPI 2:** Mean time to detect configuration drift (Target: <24 hours)
- **KPI 3:** Number of unauthorized configuration changes per month (Target: <5)
- **Review Frequency:** Monthly security metrics review; quarterly deep-dive audit

**Approval:**
- Risk Treatment Plan Prepared By: Jane Doe, CISO (Date: Jan 20, 2026)
- Risk Owner Approval: Michael Chen, VP Operations (Date: Jan 22, 2026)
- Management Approval: Sarah Johnson, CIO (Date: Jan 25, 2026)

---

### Treatment Planning Workshop

**Scenario:** You are the CISO of NeoBank Digital (from earlier exercise). Select one of the five risks you assessed and create a detailed risk treatment plan.

**Template Provided:**
- Risk identification section (pre-filled from your assessment)
- Treatment option selection with justification
- Control selection from Annex A (identify 3-5 relevant controls)
- Implementation actions (minimum 5 specific tasks)
- Resources, timeline, responsibilities
- Target risk level and monitoring plan

**Deliverable:** Complete 1-page risk treatment plan ready for management approval

---

## BREAK (15:30–15:45)

---

## Session 5: Clause 7 — Support (Resources & Competence) (15:45–16:30)

### Learning Objectives
- Identify resource requirements for effective ISMS operation
- Establish competency frameworks for security roles
- Plan security awareness and training programs
- Understand communication requirements

### Clause 7.1: Resources

**Requirement:** The organization shall determine and provide resources needed for establishment, implementation, maintenance, and continual improvement of the ISMS.

**Types of Resources:**

#### 1. Human Resources
- **Security team:** CISO, security analysts, SOC operators, security engineers
- **Specialized skills:** IoT security specialists, cloud security architects, penetration testers
- **Part-time/shared resources:** Legal, HR, procurement staff supporting security activities
- **External resources:** Consultants, auditors, MSSP partners

**Banking IoT Needs:**
- IoT security expertise (device security, OT/IT convergence)
- Industrial control system knowledge
- Cloud security certifications (AWS, Azure)
- Threat intelligence analysts

#### 2. Financial Resources
- **Technology:** Security tools (SIEM, DLP, EDR, vulnerability scanners, IoT security platform)
- **Services:** Penetration testing, security audits, threat intelligence subscriptions
- **Training:** Certifications (CISSP, CISM, CEH), conference attendance
- **Infrastructure:** Secure facilities, backup systems, redundant controls
- **Insurance:** Cyber liability coverage

**Budget Considerations:**
- Typically 5-15% of IT budget for security
- Higher for regulated industries (banking, healthcare)
- IoT security tools add 10-20% to traditional security budget

#### 3. Technological Resources
- **Security infrastructure:** Firewalls, IDS/IPS, SIEM, DLP, encryption
- **Monitoring tools:** Log management, threat detection, vulnerability scanning
- **IoT-specific:** Network segmentation for IoT, IoT device management platform, firmware management
- **Testing environments:** Isolated labs for security testing without production impact

#### 4. Organizational Resources
- **Time:** Sufficient time allocated for security activities (not expecting security work "in addition to" full workload)
- **Authority:** Empowerment to enforce policies and make security decisions
- **Access:** Information and systems access needed to perform security functions

### Clause 7.2: Competence

**Requirement:** The organization shall determine necessary competence of persons doing work under its control that affects information security performance, ensure persons are competent, and retain documented information as evidence.

#### Competency Framework

**Step 1: Identify Roles with Security Responsibilities**
- Security team roles (CISO, analysts, engineers)
- IT roles (system administrators, developers)
- Business roles (asset owners, process managers)
- All employees (basic security hygiene)

**Step 2: Define Competency Requirements for Each Role**

**Example: IoT Security Engineer**

| Competency Area | Required Knowledge/Skills | Evidence |
|----------------|--------------------------|----------|
| **Technical Skills** | • Network protocols (TCP/IP, MQTT, CoAP)<br>• Embedded systems security<br>• Cryptography fundamentals<br>• Secure development practices | Degree in Computer Science/Engineering or equivalent experience |
| **Certifications** | • GIAC Critical Infrastructure Protection (GCIP) OR<br>• Offensive IoT Exploitation OR<br>• Certified IoT Security Practitioner | Current certification |
| **Experience** | • 3+ years IoT/OT security experience<br>• Hands-on device security assessments<br>• Incident response in IoT environments | Resume, reference checks, interview assessment |
| **Soft Skills** | • Communication with non-technical stakeholders<br>• Project management<br>• Risk assessment and documentation | Behavioral interview, work samples |

**Step 3: Assess Current Competence**
- Review credentials, certifications, experience
- Identify gaps between required and current competence
- Create individual development plans

**Step 4: Close Competency Gaps**
- Training programs (internal, external)
- Certifications (sponsor exam fees, study time)
- Mentoring and job shadowing
- Hiring to fill critical skill gaps

**Step 5: Maintain Competency Records**
- Training completion certificates
- Certification copies
- Performance evaluations
- Skills assessments

### Clause 7.3: Awareness

**Requirement:** Persons doing work under the organization's control shall be aware of the information security policy, their contribution to ISMS effectiveness, and implications of not conforming.

#### Security Awareness Program

**Objectives:**
- All employees understand their security responsibilities
- Recognize common threats (phishing, social engineering)
- Know how to report security incidents
- Understand consequences of policy violations

**Program Components:**

**1. Onboarding Awareness (Day 1)**
- Information security policy overview
- Acceptable use of IT resources
- Password requirements and MFA enrollment
- Incident reporting channels
- Signing acknowledgment of security responsibilities

**2. Annual Mandatory Training**
- Refresher on policies and procedures
- Current threat landscape (trending attacks)
- Real-world examples (recent breaches, lessons learned)
- Quiz to verify understanding
- Certificate of completion

**3. Role-Based Training**
- **Developers:** Secure coding, OWASP Top 10, API security
- **Managers:** Information classification, access approvals, vendor risk management
- **Finance:** Payment fraud, business email compromise
- **Customer Service:** Social engineering recognition, data handling

**4. Continuous Reinforcement**
- **Monthly security tips:** Email newsletter, intranet posts, posters
- **Simulated phishing:** Quarterly campaigns with immediate feedback
- **Lunch & Learns:** Optional sessions on security topics
- **Security champions:** Peer advocates in each department

**5. Specialized IoT Awareness (Banking Context)**
- **Physical security staff:** Recognizing IoT device tampering, reporting malfunctions
- **Branch managers:** Secure IoT device deployment, physical security around cameras/sensors
- **Facilities teams:** Environmental sensor monitoring, HVAC system security
- **IT helpdesk:** IoT device troubleshooting without compromising security

**Measurement:**
- Training completion rates (target: 100% within 30 days of hire, 98% annual)
- Phishing simulation click rates (benchmark: <5%)
- Security incident reporting rates (want this to increase as awareness grows)
- Policy violation trends (want this to decrease)

### Clause 7.4: Communication

**Requirement:** The organization shall determine internal and external communications relevant to the ISMS, including what, when, with whom, who, and how to communicate.

#### Communication Plan

**Internal Communications:**

| What | Audience | Frequency | Method | Responsible |
|------|----------|-----------|--------|-------------|
| Security policy updates | All employees | As changed | Email + intranet | CISO |
| Security metrics and KPIs | Executive leadership | Monthly | Dashboard + meeting | CISO |
| Threat advisories | IT and security teams | As identified | Email + Slack | Threat Intel Analyst |
| Incident notifications | Affected users/teams | During incidents | Email + SMS | Incident Commander |
| Audit findings | Management | Post-audit | Report + meeting | Internal Audit |
| Awareness tips | All employees | Monthly | Newsletter | Security Awareness Manager |

**External Communications:**

| What | Audience | Trigger | Method | Responsible |
|------|----------|---------|--------|-------------|
| Material breach notification | Regulators | Within 72 hours of discovery | Formal report | CISO + Legal |
| Customer breach notification | Affected customers | Per GDPR/legal requirements | Email + website | Customer Support + Legal |
| Vendor security requirements | Suppliers | Contract initiation | RFP, contract addendum | Procurement + CISO |
| Security certifications | Customers, partners | Annual + upon request | Certificate, website | CISO |
| Incident updates | Public (if material) | During significant incidents | Press release, social media | PR + CISO |

### Clause 7.5: Documented Information

**Requirement:** The ISMS must include documented information required by ISO 27001 and determined necessary by the organization for effectiveness.

#### ISMS Documentation Hierarchy

**Level 1: Policies (Strategic)**
- Information Security Policy (mandatory)
- Acceptable Use Policy
- Access Control Policy
- Incident Response Policy
- Business Continuity Policy
- Data Classification Policy

**Level 2: Procedures (Tactical)**
- Risk Assessment Procedure
- Change Management Procedure
- Access Provisioning and Deprovisioning Procedure
- Incident Response Procedure
- Backup and Recovery Procedure
- Vulnerability Management Procedure
- IoT Device Lifecycle Management Procedure

**Level 3: Work Instructions (Operational)**
- How to conduct a risk assessment (step-by-step)
- How to respond to a phishing incident
- How to configure IoT device baseline
- How to perform user access review

**Level 4: Records (Evidence)**
- Risk register
- Risk treatment plans
- Statement of Applicability
- Training records
- Audit reports
- Incident reports
- Access review logs
- Configuration change logs

**Mandatory ISO 27001 Documents:**
- Scope of ISMS (Clause 4.3)
- Information security policy (Clause 5.2)
- Risk assessment and treatment methodology (Clause 6.1)
- Statement of Applicability (Clause 6.1.3 d)
- Risk treatment plan (Clause 6.1.3 e)
- Risk assessment results (Clause 8.2)
- Risk treatment results (Clause 8.3)
- Monitoring and measurement results (Clause 9.1)
- Internal audit program and results (Clause 9.2)
- Management review results (Clause 9.3)
- Evidence of corrective actions (Clause 10.1)

**Control of Documented Information:**
- **Version control:** Track changes, maintain revision history
- **Access control:** Sensitive documents restricted to authorized personnel
- **Retention:** Define retention periods aligned with legal and business requirements
- **Disposal:** Secure deletion when documents reach end of retention period

---

## Session 6: Clause 7 — Documented Information Structure (16:30–17:15)

### Workshop Activity: Design ISMS Documentation Structure

**Objective:** Create a documentation hierarchy and control system appropriate for your organization.

#### Part 1: Document Inventory (20 minutes)

**Task:** List all documents needed for your ISMS.

**Categories:**
1. **Policies:** Strategic documents approved by senior management
2. **Procedures:** How processes are performed
3. **Work Instructions:** Detailed steps for specific tasks
4. **Forms/Templates:** Standard formats for consistent data collection
5. **Records:** Evidence of activities performed

**Starter List for Banking IoT:**
- Information Security Policy
- IoT Device Security Standard
- Configuration Management Procedure
- Risk Assessment Methodology
- Incident Response Playbook
- Asset Inventory (record)
- [Add 10+ more]

#### Part 2: Document Control Matrix (25 minutes)

**Task:** For 5 key documents, define control parameters.

**Template:**
| Document Title | Type | Owner | Approver | Review Frequency | Retention Period | Access Level |
|----------------|------|-------|----------|------------------|------------------|--------------|
| Information Security Policy | Policy | CISO | CEO + Board | Annual | 7 years | Public |
| Risk Assessment Methodology | Procedure | Risk Manager | CISO | Annual | 7 years | Internal - Restricted |
| IoT Configuration Baseline | Standard | IoT Security Engineer | CISO | Quarterly | 3 years | Internal - Restricted |
| [Document 4] | | | | | | |
| [Document 5] | | | | | | |

**Guidance:**
- **Owner:** Responsible for maintaining document
- **Approver:** Authority to approve changes
- **Review Frequency:** How often document is reviewed for currency
- **Retention Period:** How long to keep (consider legal, regulatory, business needs)
- **Access Level:** Public / Internal / Restricted / Confidential

#### Part 3: Version Control and Change Management (10 minutes)

**Task:** Define your document change management process.

**Questions to Answer:**
1. How are document changes requested?
2. Who reviews and approves changes?
3. How are versions tracked? (Naming convention: v1.0, v1.1, v2.0?)
4. How are stakeholders notified of updates?
5. Where are current versions stored? (intranet, SharePoint, document management system?)
6. How are superseded versions archived?

**Deliverable:** Short change management procedure outline

---

## End-of-Day 2 Assessment

### 1. Practical Exercise: Risk Assessment Submission (45 minutes)

**Task:** Complete and submit the risk assessment from Session 2 workshop.

**Requirements:**
- Risk scales with clear criteria
- Risk matrix with treatment thresholds
- All 5 risk scenarios assessed with justification
- Risk register prioritizing risks
- Treatment proposals for top 2 risks with specific Annex A controls

**Evaluation Criteria:**
- Appropriateness of scales to organizational context (20%)
- Logical assessment of likelihood and impact (30%)
- Clear prioritization and justification (20%)
- Relevant control selection (20%)
- Professional documentation (10%)

### 2. Short Answer Questions (15 minutes)

1. Explain the difference between risk assessment and impact assessment. When would you conduct each?

2. What are the four risk treatment options per ISO 27001? Provide an example scenario for each.

3. Why is the Statement of Applicability important for ISO 27001 certification? What happens if controls are excluded without proper justification?

4. You are implementing ISO 27001 for a bank deploying 10,000 IoT sensors. List 5 specific resources (across human, financial, technological, and organizational) you would need to request from management.

5. Describe three components of an effective security awareness program. How would you measure its effectiveness?

---

## Day 2 Key Takeaways

✅ **Risk assessment is the foundation** - Systematic identification and evaluation of threats to information assets

✅ **Risk-based approach drives control selection** - Not all 93 Annex A controls are needed; implement based on your risks

✅ **Statement of Applicability (SoA) provides transparency** - Documents which controls are implemented and why others are excluded

✅ **Risk treatment requires planning** - Clear actions, responsibilities, timelines, and resources

✅ **Support mechanisms are critical for ISMS success** - Resources, competence, awareness, communication, documentation

✅ **Banking and IoT introduce unique risks** - Device proliferation, OT/IT convergence, regulatory requirements, operational constraints

✅ **Impact assessment complements risk assessment** - Evaluate human harm for AI/IoT systems affecting people

✅ **Competency must be defined and maintained** - Security effectiveness depends on skilled, aware personnel

---

## Homework / Pre-reading for Day 3

**Read:**
- ISO/IEC 27001:2022 Clauses 8, 9, and 10
- Review your organization's incident response procedures (if available)

**Prepare:**
- Examples of security incidents from your experience or industry
- Current security metrics or KPIs from your organization

**Reflect:**
- How does your organization currently monitor security effectiveness?
- What improvements could be made to incident management?

---

**End of Day 2 Training Material**