---
phase: project-api
title: API
description: API conventions, response format, and endpoint overview
---

# API

## Strategy

| Item     | Value                   |
| -------- | ----------------------- |
| Style    | REST / GraphQL / tRPC   |
| Base URL | `/api/v1`               |
| Auth     | JWT / Session / API Key |

## Response Format

```json
{
  "success": true,
  "data": {},
  "error": null,
  "meta": { "page": 1, "limit": 20, "total": 100 }
}
```

Error:

```json
{
  "success": false,
  "data": null,
  "error": { "code": "VALIDATION_ERROR", "message": "Human-readable message" }
}
```

## Authentication

- Auth flow: (login → token → refresh → logout)
- Token storage: (httpOnly cookie / localStorage / secure storage)
- Roles: (if applicable)

## Conventions

- URLs: kebab-case. JSON fields: camelCase.
- Pagination: cursor-based or offset-based
- Filtering: query params (`?status=active&sort=-created_at`)

## Endpoints

> Only shared/auth endpoints here. Feature-specific endpoints are documented in feature docs.

### Auth

| Method | Path           | Description | Auth     |
| ------ | -------------- | ----------- | -------- |
| POST   | /auth/login    | Login       | Public   |
| POST   | /auth/register | Register    | Public   |
| POST   | /auth/refresh  | Refresh     | Required |

### Resources

| Method | Path           | Description | Auth     |
| ------ | -------------- | ----------- | -------- |
| GET    | /resources     | List        | Required |
| GET    | /resources/:id | Get one     | Required |
| POST   | /resources     | Create      | Required |
| PUT    | /resources/:id | Update      | Required |
| DELETE | /resources/:id | Delete      | Required |
