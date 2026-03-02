---
marp: true
theme: default
paginate: true
backgroundColor: "#050816"
color: "#f5f5f5"
---

# PaySafeGo AML/CTF Automation

Australian AML/CTF automation architecture for PaySafeGo's Australian launch (gaming and payments).

---

## Regulatory Context (AU)

- **Primary laws**: Anti-Money Laundering and Counter-Terrorism Financing Act 2006 and AML/CTF Rules administered by AUSTRAC.
- **Core Obligations**: Risk-based AML/CTF program, customer identification and verification, ongoing transaction monitoring, and mandatory reporting (SMRs, TTRs, IFTIs), plus 7-year record-keeping and independent program reviews.
- **Reporting Timeframes**:
  - Suspicious Matter Reports (SMRs) for terrorism financing: within **24 hours**
  - SMRs for other suspicions (ML, fraud, etc.): within **3 business days**
  - Threshold Transaction Reports (TTRs): within **10 business days**
  - International Funds Transfer Instructions (IFTIs): within **10 business days**
- **TTR Threshold**: A$10,000 or more in physical cash (or foreign currency equivalent).
- **Compliance Deadlines**: Existing entities March 31, 2026; Tranche 2 professionals July 1, 2026.

---

## Design Objectives

- Maximise straight-through processing (STP) with explainable decisioning and minimal manual steps.
- Maintain clear human accountability where law or risk justifies it (e.g., SMR approval, EDD decisions, program oversight).
- Embed privacy by design, least privilege, and robust audit trails for all automated decisions.

---

## High-Level Architecture

- **Onboarding and CDD**: Identity proofing, risk assessment, and customer profiling.
- **Transaction Monitoring**: Real-time and near-real-time rules and ML-based monitoring, sanctions/PEP/adverse media screening.
- **Reporting and Records**: Automated report generation, AUSTRAC submissions, immutable logging, and evidence store.
- **Governance**: Policy engine, model oversight, compliance dashboards, and independent review support.

---

## End-to-End Flowchart

```mermaid
flowchart TD
  subgraph Onboarding
    A["User sign-up<br/>(device, IP, geo)"] --> B["Risk engine<br/>(location, device, velocity, channel)"]
    B -->|Low/medium risk| C["Automated KYC via<br/>IDV/DVS APIs"]
    B -->|High risk| D["Enhanced due diligence<br/>workflow"]
    C --> E["Customer profile created<br/>+ base risk rating"]
    D --> E
  end

  subgraph Transactions
    E --> F["Payment / gaming<br/>transaction request"]
    F --> G["Pre-tx checks:<br/>sanctions, PEP, watchlists"]
    G --> H["Behavioural monitoring:<br/>scenarios + ML models"]
    H --> I{Alert raised?}
    I -->|No| J["Auto-approve, execute,<br/>log to ledger"]
    I -->|Yes| K["Case created in<br/>case management"]
  end

  subgraph Reporting
    K --> L["Investigator review<br/>SMR/TTR recommendation"]
    L --> M["Compliance officer<br/>approval and AUSTRAC filing"]
    J --> N["Regulatory logs<br/>analytics lake"]
    M --> N
  end
```

---

## Onboarding and CDD Flow

```mermaid
flowchart LR
  S["Start: new user"] --> C1["Collect identity data<br/>(name, DOB, address, email, phone)"]
  C1 --> C2["Collect device, IP, geo, channel"]
  C2 --> R1["Initial risk score<br/>(rules + ML model)"]
  R1 -->|Low risk| P1["Simplified/standard CDD<br/>via IDV/DVS"]
  R1 -->|Medium risk| P2["Standard CDD + extra<br/>source checks"]
  R1 -->|High risk| P3["EDD: source of funds/wealth,<br/>manual review queue"]
  P1 --> V1{ID verified?}
  P2 --> V1
  P3 --> V2{EDD outcome?}
  V1 -->|Yes| O1["Customer onboarded<br/>with risk rating"]
  V1 -->|No| X1["Auto-reject or<br/>request re-submission"]
  V2 -->|Approve| O1
  V2 -->|Reject| X2["Reject and blacklist"]
```

---

## Transaction Monitoring Flow

```mermaid
flowchart TD
  T0["Transaction initiated"] --> T1["Context enrichment<br/>(customer risk, device, merchant, game type)"]
  T1 --> T2["Screening:<br/>sanctions, PEP, adverse media"]
  T2 --> T3["Rules engine:<br/>scenarios, thresholds, velocity"]
  T3 --> T4["ML anomaly detection<br/>(suspicious patterns)"]
  T4 --> T5["Risk score aggregation<br/>(weighted rules + ML)"]
  T5 --> D1{Risk band}
  D1 -->|Low| A1["Auto-approve, log"]
  D1 -->|Medium| A2["Approve but mark for<br/>periodic review"]
  D1 -->|High| A3["Generate case and alert<br/>for human review"]
  A3 --> C1["Investigator triage"]
  C1 --> C2{Suspicious?}
  C2 -->|No| C3["Close case, feed back into<br/>model training"]
  C2 -->|Yes| C4["SMR draft created<br/>with evidence bundle"]
```

---

## Reporting and Record-Keeping Flow

```mermaid
flowchart LR
  R0["High-risk alert or scenario<br/>(e.g., cash ≥ A10,000)"] --> R1["Classify event<br/>(SMR, TTR, IFTI, other)"]
  R1 --> R2["Auto-populate report fields<br/>from case and transaction data"]
  R2 --> R3["Pre-submission validation<br/>(schema, completeness checks)"]
  R3 --> H1["Compliance officer<br/>review and sign-off"]
  H1 -->|Approve| R4["Submit to AUSTRAC API<br/>(or web portal integration)"]
  H1 -->|Reject or amend| R5["Return for investigator<br/>rework"]
  R4 --> R6["Store submission receipt,<br/>full audit trail, and evidence"]
```

---

## Automation Boundaries

- **Fully automatable**: Identity data capture, risk scoring, sanctions/PEP screening, rules/ML monitoring, report drafting, data retention, and analytics.
- **Requires human oversight**: SMR content and submission decisions, EDD outcomes, changes to risk appetite, and independent reviews of the AML/CTF program per AUSTRAC requirements.

---

## Onboarding Automation Components

- **Identity Verification**: Integrate with Australian DVS (Document Verification Service) or commercial IDV providers (document and biometric checks, liveness detection, fraud signals).
- **Risk Engine**: Rules plus ML combining identity, device, geolocation, channel, and behavioural features to assign initial risk bands.
- **KYC/KYB Data Sources**: Company registries, credit header data, and watchlists for business customers where applicable.

---

## Transaction Monitoring Components

- **Scenario Library**: Structuring, smurfing, rapid in/out, chip-cashing, and bonus abuse scenarios tailored to gaming and payment transaction patterns.
- **ML Layer**: Anomaly detection, peer-group analysis, and network analytics to uncover complex laundering patterns.
- **Feedback Loop**: Investigator dispositions feed model re-training and rule tuning to continuously reduce false positives and improve detection accuracy.

---

## Reporting Automation Components

- **Rule-Based Triggers**: 
  - TTR triggers: Cash transactions ≥ A$10,000
  - IFTI triggers: All international funds transfers (any amount)
  - SMR triggers: Suspicion of money laundering, terrorism financing, or other criminal activity
- **AUSTRAC Integration**: API or secure upload to generate and submit reports with validation and acknowledgments.
- **Evidence Bundling**: Automatically attach transactions, KYC data, investigator notes, and model explanations to each report for full auditability.

---

## Governance and Oversight

- **AML/CTF Compliance Officer**: Accountable for program design, effectiveness, and regulatory engagement with AUSTRAC.
- **Independent Review**: Periodic external review of AML/CTF program, models, and data quality as required by AUSTRAC regulations.
- **Model Risk Management**: Validation, back-testing, documentation, and change control for all rules and ML models per AML/CTF Rules 2025.

---

## Implementation Roadmap (12–18 Months)

1. **Foundation (Months 0–3)**: Regulatory requirements analysis, data model design, initial risk taxonomy, and compliance readiness assessment.
2. **MVP (Months 3–6)**: Core onboarding automation, sanctions/PEP screening, basic rules engine, and manual reporting with auto-drafted SMR/TTR templates.
3. **Scale (Months 6–12)**: ML-based transaction monitoring, AUSTRAC API integration, compliance dashboards, and case management system tuning.
4. **Optimisation (Months 12–18)**: Model refinement, advanced gaming transaction typologies, and preparing for independent program review.

---

## Key Notes

- This markdown is structured for Marp-style dark-theme slides (dark background, light text).
- GitHub renders it as standard markdown; you can render slides using Marp CLI or VS Code extension while preserving the dark theme.
- All regulatory references reflect AUSTRAC AML/CTF Rules 2025 and compliance deadlines effective 2026.