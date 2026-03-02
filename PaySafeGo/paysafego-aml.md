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

- Primary laws: Anti-Money Laundering and Counter-Terrorism Financing Act and Rules administered by AUSTRAC.[web:1][web:58]
- Obligations: risk-based AML/CTF program, customer identification and verification, ongoing monitoring, and reporting (SMRs, TTRs, IFTIs), plus record-keeping and independent reviews.[web:1][web:28][web:57]

---

## Design Objectives

- Maximise straight-through processing (STP) with explainable decisioning and minimal manual steps.
- Maintain clear human accountability where law or risk justifies it (e.g., SMR approval, EDD decisions, program oversight).[web:28][web:57]
- Embed privacy by design, least privilege, and robust audit trails for all automated decisions.[web:55]

---

## High-Level Architecture

- Onboarding & CDD: identity proofing, risk assessment, and customer profiling.
- Transaction Monitoring: real-time and near-real-time rules and ML-based monitoring, sanctions/PEP/adverse media screening.[web:23][web:38]
- Reporting & Records: automated report generation, AUSTRAC submissions where possible, immutable logging, and evidence store.[web:4][web:28]
- Governance: policy engine, model oversight, compliance dashboards, and independent review support.[web:57]

---

## End-to-End Flowchart

```mermaid
flowchart TD
  subgraph Onboarding
    A[User sign-up\n(device, IP, geo)] --> B[Risk engine\n(location, device, velocity, channel)]
    B -->|Low/medium risk| C[Automated KYC via\nIDV/DVS APIs]
    B -->|High risk| D[Enhanced due diligence\nworkflow]
    C --> E[Customer profile created\n+ base risk rating]
    D --> E
  end

  subgraph Transactions
    E --> F[Payment / gaming\ntransaction request]
    F --> G[Pre-tx checks:\nsanctions, PEP, watchlists]
    G --> H[Behavioural monitoring:\nscenarios + ML models]
    H --> I{Alert raised?}
    I -->|No| J[Auto-approve, execute,\nlog to ledger]
    I -->|Yes| K[Case created in\ncase management]
  end

  subgraph Reporting
    K --> L[Investigator review &\nSMR/TTR recommendation]
    L --> M[Compliance officer\napproval & AUSTRAC filing]
    J --> N[Regulatory logs &\nanalytics lake]
    M --> N
  end
```

---

## Onboarding / CDD Flow

```mermaid
flowchart LR
  S[Start: new user] --> C1[Collect identity data\n(name, DOB, address, email, phone)]
  C1 --> C2[Collect device + IP + geo + channel]
  C2 --> R1[Initial risk score\n(rules + ML model)]
  R1 -->|Low risk| P1[Simplified/standard CDD\nvia IDV/DVS]
  R1 -->|Medium risk| P2[Standard CDD + extra\nsource checks]
  R1 -->|High risk| P3[EDD: source of funds/wealth,\nmanual review queue]
  P1 --> V1{ID verified?}
  P2 --> V1
  P3 --> V2{EDD outcome?}
  V1 -->|Yes| O1[Customer onboarded\nwith risk rating]
  V1 -->|No| X1[Auto-reject /\nrequest re-submission]
  V2 -->|Approve| O1
  V2 -->|Reject| X2[Reject and blacklist]
```

---

## Transaction Monitoring Flow

```mermaid
flowchart TD
  T0[Transaction initiated] --> T1[Context enrichment\n(customer risk, device, merchant, game type)]
  T1 --> T2[Screening:\nsanctions, PEP, adverse media]
  T2 --> T3[Rules engine:\nscenarios, thresholds, velocity]
  T3 --> T4[ML anomaly detection\n(suspicious patterns)]
  T4 --> T5[Risk score aggregation\n(weighted rules + ML)]
  T5 --> D1{Risk band}
  D1 -->|Low| A1[Auto-approve, log]
  D1 -->|Medium| A2[Approve but mark for\nperiodic review]
  D1 -->|High| A3[Generate case & alert\nfor human review]
  A3 --> C1[Investigator triage]
  C1 --> C2{Suspicious?}
  C2 -->|No| C3[Close case, feed back into\nmodel training]
  C2 -->|Yes| C4[SMR draft created\nwith evidence bundle]
```

---

## Reporting & Record-Keeping Flow

```mermaid
flowchart LR
  R0[High-risk alert or scenario\n(e.g., cash > threshold)] --> R1[Classify event\n(SMR, TTR, IFTI, other)]
  R1 --> R2[Auto-populate report fields\nfrom case and transaction data]
  R2 --> R3[Pre-submission validation\n(schema, completeness checks)]
  R3 --> H1[Compliance officer\nreview and sign-off]
  H1 -->|Approve| R4[Submit to AUSTRAC API\n(or web portal integration)]
  H1 -->|Reject / amend| R5[Return for investigator\nrework]
  R4 --> R6[Store submission receipt,\nfull audit trail, and evidence]
```

---

## Automation Boundaries

- Fully automatable: identity data capture, risk scoring, sanctions/PEP screening, rules/ML monitoring, report drafting, data retention, and analytics.[web:19][web:23][web:31]
- Requires human oversight: SMR content and submission decisions, EDD outcomes, changes to risk appetite, and independent reviews of the AML/CTF program.[web:28][web:57][web:48]

---

## Onboarding Automation Components

- Identity Verification: integrate with Australian DVS or commercial IDV providers (document and biometric checks, liveness, fraud signals).[web:21][web:27]
- Risk Engine: rules + ML combining identity, device, geo, channel, and behavioural features to assign initial risk bands.
- KYC/KYB Data Sources: company registries, credit header data, and watchlists for business customers where applicable.[web:33]

---

## Transaction Monitoring Components

- Scenario Library: structuring, smurfing, rapid in/out, chip-cashing, and bonus abuse scenarios tailored to gaming payments.[web:38][web:50]
- ML Layer: anomaly detection, peer-group analysis, and network analytics to uncover complex laundering patterns.[web:16][web:26]
- Feedback Loop: investigator dispositions feed model re-training and rule tuning to continuously reduce false positives.[web:23]

---

## Reporting Automation Components

- Rule-Based Triggers: thresholds (e.g., high-value cash), unusual activity, and jurisdiction-specific rules mapping to SMR/TTR/IFTI logic.[web:28][web:41]
- AUSTRAC Integration: API or secure upload to generate and submit reports with validation and acknowledgments.
- Evidence Bundling: automatically attach transactions, KYC data, notes, and model explanations to each report for auditability.

---

## Governance & Oversight

- AML/CTF Compliance Officer: accountable for program design, effectiveness, and regulatory engagement.[web:45]
- Independent Review: periodic external review of AML/CTF program, models, and data quality as required by AUSTRAC.[web:57][web:48]
- Model Risk Management: validation, back-testing, documentation, and change control for all rules and ML models.[web:16][web:26]

---

## Implementation Roadmap (12–18 Months)

1. Foundation (Months 0–3): regulatory requirements analysis, data model, and initial risk taxonomy.[web:1][web:13]
2. MVP (Months 3–6): core onboarding, sanctions screening, basic rules engine, and manual reporting with auto-drafted SMRs/TTRs.
3. Scale (Months 6–12): ML-based monitoring, AUSTRAC integration, dashboards, and case management tuning.[web:19][web:31]
4. Optimisation (Months 12–18): model refinement, advanced gaming typologies, and preparing for independent review.

---

## Key Dark-Theme Presentation Notes

- This markdown is structured for Marp-style dark-theme slides (dark background, light text).
- GitHub will show it as regular markdown; you can render slides using Marp CLI or VS Code extension while preserving the dark theme.
