# CareerCompass India

A responsive career-guidance starter for Indian students exploring options after Class 10. It includes a multi-step self-reflection assessment, transparent rule-based career matches, stream/course exploration, demo college filters and comparison, a locally saved roadmap, student resources, print-to-PDF support, and a modular Express API.

## Architecture

- **Frontend:** static HTML, CSS and vanilla ES modules/scripts. `index.html` is the homepage.
- **Recommendation engine:** transparent rule-based matching; no paid AI API is required.
- **Persistence:** `localStorage` for the frontend demo. It is not secure account storage and does not sync between devices.
- **Backend:** optional Express REST API in `backend/`, with input validation, rate limiting, Helmet and configurable CORS.
- **Data:** small career/course starter dataset and explicitly fictitious college records. No current college fees, placements or admissions are asserted as verified.

## Run the frontend

Use Node.js 18+ for the optional commands below. From the project root:

```bash
npx http-server . -p 8080 -c-1
```

Open `http://localhost:8080`. You can also use VS Code Live Server. Open the project via an HTTP server rather than `file://` for consistent navigation and scripts.

## Run the backend

```bash
cp .env.example backend/.env
npm --prefix backend install
npm --prefix backend start
```

The API defaults to `http://localhost:3000`. Health check: `GET /api/health`.

Endpoints:
- `GET /api/careers?q=technology`
- `GET /api/careers/:id`
- `POST /api/assessment/recommendations` with JSON assessment fields
- `GET /api/colleges?q=pune`
- `POST /api/colleges/compare` with `{ "ids": ["demo-tech", "demo-commerce"] }`
- `POST /api/roadmaps/generate` with `{ "career": "Software Developer" }`

The static frontend currently uses local JavaScript data and does not require this API. Configure and connect a production API explicitly before claiming server-backed features are live.

## Tests

```bash
npm --prefix backend test
```

The tests cover the rule-based recommendation service. API integration tests can be expanded before production deployment.

## AI integration

The project uses a rule-based recommendation fallback. No AI provider is called and no API key is needed. If you add an LLM provider, call it only from a server-side service, keep credentials in environment variables, send only minimum necessary student data, validate output against a schema, and keep the rule-based fallback.

## Data verification

Before using real college records, add source URLs, verification dates, record status, exact course, eligibility, fees and official admissions links. Prioritize official institution pages, government portals, exam authorities and regulators. Replace all demo college records with verified data before launch. Missing information must remain “Not verified” or “Data unavailable.” Never infer placement rates or admission probability from incomplete data.

## GitHub Pages deployment

GitHub Pages serves static files only; it does not run Express or a database.

1. Push the project to a GitHub repository.
2. In **Settings → Pages**, select the deployment branch/folder.
3. Ensure the static HTML/CSS/JS files and relative links are included.
4. The frontend works as a browser-only demo. If a backend is deployed separately, add a deliberate API base URL configuration and update frontend requests; do not put API keys in frontend code.
5. For a production API, deploy `backend/` to a Node-compatible host, set `CORS_ORIGIN` to your published frontend origin, configure HTTPS, and use managed database storage and authentication before storing student accounts.

## Privacy and child safety

The demo does not implement user accounts or server-side student profiles. It stores assessment answers and progress in browser `localStorage`, which is accessible to the browser profile and can be cleared. Do not enter sensitive personal information. Before production, complete a privacy/legal review for applicable Indian data-protection and child-safety obligations, data minimization, age-appropriate explanations, guardian involvement where legally required, retention/deletion, access controls, secure authentication and incident response.

## Limitations

- No live college/admissions database, scholarship deadlines, verified fees, placement statistics or official rankings.
- College entries are fictional demo records and visibly labelled.
- Career match scores represent preference alignment only; they are not validated aptitude results or predictions.
- No authenticated admin panel or user accounts.
- Browser-only data does not sync between devices.
- External Google Fonts and Lucide icons are optional presentation dependencies; local CSS and text remain usable if they fail.
- The assessment is self-reflection, not a psychometric test or a substitute for individualized counselling.


## Light theme and Career Buddy chatbot

- The UI uses a bright, student-friendly light theme with pastel surfaces, a local student-path SVG, icons and responsive layouts.
- The floating Career Buddy widget is available on every page. Without a backend URL it uses built-in rule-based guidance and does not require an API key.
- To connect the backend, deploy `backend/` as a Node.js service, set `CORS_ORIGIN` to your exact GitHub Pages origin, and set `window.CC_API_BASE` in `assets/js/config.js` to the backend origin (for example `https://your-service.onrender.com`, with no trailing slash).
- To enable generated AI answers, configure `OPENAI_API_KEY` and optionally `OPENAI_MODEL` in the backend host's environment settings. Never commit real credentials to GitHub. Without a key, `/api/chat` returns the guided fallback.
- The chatbot gives general guidance, not professional assessment or guaranteed admissions/career outcomes. Verify official requirements.
