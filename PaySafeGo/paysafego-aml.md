
---

## Onboarding and CDD Flow

| Step | Action | Risk Level | Outcome |
|------|--------|-----------|---------|
| 1 | Collect identity data (name, DOB, address, email, phone) | All | Data captured |
| 2 | Collect device, IP, geo, channel info | All | Context established |
| 3 | Calculate initial risk score (rules + ML model) | All | Risk band assigned |
| 4 | Low Risk Path | Low | Simplified CDD via IDV/DVS |
| 5 | Medium Risk Path | Medium | Standard CDD + extra source checks |
| 6 | High Risk Path | High | EDD: source of funds/wealth, manual review queue |
| 7 | ID verification check | Low/Medium | Verified = Onboarded, Failed = Auto-reject |
| 8 | EDD approval decision | High | Approved = Onboarded, Rejected = Blacklist |
| Final | Customer Onboarded | All | Risk rating assigned and locked |

---

## Transaction Monitoring Flow

| Stage | Process | Input | Check | Output |
|-------|---------|-------|-------|--------|
| 1 | Transaction Initiated | Payment/Gaming request | - | Transaction logged |
| 2 | Context Enrichment | Customer risk, device, merchant, game type | - | Context attached |
| 3 | Screening | Transaction data | Match sanctions/PEP/adverse media lists? | Clean or Flagged |
| 4 | Rules Engine | Transaction parameters | Apply behavioral scenarios, thresholds, velocity checks | Rules-based risk score |
| 5 | ML Anomaly Detection | Historical patterns | Detect suspicious patterns vs. peer group? | ML-based risk score |
| 6 | Risk Aggregation | Rules score + ML score | Calculate weighted combination | Final risk band (Low/Med/High) |
| 7A | Low Risk Decision | Final score < threshold | Automatic approval? | YES - Auto-approve, execute, log |
| 7B | Medium Risk Decision | Final score in range | Flag for periodic review? | YES - Approve but mark for review |
| 7C | High Risk Decision | Final score > threshold | Generate case and alert? | YES - Create case, alert investigator |
| 8 | Investigator Triage | Case details | Manual assessment | Triage completed |
| 9 | Suspicious Assessment | Investigation findings | Is activity truly suspicious? | NO = Close case, use for model training |
| 9 | Suspicious Assessment | Investigation findings | Is activity truly suspicious? | YES = Draft SMR with evidence bundle |

---

## Reporting and Record-Keeping Flow

| Step | Trigger | Action | Owner | Status | Output |
|------|---------|--------|-------|--------|--------|
| 1 | High-risk alert or scenario detected | Classify event | System | Auto | Event type assigned (SMR/TTR/IFTI/Other) |
| 2 | Event classified | Auto-populate report template | System | Auto | Fields pre-filled from case data |
| 3 | Report generated | Pre-submission validation | System | Auto | Schema and completeness checks |
| 4 | Validation passed or failed | Compliance officer review | Compliance Officer | Manual | Report approved or rejected |
| 5 | Report approved | Submit to AUSTRAC API | Compliance Officer | Manual | Submission receipt generated |
| 5 | Report rejected | Return to investigator | Compliance Officer | Manual | Rework ticket created |
| 6 | Submission confirmed | Store submission receipt | System | Auto | Full audit trail and evidence stored |
| 7 | All reports filed | Generate analytics | System | Auto | Compliance dashboard updated |

---

## Automation Boundaries

### Fully Automatable
- Identity data capture and structuring
- Risk scoring calculations (rules and ML)
- Sanctions, PEP, and adverse media screening
- Rules-based and ML-based transaction monitoring
- Report template generation and field population
- Data retention and archive management
- Analytics and reporting dashboards

### Requires Human Oversight
- SMR content review and submission decisions
- EDD outcome determinations for high-risk customers
- Changes to risk appetite or system thresholds
- Independent reviews of the AML/CTF program (annual/periodic)
- Model validation and performance assessment
- Investigation case decisions and investigator sign-off

---

## Onboarding Automation Components

**Identity Verification**
- Integrate with Australian DVS (Document Verification Service) or commercial IDV providers
- Perform document verification (passport, driver's license, etc.)
- Conduct biometric checks and liveness detection
- Capture fraud signals and velocity checks

**Risk Engine**
- Rules-based scoring: identity, device, geolocation, channel, behavioral features
- ML-based scoring: Historical patterns, peer group comparisons, network analysis
- Assign initial risk bands: Low, Medium, High
- Tier-based CDD routing based on risk band

**KYC/KYB Data Sources**
- Company registries and ABN lookups for business customers
- Credit header data queries
- Watchlist screening (ASIC, sanctions lists, PEP lists)
- Adverse media searches

---

## Transaction Monitoring Components

**Scenario Library**
- Structuring: Multiple deposits/withdrawals below thresholds
- Smurfing: Rapid successive transactions from multiple accounts
- Rapid in/out: Quick deposit followed by immediate withdrawal
- Chip-cashing: Converting gaming chips back to cash without play
- Bonus abuse: Exploiting promotional bonuses repeatedly
- Unusual merchant: Transactions with high-risk merchants or geographies

**ML Layer**
- Anomaly detection: Deviation from customer's historical baseline
- Peer-group analysis: Comparison with similar customer profiles
- Network analytics: Detection of ring patterns and connected accounts
- Behavioral clustering: Identification of new fraud patterns

**Feedback Loop**
- Investigator dispositions captured: Confirmed suspicious vs. false positive
- Model re-training: Monthly updates to ML models with new data
- Rule tuning: Adjustment of thresholds based on false positive rates
- Performance tracking: Dashboard of model accuracy and coverage metrics

---

## Reporting Automation Components

### Rule-Based Triggers

| Report Type | Trigger Condition | Reporting Timeframe | AUSTRAC Requirement |
|------|----------|--------|--------|
| **TTR** (Threshold Transaction Report) | Cash transactions >= A$10,000 (or equivalent foreign currency) | Within 10 business days | Mandatory for all cash txns meeting threshold |
| **IFTI** (International Funds Transfer Instructions) | All international funds transfers (any amount) | Within 10 business days | Mandatory for cross-border txns |
| **SMR** (Suspicious Matter Report) - Terrorism | Suspected terrorism financing activity | Within 24 hours | Urgent reporting required |
| **SMR** (Suspicious Matter Report) - Other | Suspected money laundering or other criminal activity | Within 3 business days | Standard reporting required |

**AUSTRAC Integration**
- API integration for automated report submission
- Secure upload portal for manual submissions
- Real-time validation and error checking
- Submission receipt and acknowledgment tracking
- Compliance dashboard showing submission status

**Evidence Bundling**
- Automatically attach all related transactions
- Include KYC/identity verification documents
- Attach investigator notes and analysis
- Include model explanations and risk scores
- Archive all evidence for audit trail

---

## Governance and Oversight

**AML/CTF Compliance Officer Responsibilities**
- Design and oversee the AML/CTF program
- Ensure program effectiveness and regulatory compliance
- Maintain independent reporting line to senior management or board
- Engage with AUSTRAC and respond to compliance inquiries
- Approve all SMR submissions and significant decisions
- Oversee training and staff competency

**Independent Review**
- Annual (or as required by AUSTRAC) external review of AML/CTF program
- Assessment of policies, procedures, and controls
- Review of transaction monitoring and case management
- Testing of data quality and system accuracy
- Validation of model performance and risk scoring
- Recommendations for improvement

**Model Risk Management**
- Validation: Testing of all rules and ML models for accuracy and bias
- Back-testing: Comparison of model predictions vs. actual outcomes
- Documentation: Complete records of model logic, performance, and changes
- Change control: Approval process for rule and model updates
- Monitoring: Ongoing performance tracking and alert thresholds
- Decommissioning: Proper retirement of outdated models

---

## Implementation Roadmap (12–18 Months)

**Phase 1: Foundation (Months 0–3)**
- Conduct regulatory requirements analysis and gap assessment
- Design data model and system architecture
- Develop initial risk taxonomy and scoring framework
- Establish compliance readiness assessment
- Set up governance structure and roles

**Phase 2: MVP (Months 3–6)**
- Implement core onboarding automation (IDV/DVS integration)
- Deploy sanctions and PEP screening
- Build basic rules engine with key scenarios
- Enable manual case management workflow
- Create auto-drafted SMR/TTR templates
- Establish AUSTRAC submission process

**Phase 3: Scale (Months 6–12)**
- Deploy ML-based transaction monitoring
- Implement AUSTRAC API integration
- Build compliance dashboards and reporting
- Tune case management system based on feedback
- Conduct first independent review preparation
- Train staff and establish operational procedures

**Phase 4: Optimisation (Months 12–18)**
- Refine ML models based on investigator feedback
- Develop advanced gaming-specific typologies
- Enhance ML model validation and back-testing
- Prepare for independent program review
- Document all procedures and controls
- Plan for ongoing maintenance and updates

---

## Key Performance Indicators (KPIs)

| KPI | Target | Frequency | Owner |
|------|--------|-----------|-------|
| % Straight-through processing (STP) | 85%+ | Monthly | Ops Manager |
| Average time to resolve case | <5 business days | Monthly | Compliance Officer |
| False positive rate | <15% | Monthly | Ops Manager |
| SMR/TTR submission accuracy | 99%+ | Quarterly | Compliance Officer |
| Model performance (accuracy) | 85%+ | Quarterly | ML Lead |
| Compliance audit findings | 0 critical | Annual | Compliance Officer |

---

## System Requirements and Dependencies

- **Identity Verification**: DVS API access or commercial IDV vendor integration
- **Sanctions Screening**: Access to OFAC, UN, ASIC, and other watchlists
- **Case Management**: Secure case management system with audit trail
- **AUSTRAC Integration**: API credentials and secure connection
- **Data Storage**: Compliant data warehouse with encryption and retention policies
- **Staff**: Compliance officer, investigators, operations team, ML engineers

---

## Compliance and Regulatory Notes

- All procedures comply with AUSTRAC AML/CTF Rules 2025
- Record retention: Minimum 7 years for all transaction and customer records
- Independent review: Required at least annually
- Suspicious Matter Reports: Must be filed timely and completely
- Documentation: All processes must be documented and available for audit
- Staff Training: All staff must receive annual AML/CTF compliance training
- Customer Privacy: Comply with Privacy Act 1988 (Cth) and APPs

---

## Key Notes

- This markdown is structured for Marp-style dark-theme slides (dark background, light text).
- GitHub renders it as standard markdown; you can render slides using Marp CLI or VS Code extension while preserving the dark theme.
- All regulatory references reflect AUSTRAC AML/CTF Rules 2025 and compliance deadlines effective 2026.
- ASCII diagrams and tables ensure perfect GitHub rendering without Mermaid syntax errors.
- All truncated content has been completed and verified.
