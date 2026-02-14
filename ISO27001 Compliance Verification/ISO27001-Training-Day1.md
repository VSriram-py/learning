# DAY 1 — Foundations & Organizational Context
## ISO/IEC 27001:2022 ISMS Training for Critical Environments

**Target Audience:** Corporate teams, implementers, auditors, IT/security managers, compliance professionals in banks and high-risk industries with IoT deployments

**Duration:** Full Day (09:30 - 17:00)

**Special Focus:** Banking sector and IoT security considerations in critical infrastructure

---

## Session 1: Course Introduction & Expectations (09:30–10:00)

### Learning Objectives
- Understand the purpose and benefits of ISO 27001:2022 certification
- Recognize the certification lifecycle and organizational commitment required
- Appreciate the critical importance of ISMS in banking and IoT-enabled industries

### ISO 27001:2022 Purpose

ISO/IEC 27001:2022 is the international standard for **Information Security Management Systems (ISMS)**. Published by the International Organization for Standardization (ISO), it provides a systematic approach to managing sensitive company information, ensuring it remains secure.

**Key Purpose:**
- Protect the **confidentiality, integrity, and availability** (CIA Triad) of information
- Provide a risk-based approach to information security management
- Demonstrate commitment to stakeholders, regulators, and customers
- Enable continuous improvement through the Plan-Do-Check-Act (PDCA) cycle

### Why ISO 27001 Matters for Banking and IoT

**Banking Sector Imperatives:**
- **Regulatory Compliance:** Alignment with Basel III, PCI DSS, and national banking regulations
- **Customer Trust:** Protection of financial data and personal information (PII)
- **Cyber Resilience:** Defense against sophisticated financial fraud and ransomware attacks
- **Third-party Risk:** Managing security across payment processors, fintech partners, and cloud services
- **Incident Response:** Rapid containment of breaches to prevent financial loss

**IoT in Critical Environments:**
- **Device Proliferation:** Thousands of connected sensors, cameras, access control systems, ATMs
- **Attack Surface Expansion:** Each IoT device is a potential entry point for attackers
- **Legacy Systems:** Many industrial IoT devices run outdated firmware with known vulnerabilities
- **Real-time Operations:** Security controls must not disrupt critical 24/7 banking operations
- **Data Sensitivity:** IoT devices collect personal data (biometrics, location, behavior patterns)

**Real-World IoT Threats:**
- Compromised ATMs used for cash-out schemes
- HVAC systems exploited to gain network access (Target breach methodology)
- Smart building systems providing physical access control bypass
- Connected cameras used for reconnaissance or botnet recruitment

### Certification Lifecycle

The journey to ISO 27001 certification typically follows this timeline:

```
Gap Analysis → Implementation → Internal Audit → Stage 1 Audit → Stage 2 Audit → Certification → Surveillance Audits
   (1-2 months)     (6-12 months)     (1 month)      (On-site)       (On-site)      (Awarded)      (Annual)
```

**Phase 1: Gap Analysis (1-2 months)**
- Assess current security posture against ISO 27001 requirements
- Identify missing controls and documentation
- Estimate resources and timeline for implementation

**Phase 2: Implementation (6-12 months)**
- Develop ISMS framework and policies
- Conduct risk assessments and select Annex A controls
- Implement technical and organizational security controls
- Train staff and build awareness programs
- Create and maintain required documentation

**Phase 3: Internal Audit (1 month)**
- Validate control effectiveness internally
- Identify and close gaps before external audit
- Practice audit interviews and evidence collection

**Phase 4: Stage 1 Audit (Documentation Review)**
- External auditor reviews ISMS documentation
- Confirms scope and readiness for Stage 2
- Identifies any critical documentation gaps

**Phase 5: Stage 2 Audit (Implementation Audit)**
- On-site assessment of control implementation
- Staff interviews and evidence examination
- Technical testing of security controls

**Phase 6: Certification Awarded (Valid 3 years)**
- Certificate issued upon successful completion
- Public recognition of security commitment
- Annual surveillance audits required

**Phase 7: Surveillance & Recertification**
- Annual surveillance audits (lighter scope)
- Full recertification every 3 years
- Continuous improvement expected

### Course Structure and Expectations

**5-Day Journey:**
- **Days 1-3:** Core clauses (4-10) - The "HOW" of ISMS
- **Days 4-5:** Annex A controls - The "WHAT" to implement
- **Daily Assessments:** Quizzes, practical exercises, group activities
- **Final Capstone:** Complete ISMS implementation plan

**Participant Expectations:**
- Active participation in workshops and discussions
- Completion of daily assessments and exercises
- Collaboration in group activities
- Application of concepts to your organization's context
- Preparation for internal auditor or implementer roles

**Materials Provided:**
- Comprehensive training manual (this document)
- Template library (policies, risk registers, audit checklists)
- Case studies from banking and IoT sectors
- Access to online resources and reference materials

---

## Session 2: ISMS Principles & Structure (10:00–11:00)

### Learning Objectives
- Understand the Plan-Do-Check-Act (PDCA) cycle as the foundation of ISMS
- Recognize the structure of ISO 27001:2022 (Clauses 0-10 and Annex A)
- Appreciate the risk-based thinking approach

### The PDCA Cycle

ISO 27001 is built on the **Plan-Do-Check-Act (PDCA)** continuous improvement model:

```
┌─────────────────────────────────────────┐
│           PLAN (Clauses 4-6)            │
│  • Establish ISMS context and scope     │
│  • Define policies and objectives       │
│  • Conduct risk assessment               │
│  • Select controls and create SoA        │
└────────────────┬────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│          DO (Clauses 7-8)               │
│  • Implement risk treatment plan        │
│  • Deploy selected controls              │
│  • Provide resources and training        │
│  • Manage documented information         │
└────────────────┬────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│         CHECK (Clause 9)                │
│  • Monitor and measure performance       │
│  • Conduct internal audits               │
│  • Perform management reviews            │
│  • Evaluate control effectiveness        │
└────────────────┬────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│          ACT (Clause 10)                │
│  • Address nonconformities               │
│  • Implement corrective actions          │
│  • Continuously improve ISMS             │
│  • Adapt to new risks and changes        │
└────────────────┬────────────────────────┘
                 │
                 └───────────┐
                             │
                 ┌───────────┘
                 │
            [Cycle Repeats]
```

**Key Principles:**
1. **Continuous Improvement:** Security is never "done" - it evolves with threats
2. **Risk-Based Approach:** Focus resources on greatest risks
3. **Evidence-Based Decision Making:** Metrics, audits, and monitoring drive actions
4. **Systematic Process:** Structured approach ensures nothing is overlooked

### ISO 27001:2022 Structure

The standard consists of **11 clauses** (0-10) plus **Annex A controls**:

**Clauses 0-3: Introductory Sections**
- Clause 0: Introduction (non-mandatory)
- Clause 1: Scope (defines applicability)
- Clause 2: Normative References (ISO/IEC 27000 family)
- Clause 3: Terms and Definitions (common vocabulary)

**Clauses 4-10: Mandatory ISMS Requirements**

| Clause | Title | Purpose | Key Outputs |
|--------|-------|---------|-------------|
| **4** | Context of Organization | Understand internal/external environment | Scope statement, interested parties list |
| **5** | Leadership | Establish commitment and accountability | Information security policy, roles/responsibilities |
| **6** | Planning | Address risks and opportunities | Risk assessment, Statement of Applicability (SoA) |
| **7** | Support | Provide resources for ISMS | Competency records, documented information |
| **8** | Operation | Execute risk treatment and controls | Operational controls, change management |
| **9** | Performance Evaluation | Monitor, measure, analyze, evaluate | Audit reports, management review minutes |
| **10** | Improvement | Continually enhance ISMS effectiveness | Corrective action records, improvement initiatives |

**Annex A: Control Catalog (93 Controls)**

Annex A is NOT mandatory in its entirety. Organizations select applicable controls based on risk assessment results.

**4 Themes (New in 2022):**
- **A.5 Organizational Controls (37)** - Policies, governance, supplier security
- **A.6 People Controls (8)** - HR security, awareness, training
- **A.7 Physical Controls (14)** - Premises security, environmental protection
- **A.8 Technological Controls (34)** - Network security, cryptography, malware protection

**Important:** Your **Statement of Applicability (SoA)** documents which controls you implement and justification for exclusions.

### Changes from ISO 27001:2013 to 2022

**Structural Changes:**
- Controls reduced from **114 to 93** (consolidation, not removal)
- Reorganized from **14 domains to 4 themes**
- **11 new controls** added to address modern threats
- Alignment with **ISO/IEC 27002:2022** (implementation guidance)

**11 New Controls Critical for Banking/IoT:**
- **A.5.7:** Threat Intelligence - Proactive threat monitoring
- **A.5.23:** Cloud Services Security - Critical for cloud-first banks
- **A.5.30:** ICT Readiness for Business Continuity - Ensures resilient systems
- **A.7.4:** Physical Security Monitoring - CCTV, alarms for data centers
- **A.8.9:** Configuration Management - Secure IoT device configurations
- **A.8.10:** Information Deletion - GDPR/data retention compliance
- **A.8.11:** Data Masking - Protect PII in testing environments
- **A.8.12:** Data Leakage Prevention (DLP) - Prevent data exfiltration
- **A.8.16:** Monitoring Activities - SIEM and security monitoring
- **A.8.23:** Web Filtering - Block malicious websites
- **A.8.28:** Secure Coding - DevSecOps integration

### Risk-Based Thinking

ISO 27001:2022 emphasizes **risk-based thinking** throughout:

**Core Concept:** Not all information assets face the same threats or require the same protection level.

**Risk-Based Approach:**
1. **Identify** information assets and their value
2. **Assess** threats and vulnerabilities for each asset
3. **Evaluate** likelihood and impact of risk scenarios
4. **Treat** risks with appropriate controls (Annex A)
5. **Monitor** residual risks and changing threat landscape

**Example - Banking IoT Risk Scenario:**

**Asset:** Connected ATM fleet (1,500 machines)

**Threats:** 
- Malware injection via USB
- Network-based attacks exploiting unpatched vulnerabilities
- Physical tampering (card skimmers, jackpotting)

**Vulnerabilities:**
- Windows XP embedded systems (end-of-life)
- Weak network segmentation between ATM and core banking
- Delayed patch deployment cycles (quarterly vs. monthly)

**Impact:** 
- Financial loss: $2M - $10M (direct theft + fraud reimbursement)
- Reputational damage: Loss of customer trust, media coverage
- Regulatory fines: $500K - $5M for inadequate security controls

**Likelihood:** High (targeted campaigns against banking infrastructure observed monthly)

**Risk Treatment:**
- Implement network segmentation (A.8.22)
- Deploy application whitelisting (A.8.7 malware protection)
- Accelerate patching cycles (A.8.8 vulnerability management)
- Physical security monitoring (A.7.4)
- Incident response procedures (A.5.24-A.5.27)

---

## BREAK (11:00–11:15)

---

## Session 3: Clause 4 — Context of the Organization (11:15–12:30)

### Learning Objectives
- Identify internal and external issues affecting the ISMS
- Determine interested parties and their information security requirements
- Define and document the ISMS scope
- Understand the boundaries and applicability of the ISMS

### Clause 4.1: Understanding the Organization and Its Context

**Requirement:** Organizations must determine external and internal issues relevant to its purpose and that affect its ability to achieve intended outcomes of the ISMS.

**What This Means:**
You must understand your operating environment - both inside and outside your organization - to identify factors that could impact information security.

#### External Issues (PESTLE Analysis)

**Political:**
- Changes in data protection legislation (GDPR, CCPA, local data residency laws)
- Government surveillance requirements
- Cybersecurity regulations for critical infrastructure
- Sanctions affecting technology supply chain

**Economic:**
- Budget constraints for security investments
- Economic conditions affecting threat actor motivation (fraud increase during recessions)
- Cost of cyber insurance premiums
- Competitive pressure to adopt new technologies quickly

**Social:**
- Customer expectations for digital banking services
- Remote working culture post-pandemic
- Bring Your Own Device (BYOD) trends
- Social engineering threat landscape

**Technological:**
- Cloud migration initiatives
- IoT proliferation in banking (smart ATMs, connected branches)
- Artificial Intelligence and Machine Learning adoption
- Legacy system dependencies

**Legal:**
- PCI DSS compliance for payment card data
- Basel Committee cybersecurity requirements
- National banking regulations (e.g., FFIEC in USA, EBA in EU)
- Contractual obligations with partners and vendors

**Environmental:**
- Natural disaster risks (floods, earthquakes affecting data centers)
- Climate change impact on physical infrastructure
- Pandemic-related operational disruptions

#### Internal Issues

**Organizational:**
- Organizational structure and reporting lines
- Merger and acquisition activities
- Geographic distribution of operations
- Organizational culture toward security

**Process:**
- Maturity of existing security processes
- Change management effectiveness
- Incident response capabilities
- Business continuity planning

**People:**
- Security awareness levels
- Turnover rates in IT and security teams
- Skills gaps in emerging technologies (cloud, IoT security)
- Insider threat risk profile

**Technology:**
- IT asset inventory and architecture
- Network topology and segmentation
- Age and supportability of technology stack
- Shadow IT prevalence

**Information:**
- Types of sensitive data processed (PII, financial, intellectual property)
- Data classification schemes
- Information flow mapping
- Data retention requirements

#### Banking/IoT Example: Context Analysis

**External Context - Regional Bank with 200 Branches:**
- **Legal:** Must comply with national banking authority cybersecurity framework
- **Technological:** Implementing 5,000 IoT devices (smart locks, cameras, environmental sensors) across branches
- **Economic:** Limited cybersecurity budget ($2M annually) vs. $800M IT budget
- **Social:** 60% customer preference for mobile banking (attack surface expansion)

**Internal Context:**
- **Organizational:** Recent merger combining two legacy core banking platforms
- **Technology:** 40% of servers run on-premises, 60% migrated to cloud
- **People:** 15-person security team supporting 8,000 employees
- **Process:** Quarterly patch cycles insufficient for critical vulnerabilities

**Resulting ISMS Considerations:**
- Scope must include cloud environments and IoT infrastructure
- Risk assessment must address IoT device vulnerabilities
- Controls needed for secure cloud adoption (A.5.23)
- Configuration management critical for IoT fleet (A.8.9)

### Clause 4.2: Understanding the Needs and Expectations of Interested Parties

**Requirement:** Organizations must determine interested parties relevant to the ISMS and their information security requirements.

**Interested Party (Stakeholder):** Any person or organization that can affect, be affected by, or perceive itself to be affected by the ISMS.

#### Identifying Interested Parties

**Internal Stakeholders:**
- **Executive Leadership/Board:** Oversight, strategic direction, risk appetite
- **Business Units:** Operational needs, service availability requirements
- **IT Department:** Infrastructure management, technical implementation
- **Security Team:** Control implementation, threat monitoring, incident response
- **Legal/Compliance:** Regulatory adherence, contract management
- **Human Resources:** Staff screening, awareness training, disciplinary processes
- **Internal Audit:** Independent assurance, control testing

**External Stakeholders:**
- **Customers:** Data privacy, service availability, breach notification expectations
- **Regulators:** Banking authorities, data protection authorities, central banks
- **Shareholders/Investors:** Risk disclosure, financial impact of security incidents
- **Technology Vendors:** Patch availability, security advisories, support lifecycle
- **Cloud Service Providers:** Shared responsibility model, security certifications
- **Business Partners:** Payment networks, correspondent banks, fintech integrations
- **Auditors:** Certification bodies, external auditors, penetration testers
- **Insurance Providers:** Cyber insurance requirements and coverage terms

#### Documenting Requirements

Create an **Interested Parties Register**:

| Interested Party | Information Security Requirements | Communication Method | Frequency |
|------------------|-----------------------------------|----------------------|-----------|
| National Banking Authority | Comply with cybersecurity framework; report material incidents within 72 hours | Quarterly compliance reports; incident notifications | Quarterly + ad-hoc |
| Customers | Protect personal and financial data; notify of breaches per GDPR | Privacy policy; breach notifications; security advisories | As needed |
| Board of Directors | Risk reporting; security posture updates; incident summaries | Management review meetings; risk dashboards | Quarterly |
| Cloud Provider (AWS) | Define shared responsibility; configure security services; monitor alerts | Service level agreements; security bulletins | Continuous |
| IoT Vendor (Smart Locks) | Timely firmware updates; vulnerability disclosure; secure API access | Vendor security bulletins; patch schedules | Monthly |
| Payment Card Brands | PCI DSS compliance; secure card processing environment | Annual PCI assessment reports | Annually |

**Critical for Banking/IoT:**
- **IoT Device Manufacturers:** Security update lifecycle, vulnerability disclosure programs, end-of-support dates
- **Industrial Control System Vendors:** Patch compatibility with operational technology, testing protocols
- **Regulators:** Specific guidance on IoT risk management in critical infrastructure

### Clause 4.3: Determining the Scope of the ISMS

**Requirement:** The organization shall determine the boundaries and applicability of the ISMS to establish its scope.

**Scope Statement Purpose:**
- Defines what IS and what IS NOT covered by the ISMS
- Establishes boundaries for certification audit
- Clarifies which assets, processes, and locations are protected
- Communicates coverage to stakeholders

#### Scope Considerations

**Physical Scope:**
- Geographic locations (headquarters, branches, data centers, cloud regions)
- Buildings, floors, secure zones within facilities
- Remote worker locations (if applicable to security controls)

**Organizational Scope:**
- Business units, departments, subsidiaries included
- Exclusions (e.g., "This ISMS does not cover our insurance subsidiary")

**Technological Scope:**
- IT systems and applications
- Networks (corporate LAN/WAN, DMZ, IoT network segments)
- Cloud services and SaaS applications
- Mobile devices and endpoints
- IoT infrastructure (sensors, controllers, gateways)

**Process Scope:**
- Business processes supported (e.g., retail banking operations, payment processing)
- Support processes (IT operations, HR, facilities)
- Excluded processes (with justification)

**Asset Scope:**
- Information assets (customer databases, financial records, intellectual property)
- Physical assets (servers, network devices, IoT endpoints, backup media)
- Human assets (employees, contractors with access to information)

#### Scope Exclusions and Justifications

**Permissible Exclusions:**
- Areas outside organizational control (customer devices accessing online banking)
- Low-risk systems with documented justification
- Third-party managed services (if supplier controls are addressed)

**NEVER Exclude:**
- High-risk information assets
- Regulatory-mandated systems (payment processing, customer data storage)
- Core business processes central to organizational mission

#### Banking IoT Example: Scope Statement

**Example Scope for "SecureBank Regional":**

---

**ISMS Scope Statement**

**Organization:** SecureBank Regional Financial Services

**Effective Date:** January 15, 2026

**Scope Description:**
This Information Security Management System covers the provision of retail and commercial banking services, including customer account management, payment processing, loan origination, and digital banking channels.

**Included:**
- **Physical Locations:**
  - Headquarters (1 Main Street, City Center)
  - 200 retail branches across 5 provinces
  - Primary data center (DataVault Facility, TechPark)
  - Disaster recovery data center (SecureSite Facility, Remote Region)
  
- **IT Systems:**
  - Core banking platform (OnBase v8.5)
  - Digital banking applications (web and mobile)
  - Payment processing systems
  - Customer relationship management (CRM) system
  - Document management system
  - AWS cloud infrastructure (eu-central-1 and eu-west-1 regions)
  
- **IoT Infrastructure:**
  - 1,500 ATMs with network connectivity
  - 5,000 IoT devices including:
    - Smart physical access control systems (200 branches)
    - Environmental monitoring sensors (temperature, humidity)
    - Surveillance camera systems (IP-based CCTV)
    - Smart building management systems
  
- **Networks:**
  - Corporate LAN/WAN
  - Dedicated IoT network segment (segregated)
  - DMZ for internet-facing services
  - Payment Card Industry (PCI) compliant cardholder data environment
  
- **Personnel:**
  - 8,000 employees
  - 200 contractors and consultants with system access
  - Remote workers accessing corporate resources

**Excluded:**
- **Insurance Subsidiary:** SecureBank Insurance Ltd. maintains a separate ISMS (ISO 27001 certified independently)
- **Customer Devices:** Personal computers, smartphones, and tablets used by customers to access services (outside organizational control; security guidance provided)
- **Partner ATM Network:** Third-party ATMs operated by other banks under partnership agreements (governed by contractual security requirements)

**Justification for Exclusions:**
- Insurance subsidiary operates independently with separate management and IT infrastructure
- Customer device security is addressed through secure application design, encryption, and user awareness
- Partner ATMs are managed by certified third parties with contractual security obligations

**Applicable Requirements:**
This ISMS complies with:
- ISO/IEC 27001:2022
- National Banking Authority Cybersecurity Framework
- Payment Card Industry Data Security Standard (PCI DSS) v4.0
- General Data Protection Regulation (GDPR)
- Local data protection and privacy laws

**Certification Objective:**
This scope is established to support ISO/IEC 27001:2022 certification by an accredited certification body.

**Approved By:**  
Jane Doe, Chief Information Security Officer  
John Smith, Chief Executive Officer

---

### Clause 4.4: Information Security Management System

**Requirement:** The organization shall establish, implement, maintain, and continually improve an ISMS in accordance with ISO 27001 requirements.

**This clause is the commitment statement** - it requires you to actually BUILD and MAINTAIN the ISMS according to all the requirements in Clauses 4-10 and selected Annex A controls.

**Key Activities:**
1. **Establish:** Design the ISMS framework, policies, and procedures
2. **Implement:** Deploy controls, assign resources, train personnel
3. **Maintain:** Keep documentation current, sustain control operation
4. **Continually Improve:** Use PDCA cycle to enhance effectiveness over time

---

## LUNCH BREAK (12:30–13:30)

---

## Session 4: Clause 4 — ISMS Scope Exercise (13:30–14:30)

### Workshop Activity: Draft Your ISMS Scope Statement

**Objective:** Working in groups, develop a scope statement for a fictional or your actual organization.

#### Scenario: FinTrust Bank IoT Implementation

**Background:**
FinTrust Bank is a mid-sized commercial bank planning ISO 27001 certification. The bank is implementing IoT infrastructure across its operations:

**Organization Profile:**
- 150 branches across 3 countries
- 5,500 employees
- 1.2 million customers
- Services: Retail banking, commercial lending, wealth management, payment processing

**Technology Infrastructure:**
- Hybrid cloud model (Azure for applications, on-premises data center for core banking)
- 800 IoT-enabled ATMs (smart cash management, predictive maintenance sensors)
- 3,000 IoT devices in branches:
  - Smart locks and access control (biometric readers)
  - Environmental sensors (temperature, humidity, water leak detection)
  - IP surveillance cameras with analytics
  - Queue management systems with facial recognition
- Mobile workforce: 200 relationship managers with tablets
- Recent acquisition: Small regional bank (integration in progress)

**Regulatory Context:**
- Subject to national banking regulator cybersecurity requirements
- PCI DSS scope includes payment processing
- GDPR applies to EU customer data
- Facial recognition regulated under biometric data laws

#### Workshop Instructions

**Step 1: Define Physical Boundaries (10 minutes)**
- Which locations should be in scope?
- What about the acquired regional bank?
- How do you address remote workers?

**Step 2: Define Technological Boundaries (10 minutes)**
- Which systems must be included?
- How do you scope the IoT infrastructure?
- What about cloud services?
- Any permissible exclusions?

**Step 3: Identify Justifiable Exclusions (10 minutes)**
- What can legitimately be excluded?
- Document rationale for each exclusion

**Step 4: Draft Scope Statement (20 minutes)**
- Use the template structure from the banking example
- Be specific about IoT devices and their purpose
- Address regulatory requirements
- Prepare 2-minute presentation for the group

**Step 5: Group Presentations and Peer Review (10 minutes)**
- Each group presents their scope statement (2 minutes)
- Peers provide constructive feedback
- Trainer validates scope appropriateness

#### Scope Exercise Template

```
ISMS SCOPE STATEMENT

Organization: [Name]
Effective Date: [Date]

Scope Description:
[2-3 sentences describing business activities covered]

Included:
Physical Locations:
- [List locations]

IT Systems:
- [List major systems]

IoT Infrastructure:
- [Detailed IoT device inventory]

Networks:
- [Network segments]

Personnel:
- [Employee and contractor counts]

Excluded:
- [Item 1] - Justification: [Reason]
- [Item 2] - Justification: [Reason]

Applicable Requirements:
- ISO/IEC 27001:2022
- [Other regulations]

Approved By: [Roles]
```

---

## Session 5: Clause 5 — Leadership & Commitment (14:30–15:45)

### Learning Objectives
- Understand executive leadership's role in ISMS success
- Define information security roles and responsibilities
- Develop an information security policy
- Establish organizational accountability structures

### Clause 5.1: Leadership and Commitment

**Requirement:** Top management shall demonstrate leadership and commitment with respect to the ISMS.

**Why This Matters:**
Security initiatives fail when viewed as "IT problems." ISO 27001 requires **visible, active leadership** from the highest levels to ensure:
- Security is recognized as a business priority, not just a compliance checkbox
- Adequate resources (budget, personnel, technology) are allocated
- Security policies have authority and are enforced
- Security culture is embedded throughout the organization

#### Top Management Responsibilities

**1. Ensure ISMS aligns with strategic direction:**
- Security objectives support business objectives
- Example: If business strategy is "expand digital banking," ISMS must address mobile app security, API protection, cloud security

**2. Integrate ISMS requirements into business processes:**
- Security considerations in project planning
- Security requirements in procurement processes
- Security metrics in performance reviews

**3. Ensure resources are available:**
- Budget for security tools (SIEM, DLP, encryption, IoT security platforms)
- Headcount for security team
- Training budget for awareness and certifications
- Time allocation for security activities

**4. Communicate importance of effective ISMS:**
- Regular communication from CEO/Board about security priorities
- Security updates in town halls and company-wide meetings
- Public commitment to customer data protection

**5. Ensure ISMS achieves intended outcomes:**
- Review security metrics and KPIs
- Hold leadership accountable for security in their areas
- Respond decisively to security incidents

**6. Direct and support persons contributing to ISMS effectiveness:**
- Empower security team to enforce policies
- Support difficult security decisions (e.g., disabling risky features)
- Recognize and reward security-conscious behavior

**7. Promote continual improvement:**
- Act on audit findings and recommendations
- Invest in emerging security capabilities
- Learn from industry incidents and near-misses

**8. Support other management roles:**
- Ensure business unit leaders have security responsibilities
- Provide air cover for security initiatives that impact operations

#### Leadership in Banking IoT Context

**Scenario:** Board presents business case to deploy facial recognition in 150 branches for "frictionless customer identification."

**Leadership Commitment in Action:**

**Without ISO 27001 Leadership:**
- Project approved based on business case alone
- Security team informed after vendor selected
- Security concerns treated as "obstacles to innovation"
- Deployment rushed; vulnerabilities discovered post-launch

**With ISO 27001 Leadership:**
- **CEO requires security review before approval** (Clause 5.1)
- **CISO conducts risk assessment** on biometric data storage, vendor security, regulatory compliance (Clause 6)
- **Board reviews risk treatment plan** including data encryption, access controls, vendor audit rights (Clause 9.3)
- **Project timeline adjusted** to include security testing and privacy impact assessment
- **Vendor contract includes** security requirements, incident notification, audit clauses (A.5.19, A.5.20)
- **Ongoing monitoring established** for unauthorized access attempts, system anomalies (A.8.16)

**Result:** Innovation proceeds, but with security and privacy built in from the start.

### Clause 5.2: Policy

**Requirement:** Top management shall establish an information security policy that is appropriate to the purpose of the organization.

**The Information Security Policy is the foundation document** of your ISMS. It:
- Sets the strategic direction for information security
- Establishes management's commitment
- Defines scope and applicability
- States compliance obligations

#### Policy Requirements

The policy must:

**1. Be appropriate to the purpose of the organization**
- Reflect your business model and risk profile
- Address your industry's specific threats
- Align with organizational culture and values

**2. Include information security objectives or framework for setting objectives**
- Example objectives:
  - "Achieve 99.9% availability for digital banking services"
  - "Detect and contain security incidents within 1 hour of discovery"
  - "Achieve zero unauthorized access to customer financial data"
  - "Ensure 100% of IoT devices run current firmware within 30 days of release"

**3. Include commitment to satisfy applicable requirements**
- Legal requirements (GDPR, PCI DSS, banking regulations)
- Contractual requirements (customer agreements, vendor contracts)
- Internal requirements (corporate policies, ethical standards)

**4. Include commitment to continual improvement**
- Explicitly state commitment to improving security over time
- Establish expectation of evolving defenses

**5. Be communicated within the organization**
- Accessible to all employees (intranet, employee handbook)
- Communicated to relevant external parties (customers, partners, regulators)
- Summarized in onboarding and training programs

**6. Be available to interested parties as appropriate**
- Public-facing version for customers and auditors
- Detailed version for internal personnel
- Summarized in contracts with suppliers

**7. Be reviewed at planned intervals**
- Annual review minimum
- Additional review when major changes occur (M&A, significant incidents, regulatory changes)

#### Sample Information Security Policy - Banking IoT Context

---

**SECUREBANK REGIONAL**
**Information Security Policy**

**Version:** 2.1  
**Effective Date:** January 15, 2026  
**Next Review:** January 2027  
**Owner:** Chief Information Security Officer  
**Approved By:** Board of Directors

---

**1. PURPOSE**

This Information Security Policy establishes the framework for protecting the confidentiality, integrity, and availability of information assets at SecureBank Regional. It applies to all information systems, including traditional IT infrastructure, cloud services, and Internet of Things (IoT) devices deployed across our operations.

**2. SCOPE**

This policy applies to:
- All employees, contractors, consultants, and third parties with access to SecureBank information or systems
- All information assets, regardless of format (electronic, paper, verbal)
- All technology infrastructure, including on-premises systems, cloud services, and IoT devices
- All physical locations: headquarters, branches, data centers, and remote work environments

**3. POLICY STATEMENT**

SecureBank Regional is committed to protecting the information entrusted to us by our customers, employees, and stakeholders. We recognize that information security is critical to:
- Maintaining customer trust and confidence
- Ensuring business continuity and operational resilience
- Complying with legal, regulatory, and contractual obligations
- Protecting our reputation and competitive position

Information security is the responsibility of every employee and is integrated into all business processes, from strategic planning to daily operations.

**4. SECURITY OBJECTIVES**

SecureBank will achieve and maintain:
- **Availability:** 99.95% uptime for critical banking services
- **Confidentiality:** Zero unauthorized disclosure of customer personal or financial data
- **Integrity:** 100% accuracy of financial transactions and records
- **Incident Response:** Detection and containment of security incidents within 1 hour
- **Compliance:** Full adherence to applicable regulations (National Banking Authority framework, PCI DSS, GDPR)
- **IoT Security:** 100% of IoT devices running vendor-supported firmware with security patches applied within 30 days of release

**5. INFORMATION SECURITY PRINCIPLES**

**5.1 Confidentiality**
Information shall be accessible only to authorized individuals on a need-to-know basis. Customer data, financial records, and proprietary information shall be protected from unauthorized disclosure.

**5.2 Integrity**
Information shall be accurate, complete, and protected from unauthorized modification. Financial transactions shall be processed reliably with appropriate controls and audit trails.

**5.3 Availability**
Information and systems shall be accessible to authorized users when needed. Business-critical systems shall have appropriate redundancy, backup, and disaster recovery capabilities.

**5.4 Risk-Based Approach**
Security controls shall be implemented based on systematic risk assessment, prioritizing protection of high-value assets and addressing highest-probability threats.

**5.5 Defense in Depth**
Multiple layers of security controls shall be deployed to provide redundant protection. No single control failure shall result in a security breach.

**5.6 Least Privilege**
Users shall be granted the minimum access rights necessary to perform their job functions. Privileged access shall be restricted, monitored, and regularly reviewed.

**6. ROLES AND RESPONSIBILITIES**

- **Board of Directors:** Oversight of information security strategy and risk appetite
- **Chief Executive Officer:** Ultimate accountability for information security
- **Chief Information Security Officer:** Design, implementation, and management of ISMS
- **Business Unit Leaders:** Security of information and systems within their domains
- **All Employees:** Comply with security policies; report security incidents and concerns
- **IT Department:** Implement and maintain technical security controls
- **Internal Audit:** Independent assessment of security control effectiveness

**7. COMPLIANCE REQUIREMENTS**

SecureBank commits to complying with:
- ISO/IEC 27001:2022 Information Security Management
- National Banking Authority Cybersecurity Framework
- Payment Card Industry Data Security Standard (PCI DSS)
- General Data Protection Regulation (GDPR)
- All applicable national and regional data protection and privacy laws
- Contractual security obligations with customers, partners, and vendors

**8. SECURITY CONTROLS**

SecureBank shall implement appropriate security controls based on risk assessment, drawing from ISO/IEC 27001:2022 Annex A. Control selection shall address:
- Organizational governance and policies
- Human resource security and awareness
- Physical and environmental security
- Technological protections (network security, encryption, access control, malware defense)
- IoT-specific controls (configuration management, monitoring, secure firmware updates)
- Supplier and third-party security
- Incident management and business continuity

Implemented controls are documented in our Statement of Applicability.

**9. INCIDENT MANAGEMENT**

Security incidents and weaknesses shall be reported immediately through established channels. SecureBank shall:
- Detect security events through continuous monitoring
- Respond rapidly to contain and mitigate incidents
- Investigate root causes and implement corrective actions
- Report material incidents to regulators and affected parties as required
- Learn from incidents to improve security posture

**10. CONTINUOUS IMPROVEMENT**

SecureBank is committed to continually improving the effectiveness of our Information Security Management System through:
- Regular internal audits and management reviews
- Monitoring of security metrics and key performance indicators
- Analysis of security incidents and near-misses
- Adoption of emerging security technologies and best practices
- Engagement with industry forums, threat intelligence sources, and peer organizations
- Annual review and update of this policy and supporting procedures

**11. ENFORCEMENT**

Violations of this policy may result in disciplinary action, up to and including termination of employment or contract. Serious violations may be referred to law enforcement authorities.

**12. POLICY REVIEW**

This policy shall be reviewed annually and updated as necessary to address:
- Changes in business strategy or operations
- New technologies or services (e.g., IoT deployments, cloud migrations)
- Emerging threats and vulnerabilities
- Regulatory or legal requirement changes
- Lessons learned from security incidents
- Internal and external audit findings

---

**APPROVED:**

Jane Doe, Chief Information Security Officer - January 15, 2026  
John Smith, Chief Executive Officer - January 15, 2026  
Board of Directors - January 12, 2026

---

### Clause 5.3: Organizational Roles, Responsibilities, and Authorities

**Requirement:** Top management shall ensure that responsibilities and authorities for roles relevant to information security are assigned and communicated.

**Key Principle:** Everyone has a security responsibility, but specific roles require explicit definition.

#### Defining Security Roles

**Executive Level:**

**Chief Executive Officer (CEO)**
- Ultimate accountability for information security
- Approve information security policy and major initiatives
- Allocate budget and resources for ISMS
- Participate in management reviews

**Chief Information Security Officer (CISO) / Information Security Manager**
- Design, implement, and manage the ISMS
- Lead risk assessment and treatment activities
- Report security metrics and incidents to executive leadership
- Coordinate security across all business units
- Manage security team and external security partners
- Act as primary liaison with auditors and regulators on security matters

**Chief Information Officer (CIO)**
- Ensure IT operations align with security policies
- Provide infrastructure and technology for security controls
- Collaborate with CISO on security architecture
- Balance operational needs with security requirements

**Business Unit Leaders**
- Ensure security policies are followed within their domains
- Participate in risk assessments for their areas
- Allocate resources for security within their budgets
- Act as information asset owners for their business functions

**Operational Level:**

**Information Asset Owners**
- Define classification and handling requirements for assets they own
- Approve access requests for their information assets
- Review access rights periodically
- Report security incidents affecting their assets

**System Owners**
- Ensure systems under their control are securely configured
- Coordinate patching and maintenance windows
- Monitor system logs and alerts for security events
- Implement security controls specific to their systems

**IoT Device Managers** (Critical for Banking IoT)
- Maintain inventory of all IoT devices
- Ensure devices run current, supported firmware
- Monitor device configurations for unauthorized changes
- Isolate compromised devices and coordinate incident response
- Manage device lifecycle (procurement, deployment, decommissioning)

**Security Analysts / SOC Team**
- Monitor security events and alerts 24/7
- Investigate potential security incidents
- Perform threat hunting and analysis
- Coordinate incident response activities

**All Employees**
- Comply with information security policies and procedures
- Complete required security awareness training
- Protect authentication credentials and access rights
- Report security incidents, concerns, and weaknesses immediately
- Handle information according to classification labels

#### Responsibility Assignment Matrix (RACI)

**Sample RACI Chart for Key ISMS Activities:**

| Activity | CEO | CISO | CIO | Business Leaders | IT Team | All Staff |
|----------|-----|------|-----|------------------|---------|-----------|
| Approve Security Policy | A | R | C | I | I | I |
| Conduct Risk Assessment | I | A/R | C | C | C | I |
| Implement Technical Controls | I | A | R | I | R | I |
| Security Awareness Training | I | A/R | C | C | C | R |
| Monitor Security Events | I | A | C | I | R | I |
| Incident Response | I | A | R | C | R | R |
| Internal Security Audit | C | C | I | I | I | R (Auditors) |
| Management Review | A | R | R | R | C | I |

**Legend:**
- **R** = Responsible (does the work)
- **A** = Accountable (ultimate ownership, only one A per activity)
- **C** = Consulted (provides input)
- **I** = Informed (kept updated)

---

## BREAK (15:45–16:00)

---

## Session 6: Information Security Policy Workshop (16:00–17:00)

### Workshop Activity: Draft an Information Security Policy

**Objective:** In groups, draft a high-level information security policy appropriate for your organization or the provided scenario.

#### Scenario: TechManufacture Industries - IoT-Enabled Factory

**Background:**
TechManufacture produces precision components for aerospace and automotive industries. The company is implementing Industry 4.0 initiatives with extensive IoT:

**Organization Profile:**
- 3 manufacturing facilities
- 2,500 employees
- Mix of legacy industrial control systems and modern IoT sensors
- Recent cybersecurity incidents in manufacturing sector raising board concerns

**IoT Implementation:**
- 10,000 sensors monitoring production equipment (vibration, temperature, pressure)
- Automated quality control systems with vision AI
- Predictive maintenance platform analyzing sensor data
- Connected supply chain management (real-time inventory tracking)
- Smart energy management for facilities

**Security Concerns:**
- Operational technology (OT) and IT network convergence
- Intellectual property protection (proprietary manufacturing processes)
- Ransomware risk to production systems
- Supply chain attacks through IoT vendors

#### Workshop Instructions

**Part 1: Identify Key Policy Elements (15 minutes)**

Work in groups to answer:
1. What are the top 3 information assets that must be protected?
2. What are the top 3 threats to those assets?
3. What security objectives should the policy establish?
4. What roles and responsibilities are critical?
5. What compliance requirements apply?

**Part 2: Draft Policy Statement (30 minutes)**

Using the template below, draft:
- Purpose statement (2-3 sentences)
- Scope (what's covered)
- 3-4 key security objectives
- High-level principles (confidentiality, integrity, availability)
- Roles (identify 5 key roles)
- Commitment to compliance and improvement

**Part 3: Peer Review (15 minutes)**

Exchange policy drafts with another group:
- Review for completeness (does it meet ISO 27001 requirements?)
- Check for clarity (would an employee understand expectations?)
- Evaluate appropriateness (does it fit the organization's context?)
- Provide 2-3 constructive suggestions

#### Policy Template

```
[ORGANIZATION NAME]
INFORMATION SECURITY POLICY

Version: 1.0
Effective Date: [Date]
Owner: [Role]
Approved By: [CEO/Board]

1. PURPOSE
[Why this policy exists, what it aims to achieve]

2. SCOPE
[Who and what it applies to]

3. POLICY STATEMENT
[Management's commitment to information security]

4. SECURITY OBJECTIVES
[Specific, measurable objectives]
- Objective 1:
- Objective 2:
- Objective 3:

5. PRINCIPLES
[Core principles guiding security decisions]
- Confidentiality:
- Integrity:
- Availability:
- [Other relevant principles]

6. ROLES AND RESPONSIBILITIES
[Key roles and their security responsibilities]
- Role 1:
- Role 2:
- Role 3:

7. COMPLIANCE REQUIREMENTS
[Legal, regulatory, contractual obligations]

8. CONTINUOUS IMPROVEMENT
[Commitment to ongoing enhancement]

9. POLICY REVIEW
[Review frequency and triggers]

APPROVED: [Signatures]
```

---

## End-of-Day 1 Assessment

### Assessment Components

**1. Knowledge Quiz (15 questions, 30 minutes)**

**Questions:**

1. What does the PDCA cycle stand for, and which ISO 27001 clauses map to each phase?
2. List three external issues and three internal issues that could affect your ISMS.
3. Name five interested parties relevant to a bank's ISMS and one requirement for each.
4. What must be included in an ISMS scope statement?
5. Can you exclude high-risk systems from your ISMS scope? Why or why not?
6. List five specific responsibilities of top management in Clause 5.1.
7. What seven elements must be included in an information security policy per Clause 5.2?
8. True or False: The information security policy must be available to interested parties.
9. Who has ultimate accountability for information security in an organization?
10. What is the role of an Information Asset Owner?
11. Why is leadership commitment critical for ISMS success? Provide two reasons.
12. What are the four themes of ISO 27001:2022 Annex A controls?
13. How many controls are in ISO 27001:2022 Annex A, and how does this compare to the 2013 version?
14. Name three new controls introduced in the 2022 version relevant to IoT security.
15. What is the relationship between risk assessment and control selection?

**Answers Available to Trainer**

**2. Group Activity: ISMS Scope Presentation (15 minutes)**

Each group presents their ISMS scope statement from Session 4:
- 3-minute presentation
- Peer feedback on clarity, completeness, and appropriateness
- Trainer validation and suggestions

---

## Day 1 Key Takeaways

✅ **ISO 27001 provides a systematic framework** for managing information security through the PDCA cycle

✅ **Context analysis (Clause 4)** is the foundation - understanding your environment, stakeholders, and risks drives everything else

✅ **ISMS scope must be carefully defined** - clear boundaries, specific inclusions, justified exclusions

✅ **Leadership commitment (Clause 5) is non-negotiable** - security cannot succeed as an IT-only initiative

✅ **Information security policy** is the cornerstone document establishing management commitment, objectives, and accountability

✅ **Roles and responsibilities must be explicit** - everyone has security duties, but key roles need formal definition

✅ **IoT in critical environments demands special attention** - expanded attack surface, legacy vulnerabilities, operational constraints

✅ **Banking sector faces unique challenges** - regulatory scrutiny, customer trust, financial fraud, 24/7 operations

---

## Homework / Pre-reading for Day 2

**Read:**
- ISO/IEC 27001:2022 Clause 6 (Planning) in full
- Review risk assessment methodologies (your organization's approach or ISO 31000)

**Prepare:**
- Bring examples of information assets from your organization
- Identify 2-3 potential risk scenarios relevant to your context

**Reflect:**
- What are the top information security concerns in your organization?
- How mature are your current risk assessment processes?

---

## Additional Resources

**Standards and Guidance:**
- ISO/IEC 27001:2022 - Information Security Management Systems - Requirements
- ISO/IEC 27002:2022 - Information Security Controls (implementation guidance)
- ISO/IEC 27000:2018 - Information Security Management Systems - Overview and Vocabulary
- ISO 31000:2018 - Risk Management Guidelines

**Banking/Financial Sector:**
- Basel Committee on Banking Supervision - Cyber-resilience Framework
- FFIEC Cybersecurity Assessment Tool (USA)
- European Banking Authority (EBA) Guidelines on ICT and Security Risk Management
- Payment Card Industry Data Security Standard (PCI DSS)

**IoT Security:**
- NIST Cybersecurity Framework - IoT Device Cybersecurity Guidance
- ENISA Guidelines for Securing the Internet of Things
- IEC 62443 - Industrial Communication Networks - Security
- OWASP IoT Top 10

**Online Communities:**
- ISO27k Forum (iso27001security.com/forum)
- Information Security Stack Exchange
- ISACA Local Chapters

---

**End of Day 1 Training Material**