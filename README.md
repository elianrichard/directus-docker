# Directus Docker Setup

## DB Setup Checklists

- [ ] Create empty db locally and restore the DB backup inside ./directus-xx-xx-db.sql file

```bash
psql -d postgres://elianrichard:password@localhost:5432/appname_db < ./directus-xx-xx-db.sql
```

- [ ] Adjust .env file with your db
- [ ] Run docker compose up

```bash
docker-compose -f compose.backend.yaml up -d
```

- [ ] Open [http://localhost:8055](http://localhost:8055) in your browser
- [ ] Run docker compose down to stop container

```bash
docker-compose -f compose.backend.yaml down
```

## Directus Setup Checklists

- [ ] Adjust Settings
- [ ] Adjust Appearance
- [ ] Adjust Data Models
- [ ] Fill all data models
- [ ] Adjust Website Read Access Policies (check for new data models)
- [ ] Regenerate Website Token & save the value
- [ ] Test api call with the new token
- [ ] Adjust Editor Email & Password
- [ ] Adjust Editor Access Policies (check for new data models)
- [ ] Adjust Flows (check for new data models)
- [ ] Activate and test the Flows
- [ ] Change App production URL in Flows, Settings, and Blog preview URL
