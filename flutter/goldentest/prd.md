# PRD: TaskFlow — AI-Powered Task Management

## Overview
TaskFlow is a task management platform designed for distributed remote teams of 5-50 people. It integrates with Slack for seamless task creation and uses AI to automatically prioritize work based on urgency, impact, dependencies, and team capacity.

**Target launch:** Q2 2026 (MVP in 4 weeks)
**Target users:** Remote team leads and individual contributors
**North star metric:** Tasks completed on-time per team per week

## Problem Statement
Remote teams waste 5+ hours per week on manual task triage. Existing tools require constant manual prioritization — leading to critical tasks falling through the cracks across timezones. When a team lead in NYC creates a high-priority task at 5pm, the developer in Berlin doesn't see it until morning, and by then priorities have shifted again.

**Why now:** Remote-first teams grew 340% since 2020. AI can now understand task context well enough to automate priority scoring that previously required a human PM.

## Target Users

### Primary: Remote Team Leads
- Managing 5-15 direct reports across 2+ timezones
- Spends 6+ hours/week triaging, re-prioritizing, and following up
- Currently uses Linear or Asana but manually sorts priorities daily
- Willing to pay $12-20/seat/month for time savings

### Secondary: Individual Contributors
- Juggling 3+ concurrent projects with competing deadlines
- Loses context switching between Slack threads and task boards
- Wants a single view of "what should I work on right now?"

## Goals & Success Metrics

| Metric | Target (Month 1) | Target (Month 6) |
|--------|------------------|------------------|
| Weekly active teams | 50 | 500 |
| Tasks created via Slack | 30% of all tasks | 60% |
| On-time task completion | +15% vs baseline | +30% |
| Daily digest open rate | 50% | 65% |
| NPS | 30+ | 50+ |

## User Stories

1. As a team lead, I want to see all my team's tasks sorted by AI-computed priority so I don't manually triage every morning
2. As a developer, I want to create tasks from Slack threads so I don't lose context switching to a separate tool
3. As a team lead, I want a daily AI-generated digest in Slack DM showing each person's top 3 priorities
4. As a contributor, I want to type "Schedule design review with Sarah Friday" and have it create a properly tagged task
5. As a team lead, I want to see dependency chains so I know which blocked tasks to escalate
6. As a contributor, I want AI to explain WHY a task is high priority so I trust the ranking
7. As a team lead, I want weekly velocity reports per team member without manual tracking
8. As a contributor, I want to snooze a task with "remind me after standup" and have it reappear

## Functional Requirements

### P0 — Must Have (MVP)
1. Task CRUD with natural language input — parse "Fix auth bug for Sarah by Friday" into structured task
2. AI priority scoring: composite of urgency (deadline proximity) × impact (stakeholder weight) × dependency chain depth
3. Slack integration — create tasks from thread replies using ⚡ emoji reaction or /task command
4. Daily digest — AI-generated summary sent to each team member's Slack DM at 9am local time
5. Team dashboard — priority-sorted kanban with filters by assignee, project, and priority tier
6. Due date tracking with automated Slack reminders at 24h and 2h before deadline

### P1 — Should Have
7. Dependency visualization — DAG view showing task blocking relationships
8. Calendar sync (Google Calendar) — auto-block focus time for high-priority deep work
9. Recurring task templates with smart scheduling (avoid Mondays for weekly reviews)
10. Priority override — team lead can pin/boost tasks, AI learns from overrides

### P2 — Nice to Have
11. Resource allocation heatmap — see who's overloaded at a glance
12. Sprint planning assistant — AI suggests sprint scope based on velocity history
13. Time estimation with accuracy tracking — AI predicts completion time, improves over time

## Non-Functional Requirements
- **Performance:** Dashboard loads in <800ms on 3G. Task creation responds in <200ms.
- **Scalability:** Support 10,000 concurrent users. Slack webhook processing within 500ms.
- **Security:** SOC 2 Type II compliance by Month 6. All data encrypted at rest (AES-256) and in transit (TLS 1.3).
- **Availability:** 99.9% uptime SLA. Graceful degradation if AI service is down (fall back to manual priority).
- **Accessibility:** WCAG 2.1 AA compliance. Full keyboard navigation. Screen reader support.

## Technical Considerations

### Recommended Stack
- **Frontend:** Next.js 14 (App Router) + Tailwind CSS + shadcn/ui
- **Backend:** Next.js API Routes + tRPC for type-safe API layer
- **Database:** Supabase (Postgres + Auth + Realtime subscriptions)
- **AI:** Claude API for task parsing, priority scoring, and digest generation
- **Integrations:** Slack API (Events API + Web API + Socket Mode)
- **Queue:** Inngest for background jobs (digest generation, Slack sync)
- **Hosting:** Vercel (frontend) + Supabase (backend/db)

### Database Schema (Core Tables)
- teams (id, name, slack_workspace_id, created_at)
- users (id, email, name, team_id, slack_user_id, timezone, role)
- tasks (id, title, description, assignee_id, creator_id, team_id, priority_score, status, due_date, created_from, parent_task_id)
- priority_logs (id, task_id, score, factors_json, computed_at)
- integrations (id, team_id, provider, access_token, config_json)

### API Endpoints
- POST /api/tasks — Create task (accepts natural language or structured)
- PATCH /api/tasks/:id — Update task status, assignment, priority override
- GET /api/tasks?team_id=&sort=priority — List tasks with AI-sorted priority
- POST /api/slack/events — Slack event webhook (task creation, reactions)
- GET /api/digest/:user_id — Generate daily priority digest
- GET /api/analytics/velocity — Team velocity metrics

## UI/UX Requirements

### Key Screens
1. **Dashboard** — Priority-sorted kanban (To Do / In Progress / Done) with team member avatars
2. **Task Detail** — Full task view with priority explanation, dependencies, activity timeline
3. **Digest View** — Daily summary showing today's priorities, blockers, and suggested focus blocks
4. **Settings** — Team management, Slack connection, notification preferences

### Design Principles
- Information density over whitespace — this is a productivity tool, not a marketing page
- Priority is always visible — color-coded P0 (red), P1 (amber), P2 (blue) badges
- Keyboard-first — Cmd+K for quick task creation, arrow keys for navigation
- Dark mode by default — this audience lives in terminals

## Out of Scope (v1)
- Mobile native app (web responsive is sufficient for MVP)
- GitHub/GitLab integration (v2)
- Custom workflow stages beyond To Do / In Progress / Done
- Multi-team workspaces (single team per account in v1)
- Offline mode
- Video/audio features

## Timeline & Milestones

### Phase 1: Core (Weeks 1-2)
- Database schema + auth (Supabase)
- Task CRUD + natural language parser (Claude API)
- AI priority scoring engine
- Basic dashboard UI

### Phase 2: Slack (Week 3)
- Slack OAuth + workspace connection
- Task creation from Slack threads
- Daily digest generation + delivery
- Slack notification preferences

### Phase 3: Polish (Week 4)
- Dependency tracking + visualization
- Priority override + AI learning
- Onboarding flow
- Error handling, loading states, edge cases
- Performance optimization + testing

## Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|-----------|
| AI priority scoring feels inaccurate | Users lose trust, stop using | Allow manual overrides, show reasoning, train on override feedback |
| Slack API rate limits during peak hours | Task creation delays | Queue-based processing with Inngest, batch digest delivery |
| Supabase Realtime limits at scale | Dashboard feels stale | Implement polling fallback, upgrade plan at 500+ users |
| Low daily digest engagement | Core value prop underdelivered | A/B test digest formats, add "reply to reprioritize" feature |

## Open Questions
1. Should AI priority scoring be transparent (show factors) or opaque (just show the score)?
2. What's the right digest frequency — daily, or should we offer real-time priority change alerts?
3. How do we handle priority conflicts when two team leads override the same task?
4. Should free tier include Slack integration or gate it behind paid?
