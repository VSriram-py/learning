# ISO/IEC 42001 Practical AIMS Implementation Training Guide

## Complete Step-by-Step Manual for AI Management System Implementation

---

## Table of Contents

1. [Introduction to AI Governance](#chapter-1-introduction-to-ai-governance)
2. [Understanding ISO/IEC 42001 Structure](#chapter-2-understanding-isoiec-42001-structure)
3. [AI Governance Principles](#chapter-3-ai-governance-principles)
4. [Organizational Roles in AI](#chapter-4-organizational-roles-in-ai)
5. [Phase 1: Gap Analysis & Context](#chapter-5-phase-1-gap-analysis--context)
6. [Phase 2: Planning & Risk Assessment](#chapter-6-phase-2-planning--risk-assessment)
7. [Phase 3: Implementation](#chapter-7-phase-3-implementation)
8. [Phase 4: Verification & Audit](#chapter-8-phase-4-verification--audit)
9. [Documentation Requirements](#chapter-9-documentation-requirements)
10. [Practical Templates & Samples](#chapter-10-practical-templates--samples)

---

## Chapter 1: Introduction to AI Governance

### 1.1 Why AI Governance Matters

**The AI Challenge:**
AI without governance is like a spoiled child - powerful but unpredictable. As organizations increasingly deploy AI systems, they face critical challenges:

- **Bias and Fairness Issues**: AI systems can perpetuate or amplify historical biases (e.g., Amazon's 2015 hiring tool that favored male candidates)
- **Misinformation**: AI can generate false or misleading content without proper controls
- **Misuse**: AI tools can be exploited for harmful purposes (e.g., deepfakes, unauthorized image manipulation)
- **Trust Erosion**: Lack of transparency damages stakeholder confidence
- **Compliance Risks**: Regulatory requirements (EU AI Act, GDPR, etc.) demand accountability

**Real-World Example:**
In 2015, Amazon developed an AI recruiting tool that filtered resumes. Due to limited training data predominantly from male candidates, the system discriminated against female applicants. This is a classic example of non-responsible AI leading to:
- Discrimination lawsuits
- Public distrust
- Reputational damage
- Compliance violations

### 1.2 What is AI vs Machine Learning?

**Artificial Intelligence (AI):**
- Machines that think and perform tasks like humans
- Computer systems engineered to emulate human intelligence
- Core capabilities: Learning, reasoning, problem-solving, perception
- Examples: ChatGPT, facial recognition, voice assistants

**Machine Learning (ML):**
- The "brain" of AI - how AI learns from data
- Enables AI to acquire knowledge and skills from historical data
- Types: Supervised, unsupervised, reinforcement learning
- Deep Learning: Advanced ML using neural networks (e.g., generative AI)

**Analogy:**
- AI is the **objective** (thinking like a human)
- ML is the **method** (learning from data to achieve that objective)

### 1.3 AI Governance Definition

**AI Governance** is establishing a framework of policies, processes, and controls to guide the responsible deployment and operation of AI systems.

**Key Objectives:**
1. Prevent bias and maintain fairness
2. Ensure transparency and explainability
3. Protect privacy and security
4. Enable human oversight for critical decisions
5. Balance innovation with responsibility

**Example:**
Healthcare AI diagnosing cancer:
- **Without Governance**: AI makes final diagnosis autonomously → High risk
- **With Governance**: AI assists, but human doctor makes final decision → Responsible AI

### 1.4 Responsible AI Framework

**Without Responsible AI:**
- Historical data favors certain demographics
- Discrimination occurs
- Lawsuits and public distrust follow

**With Responsible AI:**
- Regular auditing and fairness checks
- Diverse datasets
- Improved diversity metrics
- Trust and compliance established

**The 5 AI Governance Principles:**
1. **Accountability**: Clear ownership and responsibility
2. **Transparency**: Explain how AI makes decisions
3. **Fairness**: Mitigate bias, ensure equitable outcomes
4. **Safety & Compliance**: Protect users and follow regulations
5. **Balanced Innovation**: Promote progress while maintaining responsibility

---

## Chapter 2: Understanding ISO/IEC 42001 Structure

### 2.1 What is ISO/IEC 42001?

**ISO/IEC 42001:2023** is the world's first international standard for AI Management Systems (AIMS). Published in December 2023 by ISO/IEC JTC 1/SC 42, it provides:

- Requirements for establishing, implementing, maintaining, and improving an AIMS
- Framework for responsible AI development, provision, and use
- Certification pathway to demonstrate compliance
- Integration with existing management systems (ISO 27001, ISO 9001)

**Benefits:**
- Demonstrate compliance to stakeholders
- Build trust with customers and regulators
- Systematic approach to AI governance
- Competitive advantage in the market
- Risk mitigation and liability reduction

### 2.2 Standard Structure Overview

**Clauses 1-3: Introductory (Not Auditable)**
- Scope, normative references, terms and definitions
- Background information only

**Clauses 4-10: Core AIMS Requirements (Auditable)**
These are **mandatory** for certification:

| Clause | Title | Focus |
|--------|-------|-------|
| **Clause 4** | Context of the Organization | Understanding environment, interested parties, AIMS scope |
| **Clause 5** | Leadership | Top management commitment, AI policy, roles & responsibilities |
| **Clause 6** | Planning | Risk assessment, objectives, planning for changes |
| **Clause 7** | Support | Resources, competence, awareness, communication, documentation |
| **Clause 8** | Operation | AI system lifecycle management, controls implementation |
| **Clause 9** | Performance Evaluation | Monitoring, measurement, internal audit, management review |
| **Clause 10** | Improvement | Nonconformity, corrective action, continual improvement |

**Annexes:**

| Annex | Type | Purpose |
|-------|------|---------|
| **Annex A** | Normative | 38 reference controls (mandatory review) - Creates SOA (Statement of Applicability) |
| **Annex B** | Normative | Implementation guidance for Annex A controls |
| **Annex C** | Informative | AI-specific objectives for risk assessment and impact assessment |
| **Annex D** | Informative | Sector-specific guidance (banking, healthcare, HR, public sector) |

### 2.3 The PDCA Cycle

ISO 42001 follows the **Plan-Do-Check-Act** continuous improvement model:

```
┌─────────────┐
│    PLAN     │ ← Clauses 4, 5, 6: Context, Leadership, Planning
├─────────────┤
│     DO      │ ← Clauses 7, 8: Support, Operations
├─────────────┤
│    CHECK    │ ← Clause 9: Performance Evaluation
├─────────────┤
│     ACT     │ ← Clause 10: Improvement
└─────────────┘
```

**Example Flow:**
1. **Plan**: Define AIMS scope, conduct risk assessment, set objectives
2. **Do**: Implement controls, allocate resources, deploy AI systems
3. **Check**: Monitor performance, conduct internal audits, review metrics
4. **Act**: Address nonconformities, implement corrective actions, improve

### 2.4 Implementation Sequence

**Step-by-Step Approach:**

1. **Understand Context** (Clause 4.1)
   - Current and desired AI capabilities
   - Internal/external issues
   - Organizational culture and maturity

2. **Identify Interested Parties** (Clause 4.2)
   - Stakeholders: customers, regulators, employees, data subjects
   - Map expectations and requirements

3. **Define AIMS Scope** (Clause 4.3)
   - Boundaries: which AI systems, processes, departments
   - Justification for inclusions/exclusions

4. **Get Sponsorship** (Clause 5.1)
   - Top management commitment
   - Resource allocation approval

5. **Create AI Policy** (Clause 5.2)
   - Foundation document aligning organization to principles

6. **Plan Risk Assessment** (Clause 6.1)
   - Identify risks and opportunities
   - Assess and treat risks

7. **Implement Controls** (Clauses 7, 8)
   - Deploy resources, establish processes
   - Operationalize AI lifecycle management

8. **Verify and Audit** (Clauses 9, 10)
   - Monitor, measure, audit, review, improve

---

## Chapter 3: AI Governance Principles

### 3.1 The 5 Pillars of AI Governance

#### 1. Accountability

**Definition**: Clear assignment of responsibility for AI system outcomes.

**Key Requirements:**
- Identify AI system owners
- Define roles: sponsors, developers, operators, reviewers
- Establish oversight mechanisms
- Document decision-making authority
- Create escalation paths

**Example:**
An AI-powered loan approval system must have:
- **System Owner**: VP of Digital Banking
- **Data Owner**: Chief Data Officer
- **Risk Owner**: Chief Risk Officer
- **Ethics Board**: Reviews high-risk decisions

**Template: RACI Matrix**
```
| Role                  | Responsible | Accountable | Consulted | Informed |
|-----------------------|-------------|-------------|-----------|----------|
| AI System Owner       | R           | A           | -         | -        |
| Data Governance Lead  | R           | -           | C         | I        |
| Legal/Compliance      | -           | -           | C         | I        |
| IT Security           | R           | -           | C         | I        |
```

#### 2. Transparency

**Definition**: Openness about how AI systems work, including data sources, algorithms, and decision-making processes.

**Key Requirements:**
- Document AI system purpose and scope
- Explain data sources and provenance
- Describe model logic (where possible)
- Provide decision explanations to users
- Maintain audit trails

**Example:**
Credit scoring AI must disclose:
- **Data Used**: Income, credit history, payment patterns
- **Decision Factors**: Top 3 factors affecting score
- **Explainability**: "Your score was reduced due to: 1) Late payments in last 6 months, 2) High credit utilization"

**Explainable AI (XAI):**
Tools like LIME and SHAP provide insights into black-box models, enabling transparency even for complex neural networks.

#### 3. Fairness

**Definition**: Ensuring AI systems do not discriminate and treat all individuals equitably.

**Key Requirements:**
- Use diverse, representative datasets
- Test for bias across demographics
- Implement bias mitigation techniques
- Monitor for discriminatory outcomes
- Regular fairness audits

**Example:**
Resume screening AI:
- **Risk**: Gender bias from male-dominated training data
- **Mitigation**: 
  - Expand dataset to include diverse candidates
  - Remove gender-indicating features
  - Implement blind screening
  - Human review of flagged cases
  - Quarterly bias testing

#### 4. Safety & Compliance

**Definition**: Protecting users from harm and adhering to legal/regulatory requirements.

**Key Requirements:**
- Comply with regulations (EU AI Act, GDPR, CCPA, etc.)
- Conduct safety testing
- Implement security controls
- Protect personal data
- Establish incident response procedures

**Example:**
Autonomous vehicle AI:
- **Safety**: Extensive testing in simulated and real environments
- **Compliance**: Meet automotive safety standards
- **Human Override**: Driver can take control at any time
- **Incident Logging**: Black box recording for analysis

#### 5. Balanced Innovation

**Definition**: Promoting AI advancement while maintaining ethical standards and responsibility.

**Key Requirements:**
- Encourage experimentation within guardrails
- Balance speed-to-market with safety
- Privacy-by-design principles
- Ethical review boards
- Responsible disclosure practices

**Example:**
ChatGPT evolution:
- **Initial Launch**: Open prompts led to misuse
- **Governance Applied**: Content filtering, usage policies, rate limiting
- **Balance Achieved**: Innovation continues with responsible boundaries

### 3.2 Human Oversight

**Definition**: Human intervention at critical decision points, especially for high-risk AI applications.

**When Required:**
- Healthcare diagnostics and treatment decisions
- Criminal justice (bail, sentencing, parole)
- Employment decisions (hiring, firing, promotions)
- Financial lending with significant impact
- Autonomous systems affecting human safety

**Implementation:**
- **Human-in-the-Loop (HITL)**: Human approves each decision
- **Human-on-the-Loop (HOTL)**: Human monitors and can intervene
- **Human-in-Command (HIC)**: Human sets parameters and oversees

**Example:**
Medical AI diagnosing cancer:
- AI analyzes imaging and provides diagnosis with confidence score
- Radiologist reviews AI findings
- Doctor makes final treatment decision
- Patient informed of AI's role in process

---

## Chapter 4: Organizational Roles in AI

### 4.1 Determining Your AI Role

**Before implementing AIMS**, identify your organization's role in the AI ecosystem. This drives scope and control requirements.

| Role | Description | Example | AIMS Focus |
|------|-------------|---------|------------|
| **AI Provider** | Supplies platform/infrastructure for AI products | AWS, Google Cloud, Azure AI services | Infrastructure security, availability, contract management |
| **AI Producer** | Develops, designs, tests, deploys, operates AI systems | Tech companies building AI solutions, internal dev teams | Full AI lifecycle, model governance, testing |
| **AI Customer** | End-user consuming AI for business operations | Company using ChatGPT, Salesforce Einstein | Usage policies, vendor management, data protection |
| **AI Partner** | Integrates third-party AI or provides supporting services | LLM providers (OpenAI), data vendors, AI consultants | Contractual agreements, data sharing, interoperability |
| **AI Subject** | Individuals affected by AI decisions | Employees screened by AI, loan applicants, patients | Rights protection, transparency, appeal mechanisms |
| **AI Authority** | Regulators and policymakers | EU AI Act enforcers, data protection authorities | Compliance demonstration, reporting |

**Case Study: Aspirant Technology**
- **Primary Role**: AI Producer (develops Smart Assist, Talent IQ, PredictMent)
- **Secondary Role**: AI Customer (uses cloud AI services)
- **AIMS Scope**: Covers development, deployment, and operation of proprietary AI systems

### 4.2 Internal Governance Roles

**Executive Level:**
- **AI Sponsor** (typically CEO or CTO): Executive accountability
- **Steering Committee**: Cross-functional oversight (CTO chairs)

**Management Level:**
- **AIMS Governance Lead**: Day-to-day AIMS management
- **AI System Owners**: Responsible for specific AI systems
- **Risk Owners**: Manage AI-related risks
- **Data Owners**: Govern data used in AI

**Operational Level:**
- **AI Developers**: Build and train models
- **AI Operators**: Deploy and monitor systems
- **Data Scientists**: Analyze and prepare data
- **AI Auditors**: Internal compliance testing

**Advisory:**
- **Ethics Board**: Review high-risk AI applications
- **Legal/Compliance**: Regulatory interpretation
- **Privacy Officer**: Data protection compliance

**Documentation:**
- Organizational chart showing AI governance structure
- RACI matrix for each role
- Appointment letters with defined responsibilities
- Competence requirements for each role

---

## Chapter 5: Phase 1 - Gap Analysis & Context

### 5.1 Understanding Organizational Context (Clause 4.1)

**Objective**: Gain comprehensive understanding of internal and external factors affecting AIMS.

**External Context Analysis:**

| Factor | Questions to Ask | Examples |
|--------|------------------|----------|
| **Regulatory** | What AI regulations apply? | EU AI Act, GDPR, CCPA, sector-specific laws |
| **Market** | What are customer/partner AI expectations? | Explainability demands from BFSI clients |
| **Technology** | What AI trends impact us? | LLM advancements, open-source models |
| **Competitive** | How do competitors govern AI? | Industry benchmarks, certifications |
| **Social** | What are public concerns about AI? | Bias, privacy, job displacement fears |

**Internal Context Analysis:**

| Factor | Questions to Ask | Examples |
|--------|------------------|----------|
| **Strategy** | How does AI support business objectives? | Revenue growth, cost reduction, innovation |
| **Culture** | What is risk appetite for AI? | Conservative vs. aggressive innovation |
| **Capabilities** | What AI maturity level exists? | Ad-hoc vs. defined vs. optimized |
| **Resources** | What skills, budget, tools available? | Data science team size, infrastructure |
| **Processes** | What AI processes exist today? | Model development lifecycle, testing |

**Gap Analysis Template:**

```markdown
## Context Analysis Worksheet

### External Factors
**Regulatory Environment:**
- Current: GDPR compliance in place
- Gap: EU AI Act requirements not yet addressed
- Action: Conduct EU AI Act gap assessment by Q2 2026

**Market Expectations:**
- Current: Basic AI transparency provided
- Gap: BFSI clients demand explainable AI reports
- Action: Implement XAI tools (LIME/SHAP) by Q3 2026

### Internal Factors
**AI Governance Maturity:**
- Current: Ad-hoc AI governance, no formal policy
- Gap: No AI policy, no risk assessment process
- Action: Develop AI policy by Q1 2026, risk framework by Q2 2026
```

### 5.2 Identifying Interested Parties (Clause 4.2)

**Objective**: Identify stakeholders and understand their requirements and expectations.

**Stakeholder Mapping:**

| Stakeholder | Interest in AI | Requirements | Communication Method |
|-------------|----------------|--------------|----------------------|
| **Customers** | AI product quality, fairness | Explainability, accuracy, fairness | Product documentation, transparency reports |
| **Employees** | Job impact, skill development | Training, ethical use, job security | Internal communications, training programs |
| **Regulators** | Compliance with laws | Audit reports, incident reporting | Regulatory filings, cooperation |
| **Data Subjects** | Privacy, rights protection | Consent, transparency, appeal rights | Privacy notices, rights portals |
| **Shareholders** | ROI, risk management | Financial performance, risk mitigation | Financial reports, board updates |
| **Partners/Vendors** | Data sharing, integration | Contracts, data protection | SLAs, partnership agreements |
| **Public/Society** | Societal impact, ethics | Responsible AI, harm prevention | Public statements, ethical AI commitments |

**Template: Interested Party Register**

```markdown
| Stakeholder Group | Representative | Key Requirements | Impact on AIMS | Engagement Plan |
|-------------------|----------------|------------------|----------------|-----------------|
| Enterprise Customers | Account Managers | ISO 42001 certification, explainability | High - drives certification need | Quarterly transparency reports |
| Regulators (EDPB) | Legal team | GDPR compliance, AI Act readiness | High - legal obligation | Annual compliance audits |
| Employees | HR, Internal Comms | Ethical AI use, job impact transparency | Medium - culture and adoption | Monthly AI governance briefings |
```

### 5.3 Defining AIMS Scope (Clause 4.3)

**Objective**: Clearly define what is included/excluded in AIMS and justify boundaries.

**Scope Components:**

1. **AI Systems Covered**:
   - List specific AI systems (e.g., Smart Assist chatbot, Talent IQ screening)
   - AI lifecycle stages: development, deployment, operation, retirement

2. **Organizational Units**:
   - Departments: R&D, Product, IT Operations
   - Locations: Bangalore office, Pune office

3. **Processes**:
   - Model development and training
   - Data preparation and management
   - Deployment and release management
   - Monitoring and maintenance

4. **Exclusions with Justification**:
   - Third-party AI services used internally (separate vendor management)
   - Experimental AI in R&D sandbox (not customer-facing)

**Scope Statement Template:**

```markdown
## AIMS Scope Statement

### Inclusions
**AI Systems:**
- Smart Assist (customer service chatbot) - Production
- Talent IQ (recruitment screening) - Production
- PredictMent (predictive maintenance) - Production

**Lifecycle Stages:**
- Model development and training
- Data preparation and governance
- Deployment to production
- Ongoing monitoring and maintenance
- Model retirement and decommissioning

**Organizational Boundaries:**
- Departments: AI Development, Data Science, IT Operations, Product Management
- Locations: Bangalore HQ, Pune Development Center
- Staff: 180 employees (all AI-related roles)

### Exclusions
**Excluded Systems:**
- Microsoft Copilot (used internally) - Reason: Covered under vendor management
- R&D experimental models - Reason: Not customer-facing, separate governance

### Regulatory Context
- GDPR (EU customers)
- EU AI Act (high-risk systems)
- ISO 27001 (information security - integrated)
```

### 5.4 Conducting Gap Analysis

**Objective**: Compare current state to ISO 42001 requirements and identify gaps.

**Gap Analysis Steps:**

1. **Assess Current State**: Document existing AI governance practices
2. **Map to ISO 42001**: Review Clauses 4-10 and Annex A
3. **Identify Gaps**: Where do practices not meet standard?
4. **Prioritize**: High/Medium/Low priority based on risk and effort
5. **Action Plan**: Define remediation activities with owners and timelines

**Template: ISO 42001 Gap Assessment**

```markdown
| Clause/Control | Requirement Summary | Current Practice | Gap Identified | Priority | Action Required | Owner | Target Date |
|----------------|---------------------|------------------|----------------|----------|-----------------|-------|-------------|
| **4.3 AIMS Scope** | Documented scope statement | Informal scope | No formal scope document | High | Create scope statement | AIMS Lead | 2026-03-15 |
| **5.2 AI Policy** | Top-level AI policy | None | No AI policy exists | High | Develop and approve AI policy | Governance Lead | 2026-03-30 |
| **6.1.2 Risk Assessment** | AI risk assessment methodology | Ad-hoc | No formal process | High | Implement risk framework | Risk Manager | 2026-04-30 |
| **Annex A.6 Bias Management** | Bias testing and mitigation | Basic testing | No systematic bias audits | High | Deploy bias testing tools | Data Science Lead | 2026-05-31 |
| **7.2 Competence** | AI competency matrix | Informal | No documented competencies | Medium | Create competency matrix | HR + AIMS Lead | 2026-04-15 |
```

**Gap Analysis Report Structure:**

1. **Executive Summary**: Overall maturity level, key gaps, investment required
2. **Detailed Findings**: Gap by gap with current state and target state
3. **Risk Assessment**: Compliance risks of not addressing gaps
4. **Roadmap**: Phased implementation plan with milestones
5. **Resource Requirements**: Budget, people, tools needed

---

## Chapter 6: Phase 2 - Planning & Risk Assessment

### 6.1 Creating the Project Charter

**Objective**: Formalize AIMS implementation with executive approval and resource commitment.

**Project Charter Components:**

**1. Project Overview**
- **Project Name**: ISO 42001 AIMS Implementation
- **Sponsor**: CTO
- **Project Manager**: AIMS Governance Lead
- **Duration**: 12 months (March 2026 - February 2027)
- **Budget**: $150,000

**2. Business Case**
- **Drivers**: EU AI Act compliance, customer certification demands, risk mitigation
- **Benefits**: Market differentiation, reduced legal risk, improved AI quality
- **ROI**: Estimated 20% revenue increase from enterprise clients post-certification

**3. Scope and Objectives**
- **In Scope**: All production AI systems, 180 staff, Bangalore and Pune
- **Out of Scope**: Third-party AI services, experimental R&D models
- **Objectives**: 
  - Achieve ISO 42001 certification by Q4 2026
  - Implement AI risk management framework
  - Train 100% of AI staff on governance

**4. Stakeholders**
- **Executive Sponsor**: CTO
- **Steering Committee**: CTO, CFO, CIO, Chief Data Officer, Legal Head
- **Project Team**: AIMS Lead, Risk Manager, Data Science Lead, Compliance Officer
- **External**: Certification body auditors, AI governance consultants

**5. High-Level Timeline**
```
Q1 2026: Gap Analysis & Planning
Q2 2026: Policy Development & Risk Assessment
Q3 2026: Control Implementation & Documentation
Q4 2026: Internal Audit, Management Review, Certification Audit
```

**Template: Project Charter**

```markdown
# ISO 42001 AIMS Implementation Project Charter

## 1. Project Summary
**Project Name**: ISO 42001 AI Management System Implementation
**Start Date**: March 1, 2026
**Target Completion**: February 28, 2027
**Executive Sponsor**: Chief Technology Officer
**Project Manager**: AI Governance Lead

## 2. Business Justification
[Insert business case and ROI analysis]

## 3. Project Scope
[Insert scope statement from Clause 4.3]

## 4. Success Criteria
- [ ] ISO 42001 certification achieved
- [ ] Zero critical audit findings
- [ ] 100% staff trained and aware
- [ ] AI policy approved by board
- [ ] Risk assessment completed for all systems

## 5. Governance Structure
- **Steering Committee**: Meets monthly
- **Working Group**: Meets weekly
- **Reporting**: Monthly status reports to executive team

## 6. Budget Summary
| Category | Amount |
|----------|--------|
| Consulting | $50,000 |
| Tools & Technology | $30,000 |
| Training | $20,000 |
| Certification Audit | $25,000 |
| Contingency | $25,000 |
| **Total** | **$150,000** |

Approved by:
- CTO: _________________ Date: _______
- CFO: _________________ Date: _______
```

### 6.2 AI Risk Assessment Methodology (Clause 6.1)

**Objective**: Identify, analyze, evaluate, and treat AI-specific risks.

#### 6.2.1 Risk Assessment Framework

**Risk Criteria Setup (Clause 6.1.1):**
Based on organizational context (risk appetite, regulatory requirements), establish:

**1. Likelihood Scale (1-5):**

| Level | Score | Description | Evidence Example |
|-------|-------|-------------|------------------|
| **Rare** | 1 | Unlikely to occur in next 12 months | No historical incidents, strong controls |
| **Unlikely** | 2 | May occur once in next 12 months | 1-2 incidents in past 3 years |
| **Possible** | 3 | Could occur several times | Quarterly incidents observed |
| **Likely** | 4 | Expected to occur regularly | Monthly incidents observed |
| **Almost Certain** | 5 | Will occur frequently | Weekly/daily incidents |

**Likelihood Factors:**
- **Threat**: Potential for bias, data drift, adversarial attacks
- **Vulnerability**: Weaknesses in data, model, or controls
- **Time Horizon**: Next release cycle or 12 months

**2. Impact Scale (1-5):**

**Organizational Impact:**

| Level | Score | Financial | Reputational | Operational |
|-------|-------|-----------|--------------|-------------|
| **Insignificant** | 1 | <$10K | Local negative press | Minor disruption |
| **Minor** | 2 | $10K-$50K | Regional criticism | Service degradation |
| **Moderate** | 3 | $50K-$250K | National media | System downtime |
| **Major** | 4 | $250K-$1M | Loss of key clients | Major outage |
| **Severe** | 5 | >$1M | Brand damage | Business failure |

**Individual/Societal Impact:**

| Level | Score | Individual Harm | Societal Harm |
|-------|-------|-----------------|---------------|
| **Insignificant** | 1 | Minimal inconvenience | No measurable impact |
| **Minor** | 2 | Temporary disadvantage | Limited group affected |
| **Moderate** | 3 | Financial/opportunity loss | Community impact |
| **Major** | 4 | Significant harm (e.g., wrongful denial) | Widespread discrimination |
| **Severe** | 5 | Life-threatening harm | Systemic societal damage |

**3. Risk Level Matrix (Likelihood × Impact):**

```
         Impact →
         1    2    3    4    5
    ┌────┬────┬────┬────┬────┐
  5 │ 5  │ 10 │ 15 │ 20 │ 25 │
L   ├────┼────┼────┼────┼────┤
i 4 │ 4  │ 8  │ 12 │ 16 │ 20 │
k   ├────┼────┼────┼────┼────┤
e 3 │ 3  │ 6  │ 9  │ 12 │ 15 │
l   ├────┼────┼────┼────┼────┤
i 2 │ 2  │ 4  │ 6  │ 8  │ 10 │
h   ├────┼────┼────┼────┼────┤
o 1 │ 1  │ 2  │ 3  │ 4  │ 5  │
o   └────┴────┴────┴────┴────┘
d
```

**Risk Rating:**
- **Low** (1-4): Accept or monitor
- **Medium** (5-9): Mitigate with controls
- **High** (10-15): Treat with priority
- **Critical** (16-25): Immediate action required

#### 6.2.2 Risk Assessment Process (Clause 6.1.2)

**Step 1: Risk Identification**

**Sources (from Annex C):**
- **Data Risks**: Quality, bias, poisoning, drift
- **Model Risks**: Accuracy, robustness, explainability
- **Deployment Risks**: Integration failures, performance
- **Operational Risks**: Monitoring failures, incident response
- **Compliance Risks**: Regulatory violations
- **Ethical Risks**: Fairness, privacy, autonomy

**Techniques:**
- Brainstorming with cross-functional teams
- Historical incident analysis
- Threat modeling (STRIDE for AI)
- External research (AI incident database)
- Vendor risk assessments

**Step 2: Risk Analysis**

**For each identified risk:**

```markdown
### Risk Analysis Template

**Risk ID**: R-001
**Risk Title**: Gender Bias in Talent IQ Hiring Recommendations
**AI System**: Talent IQ (Recruitment Screening)

**Description**: 
Historical training data predominantly from male hires may cause model to favor male candidates over equally qualified female candidates.

**Threat**: 
Historical bias in training data (70% male hires in dataset)

**Vulnerability**: 
Limited dataset diversity; no systematic bias testing implemented

**Existing Controls**:
- Basic model validation testing
- Manual review of flagged high-confidence rejections

**Likelihood Assessment**:
- **Score**: 4 (Likely)
- **Justification**: Similar bias incidents occurred at other companies (Amazon 2015). Limited diversity in training data makes bias probable. No bias testing tool in place.

**Impact Assessment**:
- **Organizational Impact**: 4 (Major)
  - Financial: Potential discrimination lawsuits ($250K-$1M)
  - Reputational: Loss of employer brand, client trust
- **Individual Impact**: 4 (Major)
  - Qualified candidates wrongfully rejected
  - Career opportunity loss
  - Emotional harm from discrimination

**Risk Score**: 4 (Likelihood) × 4 (Impact) = 16 (CRITICAL)

**Risk Category**: Fairness & Bias (Annex A.6)
```

**Step 3: Risk Evaluation**

Compare risk scores against risk appetite:
- **Risk Appetite for Talent IQ**: Medium risk (scores 5-9) acceptable with controls
- **R-001 Score**: 16 (Critical) - **Exceeds risk appetite**
- **Decision**: Risk treatment required

**Step 4: Risk Treatment**

**Treatment Options:**
1. **Avoid**: Discontinue AI system or use case
2. **Modify**: Implement controls to reduce likelihood/impact
3. **Share**: Transfer risk (insurance, outsource)
4. **Retain**: Accept risk (with justification)

**Risk Treatment Plan for R-001:**

```markdown
### Risk Treatment Plan: R-001

**Risk**: Gender Bias in Talent IQ

**Treatment Strategy**: Modify (Implement Controls)

**Controls to Implement**:

1. **A.6.1 Bias Testing** (Annex A Control)
   - Deploy bias detection tools (e.g., Fairlearn, AI Fairness 360)
   - Test across protected attributes: gender, age, ethnicity
   - **Owner**: Data Science Lead
   - **Due Date**: 2026-05-31

2. **A.6.2 Dataset Diversity**
   - Expand training dataset to 50/50 gender balance
   - Include diverse demographic representation
   - **Owner**: Data Engineering Team
   - **Due Date**: 2026-04-30

3. **Human Review Requirement**
   - Mandate human recruiter review of all AI recommendations
   - Training for recruiters on bias awareness
   - **Owner**: HR Director
   - **Due Date**: 2026-03-31

4. **Monitoring & Auditing**
   - Quarterly fairness audits (demographic parity analysis)
   - Track hiring outcomes by demographics
   - **Owner**: Risk Manager
   - **Due Date**: Ongoing (start 2026-06-01)

**Residual Risk Assessment**:
- **Likelihood**: 2 (Unlikely) - Controls reduce bias occurrence
- **Impact**: 3 (Moderate) - Human review limits harm
- **Residual Risk Score**: 2 × 3 = 6 (Medium) - **Acceptable**

**Approval**: Risk Owner [Signature] ________ Date: ________
```

#### 6.2.3 Risk vs Impact Assessment

**Critical Distinction:**

| Aspect | AI Risk Assessment | AI Impact Assessment |
|--------|-------------------|----------------------|
| **Focus** | What can go wrong with the system? | Who is affected and how? |
| **Perspective** | Organizational (business risk) | Individual/Societal (human harm) |
| **Examples** | Model drift, data breach, performance failure | Discrimination, privacy violation, safety harm |
| **Output** | Risk register, treatment plans | Impact mitigation measures, rights protections |
| **Trigger** | All AI systems | High-risk AI systems (per EU AI Act) |
| **Frequency** | Aligned with risk assessment schedule | Before deployment, after major changes |

**Example:**
**AI System**: Loan Approval AI

**Risk Assessment**:
- **Risk**: Model drift due to economic changes
- **Impact (org)**: Increased default rates, financial loss
- **Treatment**: Monthly model monitoring, retraining triggers

**Impact Assessment**:
- **Impact (individual)**: Qualified borrowers wrongly denied loans
- **Harm**: Financial exclusion, opportunity loss
- **Mitigation**: Explainability, human review, appeal process

**Both Required**: Impact assessment findings must feed into risk assessment.

#### 6.2.4 When to Repeat Assessments

**Mandatory Triggers (Clause 8):**

1. **Planned Intervals**:
   - **Full Risk Assessment**: Annually
   - **Critical System Reviews**: Quarterly
   - **Impact Assessments**: Before each major release

2. **Major Changes**:
   - **Data Changes**: New data sources, significant dataset updates
   - **Model Changes**: Algorithm changes, retraining, version upgrades
   - **Deployment Changes**: New use cases, expanded user base
   - **Geographic Changes**: New jurisdictions, regulatory changes
   - **Incidents**: After security breaches, bias incidents, failures

**Example Schedule:**
```markdown
## Talent IQ Risk & Impact Assessment Schedule

**Annual Full Assessment**: January 2027
**Quarterly Reviews**: April, July, October 2026

**Change-Triggered Assessments**:
- Before adding new data source (e.g., social media profiles)
- After model retraining (threshold: >5% accuracy change)
- When expanding to new geography (e.g., EU rollout)
- Post-incident (within 48 hours of confirmed bias complaint)
```

### 6.3 Risk Register Template

```markdown
# AI Risk Register - Aspirant Technology

**Last Updated**: February 2026
**Owner**: Chief Risk Officer
**Review Frequency**: Quarterly

| Risk ID | AI System | Risk Title | Category | Inherent Risk (L×I) | Controls | Residual Risk | Status | Owner |
|---------|-----------|------------|----------|-------------------|----------|---------------|--------|-------|
| R-001 | Talent IQ | Gender Bias | Fairness | 16 (4×4) Critical | Bias testing, diverse data, human review | 6 (2×3) Medium | Open | Data Science Lead |
| R-002 | Smart Assist | PII Data Leak | Privacy | 12 (3×4) High | Data masking, access controls, encryption | 4 (2×2) Low | Closed | IT Security |
| R-003 | PredictMent | Model Drift | Performance | 9 (3×3) Medium | Monitoring, retraining triggers | 3 (1×3) Low | Open | ML Ops Team |
| R-004 | All Systems | Regulatory Non-Compliance | Compliance | 15 (3×5) High | EU AI Act assessment, GDPR controls | 5 (1×5) Medium | Open | Legal Team |

**Legend**:
- **L**: Likelihood (1-5)
- **I**: Impact (1-5)
- **Risk Levels**: Critical (16-25), High (10-15), Medium (5-9), Low (1-4)
- **Status**: Open (active), Closed (resolved), Monitoring (residual)
```

---

## Chapter 7: Phase 3 - Implementation

### 7.1 Developing the AI Policy (Clause 5.2)

**Objective**: Create foundational policy document establishing AI governance principles and commitments.

**Policy Components:**

**Template: AI Policy**

```markdown
# Artificial Intelligence Policy

**Document Owner**: Chief Technology Officer
**Approved By**: Board of Directors
**Approval Date**: March 15, 2026
**Version**: 1.0
**Review Date**: March 15, 2027

---

## 1. Purpose and Scope

This policy establishes the framework for responsible development, deployment, and use of Artificial Intelligence (AI) systems at Aspirant Technology. It applies to all employees, contractors, and third parties involved in AI activities.

**Scope**: All AI systems within the AIMS scope (Smart Assist, Talent IQ, PredictMent).

---

## 2. Policy Statement

Aspirant Technology is committed to developing and deploying AI systems that are:
- **Accountable**: Clear ownership and responsibility
- **Transparent**: Explainable and documented
- **Fair**: Free from bias and discrimination
- **Safe**: Protecting users and society
- **Innovative**: Balanced with ethical considerations

---

## 3. Guiding Principles (Aligned with ISO 42001)

### 3.1 Accountability
- Every AI system shall have a designated System Owner
- Decision-making authority clearly documented
- Incident response procedures established

### 3.2 Transparency
- AI system purposes and limitations disclosed to users
- Data sources and model logic documented
- Explainability provided for consequential decisions

### 3.3 Fairness and Non-Discrimination
- Diverse datasets used for training
- Bias testing conducted before deployment and quarterly thereafter
- Monitoring for discriminatory outcomes

### 3.4 Privacy and Security
- Personal data processed in accordance with GDPR and applicable laws
- Security controls implemented per ISO 27001
- Data minimization and purpose limitation applied

### 3.5 Human Oversight
- High-risk AI decisions subject to human review
- Human override mechanisms in place
- Competent humans supervise AI operations

### 3.6 Safety and Reliability
- Rigorous testing before deployment
- Continuous monitoring for performance and safety
- Incident response procedures defined

---

## 4. Roles and Responsibilities

**Board of Directors**: Oversees AI governance, approves policy
**Executive Sponsor (CTO)**: Accountable for AIMS implementation
**Steering Committee**: Reviews AI strategy and risks quarterly
**AIMS Governance Lead**: Manages day-to-day AIMS operations
**AI System Owners**: Responsible for specific AI systems
**All Employees**: Comply with policy, report concerns

---

## 5. AI Lifecycle Requirements

All AI systems must follow the AI Lifecycle Management Process:
1. **Planning**: Define purpose, scope, success criteria
2. **Data Preparation**: Data quality, privacy, bias assessment
3. **Model Development**: Training, validation, documentation
4. **Testing**: Functional, security, fairness, performance testing
5. **Deployment**: Controlled release, monitoring setup
6. **Operations**: Ongoing monitoring, incident response
7. **Retirement**: Secure decommissioning, data retention

---

## 6. Prohibited Uses

AI systems shall NOT be used for:
- Autonomous decisions causing significant harm without human oversight
- Processing of sensitive personal data without legal basis
- Manipulation or deception of users
- Surveillance violating privacy rights
- Discrimination based on protected characteristics

---

## 7. Compliance and Review

- This policy reviewed annually and updated as needed
- Compliance monitored through internal audits
- Violations subject to disciplinary action
- Policy communicated to all staff through training

---

## 8. Related Documents

- AI Risk Management Framework
- AI Impact Assessment Procedure
- Data Governance Policy
- Model Development Standards
- AI Incident Response Plan

---

**Approved**:
CEO: _________________ Date: _______
CTO: _________________ Date: _______
Legal: _________________ Date: _______
```

### 7.2 Statement of Applicability (SOA)

**Objective**: Document which Annex A controls apply and justify exclusions.

**SOA Creation Process:**

1. **Review All 38 Annex A Controls**: Understand each control requirement (use Annex B for guidance)
2. **Assess Applicability**: Determine if control is relevant to your AI systems and risks
3. **Document Decision**: Applicable, Not Applicable (with justification)
4. **Implementation Status**: Implemented, Partially Implemented, Not Implemented
5. **Evidence**: Reference to documentation, procedures, records

**Template: Statement of Applicability**

```markdown
# Statement of Applicability (SOA)
## ISO/IEC 42001:2023 Annex A Controls

**Organization**: Aspirant Technology
**AIMS Scope**: Smart Assist, Talent IQ, PredictMent
**Version**: 1.0
**Date**: April 15, 2026

---

| Control ID | Control Title | Applicable? | Justification | Implementation Status | Evidence | Owner |
|------------|---------------|-------------|---------------|----------------------|----------|-------|
| **A.1** | **AI System Purpose** | Yes | All systems require documented purpose | Implemented | AI System Specification docs | System Owners |
| **A.2** | **Impact Assessment** | Yes | High-risk systems (Talent IQ) require impact assessment | In Progress | Impact Assessment for Talent IQ (draft) | Risk Manager |
| **A.3** | **Data Governance** | Yes | All systems process customer data | Implemented | Data Governance Policy v2.0 | Chief Data Officer |
| **A.4** | **Data Quality** | Yes | Model accuracy depends on data quality | Implemented | Data Quality Framework, monitoring dashboards | Data Engineering |
| **A.5** | **Data Provenance** | Yes | Audit trail required for compliance | Partially Implemented | Data lineage for Talent IQ; pending for others | Data Engineering |
| **A.6** | **Bias Management** | Yes | Fairness critical for Talent IQ | In Progress | Bias testing tools deployed Q2 2026 | Data Science Lead |
| **A.7** | **Privacy** | Yes | GDPR compliance mandatory | Implemented | Privacy Policy, DPIA procedures | Privacy Officer |
| **A.8** | **Security** | Yes | Protecting AI systems and data | Implemented | ISO 27001 certified security controls | CISO |
| **A.15** | **Explainability** | Yes | BFSI clients require explanations | In Progress | XAI tools (LIME/SHAP) deploying Q3 2026 | Data Science Lead |
| **A.25** | **Human Oversight** | Yes | High-risk decisions require human review | Implemented | Human-in-Loop procedures for Talent IQ | System Owners |
| **A.32** | **AI System Retirement** | Yes | Decommissioning process needed | Not Implemented | Procedure to be developed Q4 2026 | IT Operations |
| **A.20** | **Third-Party AI** | No | Not using third-party AI models in scope | N/A - No third-party AI in current systems | N/A | N/A |

**Summary**:
- **Total Controls**: 38
- **Applicable**: 36
- **Not Applicable**: 2
- **Implemented**: 28
- **Partially Implemented**: 5
- **Not Implemented**: 3

**Controls Not Applicable**:
- A.20 Third-Party AI: All models developed in-house
- A.37 Edge AI: No edge deployment currently

**Implementation Plan for Gaps**:
- A.2 Impact Assessment: Complete by April 30, 2026
- A.5 Data Provenance: Complete by June 30, 2026
- A.6 Bias Management: Complete by May 31, 2026
- A.15 Explainability: Complete by August 31, 2026
- A.32 Retirement Procedure: Complete by November 30, 2026

---

**Approved**:
AIMS Governance Lead: _____________ Date: _______
CTO: _____________ Date: _______
```

### 7.3 AI Lifecycle Management (Clause 8)

**Objective**: Establish controlled process for AI system development and operation.

**AI Lifecycle Stages:**

#### Stage 1: Planning and Design

**Activities**:
- Define AI system purpose and scope
- Identify stakeholders and requirements
- Conduct feasibility assessment
- Initial risk and impact assessment
- Obtain project approval

**Deliverables**:
- AI System Specification
- Business Case
- Initial Risk Assessment
- Project Charter

**Example: Talent IQ Specification**
```markdown
## AI System Specification: Talent IQ

**Purpose**: Automate initial resume screening to identify qualified candidates
**Scope**: Pre-screening for technical positions (software engineers, data scientists)
**Success Criteria**: 90% accuracy in identifying qualified candidates, zero bias in protected attributes
**Stakeholders**: HR team, hiring managers, candidates
**Data Sources**: Resume database, past hiring decisions (anonymized)
**Model Type**: Supervised learning (classification)
**Deployment**: Web application integrated with ATS
**Human Oversight**: All AI recommendations reviewed by recruiter before candidate contact
```

#### Stage 2: Data Preparation

**Activities**:
- Data collection and acquisition
- Data quality assessment
- Data cleaning and preprocessing
- Bias assessment in data
- Privacy impact assessment
- Data provenance documentation

**Deliverables**:
- Data Quality Report
- Data Lineage Documentation
- Bias Assessment Report
- Data Privacy Impact Assessment (DPIA)

**Example: Data Quality Checklist**
```markdown
## Data Quality Checklist - Talent IQ

- [x] Completeness: <5% missing values in critical fields
- [x] Accuracy: Validated against source systems
- [x] Consistency: Standardized formats (dates, locations)
- [x] Timeliness: Data from last 5 years only
- [x] Validity: All records pass validation rules
- [x] Uniqueness: Deduplicated (removed 120 duplicate resumes)
- [x] Diversity: Gender balance 50/50 after augmentation
- [ ] Representativeness: Pending review of age distribution

**Issues Identified**:
- Age distribution skewed toward 25-35 range
- **Action**: Expand dataset to include 35-50 age group by April 30

**Sign-off**:
Data Engineer: _________ Date: _______
Data Science Lead: _________ Date: _______
```

#### Stage 3: Model Development

**Activities**:
- Algorithm selection and justification
- Model training and tuning
- Validation and testing (accuracy, fairness, robustness)
- Documentation of model architecture and parameters
- Version control and reproducibility

**Deliverables**:
- Model Training Report
- Model Validation Report
- Model Documentation (Model Card)
- Source Code Repository

**Example: Model Card Template**
```markdown
# Model Card: Talent IQ Resume Classifier

## Model Details
- **Model Name**: Talent IQ v2.1
- **Model Type**: Random Forest Classifier
- **Developed By**: Data Science Team, Aspirant Technology
- **Date**: March 2026
- **Version**: 2.1
- **License**: Proprietary

## Intended Use
- **Primary Use**: Pre-screening technical resumes
- **Primary Users**: HR recruiters, hiring managers
- **Out-of-Scope Uses**: Final hiring decisions (human required), non-technical roles

## Training Data
- **Datasets**: Internal resume database (2019-2024), 10,000 records
- **Preprocessing**: Anonymization, deduplication, augmentation for gender balance
- **Labeling**: Historical hiring outcomes (hired/not hired)

## Performance Metrics
- **Overall Accuracy**: 92%
- **Precision (Qualified)**: 90%
- **Recall (Qualified)**: 88%
- **F1 Score**: 89%

## Fairness Metrics
- **Demographic Parity (Gender)**: 0.98 (threshold: >0.95) ✓
- **Equal Opportunity**: 0.96 ✓
- **Tested Groups**: Gender, age (3 bins), location

## Limitations
- Trained only on technical roles
- May underperform on novel technologies not in training data
- Requires annual retraining to maintain accuracy

## Ethical Considerations
- Human review mandatory for all recommendations
- Candidates have right to explanation and appeal
- Regular bias audits conducted quarterly

**Approved By**:
Data Science Lead: _________ Date: _______
Ethics Board: _________ Date: _______
```

#### Stage 4: Testing and Validation

**Activities**:
- Functional testing
- Performance testing
- Security testing
- Fairness and bias testing
- Robustness and adversarial testing
- User acceptance testing (UAT)

**Deliverables**:
- Test Plan
- Test Cases and Results
- Bias Testing Report
- Security Test Report
- UAT Sign-off

**Example: Bias Testing Report**
```markdown
# Bias Testing Report: Talent IQ v2.1

**Test Date**: March 20, 2026
**Tester**: Fairness Testing Team
**Tool Used**: AI Fairness 360

## Test Scenarios

### Scenario 1: Gender Parity
**Method**: Demographic Parity Difference
**Result**: 0.02 (threshold: <0.05) ✓ PASS
**Interpretation**: Model recommends male and female candidates at nearly equal rates

### Scenario 2: Age Discrimination
**Groups**: 20-30, 31-40, 41-50
**Method**: Equal Opportunity Difference
**Result**: 0.03 (threshold: <0.05) ✓ PASS
**Interpretation**: Model equally identifies qualified candidates across age groups

### Scenario 3: Disparate Impact
**Groups**: Majority ethnicity vs. minority groups
**Method**: Disparate Impact Ratio
**Result**: 0.89 (threshold: >0.80) ✓ PASS
**Interpretation**: Selection rate for minority groups is 89% of majority group rate

## Findings
- **Overall Assessment**: Model meets fairness thresholds
- **Recommendations**: Continue quarterly monitoring

**Approved**:
Fairness Tester: _________ Date: _______
Data Science Lead: _________ Date: _______
Ethics Board: _________ Date: _______
```

#### Stage 5: Deployment

**Activities**:
- Production environment setup
- Monitoring and alerting configuration
- User training and documentation
- Controlled rollout (pilot, then full)
- Deployment approval

**Deliverables**:
- Deployment Plan
- Monitoring Dashboard
- User Guide
- Deployment Approval Sign-off

#### Stage 6: Operations and Monitoring

**Activities**:
- Continuous monitoring (performance, fairness, security)
- Incident management
- User feedback collection
- Periodic retraining
- Performance reviews (quarterly)

**Deliverables**:
- Monitoring Reports
- Incident Logs
- Retraining Records
- Quarterly Performance Reviews

**Example: Monitoring Dashboard Metrics**
```markdown
## Talent IQ Monitoring Dashboard

**Metrics Tracked** (Real-time):
- **Accuracy**: Current 91.5% (target: >90%)
- **Latency**: Avg 1.2s (target: <2s)
- **Uptime**: 99.8% (target: >99.5%)
- **Bias Metrics**: Gender parity 0.97, Age parity 0.96
- **Data Drift**: Drift score 0.12 (alert threshold: >0.20)
- **Incidents**: 2 this quarter (0 critical)

**Alerts Configured**:
- Accuracy drops below 88%
- Bias metric falls below 0.90
- Data drift exceeds 0.20
- Uptime drops below 99%
- Security anomalies detected
```

#### Stage 7: Retirement and Decommissioning

**Activities**:
- Retirement decision and approval
- Data retention/deletion per policy
- Model archival
- User notification
- Post-retirement review

**Deliverables**:
- Retirement Plan
- Data Deletion Certificate
- Post-Retirement Report

### 7.4 Competence and Awareness (Clause 7.2, 7.3)

**Objective**: Ensure personnel are competent and aware of AIMS requirements.

#### 7.4.1 Competence Framework

**Competence Matrix Template:**

```markdown
# AI Competence Matrix

| Role | Required Competencies | Evidence | Training Required | Assessment |
|------|----------------------|----------|-------------------|------------|
| **AI Developer** | - ML algorithms<br>- Python/TensorFlow<br>- Bias mitigation<br>- ISO 42001 awareness | - Degree in CS/related<br>- Certification (e.g., TensorFlow)<br>- 40hr AI ethics training | - ISO 42001 Foundations (8hr)<br>- Fairness in ML (16hr)<br>- Secure coding (8hr) | Annual skills assessment |
| **Data Scientist** | - Statistics<br>- Data analysis<br>- Model evaluation<br>- Fairness testing | - Degree in stats/data science<br>- Portfolio of projects<br>- Bias testing certification | - ISO 42001 Foundations (8hr)<br>- AI Fairness 360 tool (8hr) | Model validation peer review |
| **AI System Owner** | - Business understanding<br>- Risk management<br>- AI governance<br>- Regulatory knowledge | - 5+ years industry experience<br>- ISO 42001 certification<br>- Risk management training | - ISO 42001 Implementer (24hr)<br>- AI Risk Management (16hr) | Quarterly governance review |
| **AIMS Auditor** | - ISO audit standards<br>- AI systems knowledge<br>- ISO 42001 standard | - Lead Auditor certification<br>- AI governance training<br>- ISO 42001 course | - ISO 42001 Lead Auditor (40hr)<br>- AI Technical Training (16hr) | Audit quality review |

**Training Plan**:
- **Q2 2026**: All staff complete ISO 42001 Foundations (8hr online)
- **Q3 2026**: Role-specific training (16-40hr per role)
- **Q4 2026**: Competence assessments and gap remediation
- **Ongoing**: Annual refresher training, new hire onboarding
```

#### 7.4.2 Awareness Program

**Awareness Activities:**

1. **AI Governance Newsletter** (Monthly)
   - Latest policy updates
   - AI incidents and lessons learned
   - Best practices and tips
   - Regulatory updates

2. **Town Hall Briefings** (Quarterly)
   - Executive sponsor presents AIMS progress
   - Success stories and challenges
   - Q&A session

3. **Intranet Portal**
   - AIMS documentation repository
   - Training resources
   - Contact information for AIMS team
   - Incident reporting form

4. **Onboarding Program**
   - New hire AI governance orientation (2hr)
   - Role-specific training within first 30 days

**Awareness Metrics:**
- Training completion rate: Target 100%
- Quiz scores: Target >80% average
- Incident reporting: Increase in proactive reporting (positive indicator)
- Survey: Annual awareness survey, target >85% favorable

### 7.5 Documentation Requirements (Clause 7.5)

**Objective**: Maintain documented information required by ISO 42001 and for audit.

#### Mandatory Documentation (per ISO 42001)

**Tier 1: Strategic Documents**
- AIMS Scope Statement (4.3)
- AI Policy (5.2)
- Risk Assessment Methodology (6.1.1)
- AIMS Objectives (6.2)
- Statement of Applicability (6.1.3)

**Tier 2: Operational Procedures**
- AI Lifecycle Management Procedure
- Risk Assessment Procedure
- Impact Assessment Procedure
- Incident Response Procedure
- Change Management Procedure
- Competence Management Procedure
- Internal Audit Procedure
- Management Review Procedure

**Tier 3: Work Instructions and Templates**
- AI System Specification Template
- Model Card Template
- Data Quality Checklist
- Bias Testing Procedure
- Deployment Checklist

**Tier 4: Records (Evidence)**
- Risk Register
- Impact Assessments
- Training Records
- Competence Matrix
- Audit Reports
- Management Review Minutes
- Incident Reports
- Change Logs
- Model Training Records
- Test Results
- Monitoring Reports

**Document Control Requirements:**
- Unique document ID
- Version control (version history maintained)
- Approval authority and date
- Review frequency
- Access control (who can view/edit)
- Retention period

**Template: Document Control Log**

```markdown
| Doc ID | Title | Type | Owner | Version | Approval Date | Review Date | Status |
|--------|-------|------|-------|---------|---------------|-------------|--------|
| POL-001 | AI Policy | Policy | CTO | 1.0 | 2026-03-15 | 2027-03-15 | Current |
| PROC-001 | AI Lifecycle Procedure | Procedure | AIMS Lead | 2.1 | 2026-04-01 | 2026-10-01 | Current |
| TEMP-001 | Model Card Template | Template | Data Science | 1.5 | 2026-03-20 | 2027-03-20 | Current |
| REC-001 | Risk Register | Record | Risk Mgr | Live | - | Quarterly | Current |
```

---

## Chapter 8: Phase 4 - Verification & Audit

### 8.1 Monitoring and Measurement (Clause 9.1)

**Objective**: Track AIMS performance and AI system effectiveness.

**Key Performance Indicators (KPIs):**

**AIMS-Level KPIs:**
- Policy compliance rate: Target 100%
- Risk treatment plan completion: Target 100% on-time
- Training completion rate: Target 100%
- Audit findings closure rate: Target >95% within 30 days
- Incident response time: Target <24hr for critical

**AI System-Level KPIs:**
- Model accuracy: System-specific targets (e.g., Talent IQ >90%)
- Fairness metrics: Demographic parity >0.95
- Data drift detection: Alert if drift >0.20
- System uptime: Target >99.5%
- User satisfaction: Target >4/5 stars

**Monitoring Mechanisms:**
- Automated dashboards (Grafana, Power BI)
- Weekly metric reviews by system owners
- Monthly reports to steering committee
- Quarterly reports to board

### 8.2 Internal Audit (Clause 9.2)

**Objective**: Verify AIMS implementation and identify improvement areas.

**Audit Program:**

**Annual Audit Plan:**
```markdown
## 2026 Internal Audit Schedule

**Scope**: ISO 42001 AIMS (all clauses 4-10 and applicable Annex A controls)

**Audit Team**:
- Lead Auditor: Internal Audit Manager (ISO 42001 certified)
- Technical Auditor: Senior Data Scientist
- Independent Observer: External consultant (first year)

**Schedule**:
- **Q2 2026**: Clauses 4, 5, 6 (Context, Leadership, Planning)
- **Q3 2026**: Clauses 7, 8 (Support, Operations) + Annex A (sample)
- **Q4 2026**: Clauses 9, 10 (Evaluation, Improvement) + Full Annex A review
- **Pre-Certification**: Full system audit (all clauses)

**Audit Methodology**:
- Document review
- Interviews with role holders
- Observation of processes
- Evidence sampling (e.g., risk assessments, training records)
- System testing (e.g., bias testing verification)
```

**Audit Checklist Example (Clause 6.1 - Risk Assessment):**

```markdown
## Internal Audit Checklist: Clause 6.1 Risk Assessment

**Auditor**: __________  **Date**: __________  **Auditee**: Risk Manager

| # | Requirement | Conformance | Evidence | Findings |
|---|-------------|-------------|----------|----------|
| 6.1.1 | Risk criteria established and documented | ☑ Yes ☐ No ☐ Partial | Risk Assessment Methodology v1.0 | Criteria clearly defined, approved by CTO |
| 6.1.2 | Risk assessment process defined | ☑ Yes ☐ No ☐ Partial | Risk Assessment Procedure, Risk Register | Process followed for all systems |
| 6.1.2 | AI-specific risks identified | ☑ Yes ☐ No ☐ Partial | Risk Register - 15 risks identified | Covers bias, data, model, operational risks |
| 6.1.2 | Risk analysis conducted (likelihood & impact) | ☑ Yes ☐ No ☐ Partial | Risk Register with scores | All risks scored, justified |
| 6.1.2 | Risk evaluation against criteria | ☑ Yes ☐ No ☐ Partial | Risk Register - ratings assigned | Risk levels assigned: 3 Critical, 5 High, 7 Medium |
| 6.1.3 | Risk treatment plan developed | ☐ Yes ☐ No ☑ Partial | Risk Treatment Plans for Critical/High risks | **Minor Finding**: Medium risks lack documented treatment plans |
| 6.1.3 | Controls selected from Annex A | ☑ Yes ☐ No ☐ Partial | SOA cross-referenced with risk register | Controls mapped to risks |
| 6.1.3 | Residual risk assessed | ☑ Yes ☐ No ☐ Partial | Risk Register - residual scores | Residual risk within appetite |

**Summary**:
- **Conformance**: Partial (1 minor finding)
- **Strengths**: Comprehensive risk identification, clear methodology
- **Findings**: 
  - **Minor (M-001)**: Medium-level risks lack documented treatment plans. Recommend documenting "accept" or "monitor" decisions.
- **Recommendation**: Update Risk Register with treatment plans for all medium risks by June 30, 2026

**Signatures**:
Auditor: _________ Date: _______
Auditee: _________ Date: _______
```

**Audit Finding Categories:**
- **Critical**: Systemic failure, certification risk
- **Major**: Significant nonconformity, requires immediate action
- **Minor**: Isolated issue, requires correction
- **Observation**: Improvement opportunity, not a nonconformity

**Corrective Action Process:**
1. Auditee acknowledges finding
2. Root cause analysis conducted
3. Corrective action plan developed (within 10 days)
4. Action implemented
5. Evidence provided to auditor
6. Auditor verifies closure

### 8.3 Management Review (Clause 9.3)

**Objective**: Top management reviews AIMS performance and decides on improvements.

**Frequency**: Quarterly (minimum annually per standard)

**Management Review Agenda:**

```markdown
# AIMS Management Review Meeting

**Date**: June 30, 2026
**Attendees**: CTO (Chair), CFO, CIO, Chief Data Officer, Legal Head, AIMS Governance Lead, Risk Manager

---

## 1. Review of Previous Actions
- Status of action items from March 2026 review
- All 5 actions completed on time ✓

## 2. Changes in Context (Clause 9.3a)
**External**:
- EU AI Act entered into force (May 2026)
- New competitor certified to ISO 42001

**Internal**:
- Expanded to Pune office (50 new staff)
- New AI system in R&D (chatbot for sales)

**Impact**: Expanded scope requires updated risk assessment

## 3. AIMS Performance (Clause 9.3b)
**KPIs**:
- Policy compliance: 98% (target 100%) - 2 minor violations
- Training completion: 100% ✓
- Risk treatment: 95% on-time (1 delayed)

**Trends**: Improvement in all metrics vs. Q1 2026

## 4. Customer and Stakeholder Feedback (Clause 9.3c)
- 3 BFSI clients requested explainability reports (provided)
- 1 candidate complained about Talent IQ decision (reviewed, found compliant)
- Positive feedback from HR on Talent IQ efficiency

## 5. Nonconformities and Corrective Actions (Clause 9.3d)
**Internal Audit Findings**:
- 1 minor finding: Medium risks lack treatment plans (closed June 25)

**Incidents**:
- Data drift alert for PredictMent (April 2026) - Model retrained

## 6. Monitoring and Measurement Results (Clause 9.3e)
**AI System Performance**:
- Talent IQ: 92% accuracy (target 90%) ✓, bias metrics 0.97 ✓
- Smart Assist: 98% uptime ✓, customer satisfaction 4.2/5 ✓
- PredictMent: Accuracy declined to 85% (target 88%) ✗ - Action required

## 7. Adequacy of Resources (Clause 9.3f)
**Current Resources**:
- AIMS team: 3 FTE (adequate)
- Budget: $120K spent of $150K (on track)

**Gaps**:
- Need 1 additional data engineer for bias testing (Q3 2026 hire)

## 8. Effectiveness of Risk Actions (Clause 9.3g)
- R-001 (Talent IQ bias): Risk reduced from 16 to 6 ✓
- R-004 (Regulatory compliance): EU AI Act assessment in progress

## 9. Improvement Opportunities (Clause 9.3h)
- Automate bias testing in CI/CD pipeline
- Expand XAI capabilities to all systems
- Implement centralized AI model registry

## 10. Suitability, Adequacy, Effectiveness (Clause 9.3i)
**Assessment**: AIMS is suitable, adequate, and effective with minor improvements needed

---

## Decisions and Actions

| # | Decision/Action | Owner | Due Date |
|---|-----------------|-------|----------|
| 1 | Investigate PredictMent accuracy decline, retrain if needed | ML Ops Lead | July 31, 2026 |
| 2 | Hire additional data engineer | HR Director | Aug 31, 2026 |
| 3 | Update risk assessment to cover Pune office | Risk Manager | July 15, 2026 |
| 4 | Approve budget for automated bias testing tools ($15K) | CFO | Approved |
| 5 | Schedule EU AI Act gap assessment workshop | Legal + AIMS Lead | July 30, 2026 |

---

**Next Review**: September 30, 2026

**Approved**:
CTO: _____________ Date: _______
```

### 8.4 Certification Audit Preparation

**Objective**: Prepare for external certification audit and achieve ISO 42001 certification.

**Pre-Certification Checklist:**

```markdown
## ISO 42001 Certification Readiness Checklist

### Documentation Completeness
- [x] AIMS Scope Statement (Clause 4.3)
- [x] AI Policy (Clause 5.2)
- [x] Risk Assessment Methodology (Clause 6.1.1)
- [x] Risk Register (Clause 6.1.2)
- [x] Statement of Applicability (Clause 6.1.3)
- [x] AIMS Objectives (Clause 6.2)
- [x] Organizational Roles documented (Clause 5.3)
- [x] Competence Matrix (Clause 7.2)
- [x] Communication Plan (Clause 7.4)
- [x] Operational Procedures (Clause 8)
- [x] Monitoring & Measurement Plan (Clause 9.1)
- [x] Internal Audit Reports (Clause 9.2)
- [x] Management Review Minutes (Clause 9.3)

### Evidence of Implementation
- [x] Risk assessments conducted for all AI systems
- [x] Impact assessment for Talent IQ (high-risk)
- [x] Bias testing results documented
- [x] Training records for 100% of staff
- [x] Monitoring dashboards operational
- [x] Incident logs maintained
- [x] Change management records
- [x] Internal audit completed with findings closed

### Process Verification
- [x] AI lifecycle followed for all systems
- [x] Risk treatment plans implemented
- [x] Controls from SOA implemented
- [x] Monitoring processes operational
- [x] Corrective actions tracked and closed

### Interviews Preparation
- [x] Executive sponsor prepared
- [x] System owners prepared
- [x] AI developers/data scientists prepared
- [x] Support functions prepared (HR, IT, Legal)

### Systems Demonstration
- [x] Talent IQ demo prepared (bias testing, explainability)
- [x] Monitoring dashboards accessible
- [x] Documentation portal accessible
```

**Certification Audit Stages:**

**Stage 1: Documentation Review (Remote)**
- Auditor reviews AIMS documentation
- Identifies gaps or clarifications needed
- No findings issued, preparation for Stage 2

**Stage 2: On-Site/Virtual Audit (3-5 days)**
- Day 1: Opening meeting, context and leadership review
- Day 2: Planning, support, operations review
- Day 3: AI system deep-dives, evidence sampling
- Day 4: Performance evaluation, improvement review
- Day 5: Closing meeting, findings presentation

**Potential Audit Findings (be prepared for):**
- Missing evidence (e.g., training records)
- Inconsistent implementation (policy says X, practice is Y)
- Inadequate risk assessment (missing AI-specific risks)
- Lack of bias testing for high-risk systems
- Insufficient human oversight for critical decisions
- Incomplete documentation (e.g., model cards missing)

**Tips for Audit Success:**
1. Be honest and transparent with auditors
2. Provide evidence, don't just claim compliance
3. Show continuous improvement mindset
4. Demonstrate top management commitment
5. Have knowledgeable staff available for interviews
6. Walk through actual AI systems, not just documents
7. Show monitoring and measurement in action
8. Explain how AIMS integrates with business

---

## Chapter 9: Documentation Requirements

### 9.1 Document Hierarchy

**Level 1: Strategic Documents**
- AIMS Manual (optional but recommended)
- AI Policy
- AIMS Scope
- Objectives

**Level 2: Operational Procedures**
- AI Lifecycle Management
- Risk Management
- Impact Assessment
- Incident Response
- Change Management

**Level 3: Work Instructions**
- Templates
- Checklists
- Guidelines

**Level 4: Records**
- Risk Registers
- Audit Reports
- Training Records
- Monitoring Reports

### 9.2 Version Control Best Practices

- Use semantic versioning (1.0, 1.1, 2.0)
- Maintain change history
- Require approvals for major versions
- Communicate changes to stakeholders
- Archive superseded versions

### 9.3 Retention Requirements

| Document Type | Retention Period |
|---------------|------------------|
| Policies | Current + 7 years |
| Procedures | Current + 7 years |
| Risk Assessments | 7 years |
| Audit Reports | 10 years |
| Training Records | Employment + 7 years |
| Incident Reports | 10 years |
| Model Training Records | Model lifecycle + 7 years |

---

## Chapter 10: Practical Templates & Samples

### 10.1 Risk Assessment Template

```markdown
# AI Risk Assessment

**AI System**: [Name]
**Assessment Date**: [Date]
**Assessor**: [Name]
**Review Date**: [Date]

---

## 1. System Context
**Purpose**: [Describe AI system purpose]
**Users**: [Who uses the system]
**Data**: [Data sources and types]
**Model**: [Algorithm type]

## 2. Risk Identification

| Risk ID | Risk Description | Risk Category | Source |
|---------|------------------|---------------|--------|
| R-XXX | [Description] | [Bias/Data/Model/Privacy/etc.] | [How identified] |

## 3. Risk Analysis

**Risk ID**: R-XXX

**Threat**: [What could go wrong]
**Vulnerability**: [Weakness enabling threat]
**Existing Controls**: [Current mitigations]

**Likelihood Assessment**:
- Score: [1-5]
- Justification: [Why this score]

**Impact Assessment**:
- Organizational Impact Score: [1-5]
- Individual Impact Score: [1-5]
- Justification: [Why these scores]

**Inherent Risk Score**: [L × I]
**Risk Level**: [Critical/High/Medium/Low]

## 4. Risk Treatment

**Treatment Strategy**: [Avoid/Modify/Share/Retain]

**Controls to Implement**:
1. [Control name] - [Description] - Owner: [Name] - Due: [Date]
2. [Control name] - [Description] - Owner: [Name] - Due: [Date]

**Residual Risk Assessment**:
- Likelihood: [1-5]
- Impact: [1-5]
- Residual Risk Score: [L × I]
- Acceptable? [Yes/No]

## 5. Approval

Risk Owner: _________ Date: _______
Approver: _________ Date: _______
```

### 10.2 Impact Assessment Template

```markdown
# AI System Impact Assessment

**AI System**: [Name]
**Classification**: [High-Risk/Limited Risk/Low Risk]
**Assessment Date**: [Date]
**Assessor**: [Name]

---

## 1. System Description
**Purpose and Function**: [What does the system do]
**Scope of Use**: [Where and how it's used]
**Decision Authority**: [Human/AI/Hybrid]

## 2. Stakeholder Analysis

| Stakeholder Group | How Affected | Potential Harm | Mitigation |
|-------------------|--------------|----------------|------------|
| [Group] | [Description] | [Potential negative impact] | [How we address] |

## 3. Rights and Freedoms Impact

**Fundamental Rights Assessment**:

| Right | Impacted? | How? | Severity | Mitigation |
|-------|-----------|------|----------|------------|
| Privacy | Yes/No | [Description] | [High/Medium/Low] | [Measures] |
| Non-discrimination | Yes/No | [Description] | [High/Medium/Low] | [Measures] |
| Fair treatment | Yes/No | [Description] | [High/Medium/Low] | [Measures] |

## 4. Harm Assessment

**Potential Harms**:

1. **[Harm Type]**
   - Description: [What harm could occur]
   - Affected Groups: [Who]
   - Likelihood: [1-5]
   - Severity: [1-5]
   - Mitigation: [How we prevent/reduce]

## 5. Fairness and Bias Assessment

**Protected Attributes Considered**: [Gender, age, ethnicity, etc.]
**Bias Testing Conducted**: [Yes/No - describe]
**Results**: [Summary of bias testing]
**Mitigation Measures**: [How bias is addressed]

## 6. Transparency and Explainability

**Transparency Measures**:
- [What information is disclosed to users]
- [How AI role is communicated]

**Explainability**:
- [Level of explainability provided]
- [Tools used (e.g., LIME, SHAP)]

## 7. Human Oversight

**Oversight Level**: [Human-in-Loop/On-Loop/In-Command]
**Justification**: [Why this level]
**Implementation**: [How human oversight is implemented]

## 8. Accountability and Redress

**System Owner**: [Name]
**Complaint Mechanism**: [How users can challenge decisions]
**Appeal Process**: [How appeals are handled]

## 9. Overall Impact Rating

**Impact Level**: [High/Medium/Low]
**Justification**: [Summary of assessment]

**Acceptable?**: [Yes/No]
**Additional Measures Required**: [List any further actions]

## 10. Approval

Assessor: _________ Date: _______
Ethics Board: _________ Date: _______
System Owner: _________ Date: _______
```

### 10.3 Model Card Template

(Included in Chapter 7.3)

### 10.4 Incident Response Template

```markdown
# AI Incident Report

**Incident ID**: INC-YYYY-NNN
**Detection Date**: [Date]
**Reporter**: [Name]
**System Affected**: [AI System Name]

---

## 1. Incident Summary
**Type**: [Bias Incident/Privacy Breach/Performance Failure/Security Incident/Other]
**Severity**: [Critical/High/Medium/Low]
**Description**: [What happened]

## 2. Impact Assessment
**Users Affected**: [Number and description]
**Duration**: [How long incident lasted]
**Business Impact**: [Revenue, reputation, operations]
**Individual Impact**: [Harm to individuals]

## 3. Root Cause Analysis
**Immediate Cause**: [Direct trigger]
**Underlying Causes**: [Systemic issues]
**Contributing Factors**: [Other factors]

## 4. Response Actions Taken
| Action | Owner | Completion Date | Status |
|--------|-------|----------------|--------|
| [Action] | [Name] | [Date] | [Done/In Progress] |

## 5. Corrective Actions
**Short-term** (prevent recurrence):
- [Action 1]
- [Action 2]

**Long-term** (systemic improvements):
- [Action 1]
- [Action 2]

## 6. Communication
**Internal**: [Who was notified, when]
**External**: [Customers, regulators, public - what was communicated]

## 7. Lessons Learned
- [Lesson 1]
- [Lesson 2]

## 8. Follow-up
**Risk Assessment Update Required**: [Yes/No]
**Policy Update Required**: [Yes/No]
**Training Required**: [Yes/No]

## 9. Closure
**Resolution Date**: [Date]
**Closed By**: [Name]

**Approved**:
Incident Manager: _________ Date: _______
System Owner: _________ Date: _______
```

### 10.5 Training Record Template

```markdown
# Training Attendance Record

**Course**: ISO 42001 Foundations
**Date**: March 15, 2026
**Instructor**: [Name]
**Duration**: 8 hours

---

## Attendees

| Name | Role | Department | Signature | Quiz Score | Status |
|------|------|------------|-----------|------------|--------|
| [Name] | [Role] | [Dept] | ________ | 85% | Pass |
| [Name] | [Role] | [Dept] | ________ | 90% | Pass |

## Course Content
- Module 1: Introduction to AI Governance
- Module 2: ISO 42001 Structure
- Module 3: Risk Assessment
- Module 4: Roles and Responsibilities
- Module 5: Documentation Requirements

## Assessment
**Method**: Multiple-choice quiz (20 questions)
**Passing Score**: 80%
**Results**: [Summary statistics]

## Feedback
**Average Rating**: 4.5/5
**Key Comments**: [Summary]

**Instructor**: _________ Date: _______
**Training Manager**: _________ Date: _______
```

---

## Appendix A: Glossary

**AI System**: System based on machine learning or logic/knowledge-based approaches that, for explicit or implicit objectives, infers how to generate outputs (predictions, recommendations, decisions) that can influence physical or virtual environments.

**AIMS**: Artificial Intelligence Management System - Set of interrelated elements to establish policies, objectives, and processes for responsible AI.

**Bias**: Systematic error in AI system outputs favoring certain groups over others.

**Data Provenance**: Documentation of data origin, transformations, and lineage.

**Explainability**: Ability to explain how an AI system arrived at a decision.

**High-Risk AI**: AI systems posing significant risk to health, safety, fundamental rights (per EU AI Act classification).

**Impact Assessment**: Evaluation of AI system effects on individuals and society.

**Interested Party**: Person or organization that can affect, be affected by, or perceive itself to be affected by AIMS.

**Risk Assessment**: Process of identifying, analyzing, and evaluating AI-specific risks.

**Statement of Applicability (SOA)**: Document stating which Annex A controls are applicable and why.

---

## Appendix B: References

**Standards**:
- ISO/IEC 42001:2023 - AI Management System
- ISO/IEC 27001:2022 - Information Security Management
- ISO 31000:2018 - Risk Management
- ISO/IEC 38507:2022 - Governance of IT

**Regulations**:
- EU AI Act (2024)
- GDPR (General Data Protection Regulation)
- CCPA (California Consumer Privacy Act)

**Frameworks**:
- NIST AI Risk Management Framework
- OECD AI Principles
- IEEE Ethically Aligned Design

**Tools**:
- AI Fairness 360 (IBM)
- Fairlearn (Microsoft)
- LIME/SHAP (Explainability)

**Resources**:
- Video: ISO/IEC 42001 Practical AIMS Implementation (Prabh Nair)
- Video: AI Governance Simplified (Prabh Nair)

---

## Appendix C: Implementation Checklist

### Phase 1: Gap Analysis (Months 1-2)
- [ ] Understand organizational context
- [ ] Identify interested parties
- [ ] Define AIMS scope
- [ ] Conduct gap analysis
- [ ] Create project charter
- [ ] Obtain executive approval

### Phase 2: Planning (Months 2-4)
- [ ] Develop AI policy
- [ ] Establish risk assessment methodology
- [ ] Conduct risk assessments for all systems
- [ ] Conduct impact assessments for high-risk systems
- [ ] Create risk treatment plans
- [ ] Develop Statement of Applicability
- [ ] Define AIMS objectives

### Phase 3: Implementation (Months 4-9)
- [ ] Implement Annex A controls
- [ ] Develop operational procedures
- [ ] Establish AI lifecycle processes
- [ ] Deploy monitoring dashboards
- [ ] Conduct training (100% of staff)
- [ ] Document competence matrix
- [ ] Implement communication plan
- [ ] Establish incident response process

### Phase 4: Verification (Months 9-12)
- [ ] Conduct internal audits
- [ ] Hold management reviews
- [ ] Address audit findings
- [ ] Continuous monitoring
- [ ] Pre-certification readiness review
- [ ] Stage 1 certification audit
- [ ] Stage 2 certification audit
- [ ] Achieve ISO 42001 certification

### Ongoing: Continual Improvement
- [ ] Quarterly management reviews
- [ ] Annual risk assessments
- [ ] Regular bias testing
- [ ] Surveillance audits (post-certification)
- [ ] Policy and procedure reviews
- [ ] Training refreshers

---

## Appendix D: Sample Gantt Chart

```
Month |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  | 10  | 11  | 12  |
------|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
Gap Analysis      |████|████|     |     |     |     |     |     |     |     |     |     |
Project Charter   |    |████|     |     |     |     |     |     |     |     |     |     |
AI Policy         |    |    |████|     |     |     |     |     |     |     |     |     |
Risk Assessment   |    |    |████|████|     |     |     |     |     |     |     |     |
SOA Development   |    |    |    |████|     |     |     |     |     |     |     |     |
Control Impl.     |    |    |    |    |████|████|████|     |     |     |     |     |
Training          |    |    |    |    |    |████|████|     |     |     |     |     |
Documentation     |    |    |    |    |    |    |████|████|     |     |     |     |
Internal Audit    |    |    |    |    |    |    |    |    |████|     |     |     |
Mgmt Review       |    |    |    |    |    |    |    |    |████|     |     |     |
Certification     |    |    |    |    |    |    |    |    |    |████|████|████|
```

---

**END OF TRAINING GUIDE**

---

**Document Control**:
- **Version**: 1.0
- **Date**: February 10, 2026
- **Author**: AI Governance Training Team
- **Next Review**: February 2027

For questions or additional templates, contact: aims-support@aspiranttech.com