---
title: SDL Deployment Guide
uuid: c631121d-7b2a-43b9-b8a1-5ea0a524ff63
published: true
---

This guide walks you through deploying the Scientific Data Layer (SDL) using Docker Compose for local development, or Kubernetes for scalable cloud deployments.

---

## Local Development with Docker Compose

### Prerequisites

* [Docker](https://www.docker.com/products/docker-desktop)
* [Docker Compose](https://docs.docker.com/compose/install/)

### Directory Structure

```
sdl-platform/
├── services/
│   ├── catalog/
│   ├── repository/
│   ├── registry/
│   ├── storage/
│   ├── transfer/
│   └── workspace/
├── docker-compose.yml
└── .env
```

### Quickstart

```bash
git clone https://code.ornl.gov/intersect/data/acl.git
cd acl
```

Services will be available at:

* `http://localhost:8000/dms/dcs/`
* `http://localhost:8000/dms/drs/`
* `http://localhost:8000/dms/reg/`

### Environment Variables

Create a `.env` file:

```env
GRAPH_STORE_URL=http://graph:8080/blazegraph/namespace/sdl/sparql
OBJECT_STORE_URL=http://minio:9000
DEFAULT_NAMESPACE=http://example.org/ns/sdl/
JWT_SECRET=your-secret-token
```

---

## Kubernetes Deployment (Advanced)

### Requirements

* [kubectl](https://kubernetes.io/docs/tasks/tools/)
* [Helm](https://helm.sh/)
* Access to a Kubernetes cluster (e.g., GKE, EKS, Minikube)

### Structure

* Each SDL service has a Helm chart or K8s manifest in `./k8s`
* Storage volumes are configured as PersistentVolumeClaims
* Config is injected via ConfigMaps and Secrets

### Example Deployment

```bash
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/minio.yaml
kubectl apply -f k8s/blazegraph.yaml
kubectl apply -f k8s/catalog-service.yaml
```

---

## Data Stores

SDL supports multiple storage backends:

| Layer          | Options               |
| -------------- | --------------------- |
| RDF Graphs     | Blazegraph, GraphDB   |
| Binary Objects | MinIO, S3, Filesystem |
| Metadata       | PostgreSQL (planned)  |

---

## Authentication

* Token-based auth via API Gateway or service middleware
* JWT tokens must be included in request headers:

```http
Authorization: Bearer <your-token>
```

* RBAC rules defined per service or globally

---

## Health Checks

Each service exposes:

* `/health` for basic uptime check
* `/metrics` (planned) for Prometheus

---

## Troubleshooting

* Use `docker compose logs -f` to debug services
* Check RDF graph store at `/blazegraph` UI
* Verify MinIO console at `http://localhost:9001`

---

## Additional Resources

* [Blazegraph](https://github.com/blazegraph/database)
* [MinIO](https://min.io/docs/minio)
* [FastAPI](https://fastapi.tiangolo.com/)
* [Linked Data Platform](https://www.w3.org/TR/ldp/)

---

> This guide assumes a modular, service-oriented deployment of SDL. You may adapt the structure to suit monorepo or cloud-native requirements.
