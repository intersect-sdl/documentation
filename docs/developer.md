---
uuid: b778ef34-1712-4b6f-b898-1814e7c883c1
title: Developer Documentation
description: "Comprehensive guide for platform engineers, backend developers, UI integrators, and data engineers working with SDL"
author: "SDL Team"
published: true
---

Welcome to the SDL developer documentation! This guide is designed for platform engineers, backend developers, UI integrators, and data engineers who are contributing to or building on the Scientific Data Layer (SDL).

## Overview

The Scientific Data Layer (SDL) is a modular, extensible platform for managing scientific data using semantic web principles. It implements a system-of-systems architecture with microservices and semantic UI components, providing linked data capabilities using standards like SSN, DCAT, and PROV.

## Architecture at a Glance

SDL follows these core principles:

- **Linked Data Platform (LDP)**: Resources are addressable and follow LDP standards
- **Microservices**: Python FastAPI-based services with independent deployment  
- **Semantic Interoperability**: RDF, JSON-LD, and standard ontologies (DCAT, SSN, DoCO)
- **Polyglot Storage**: Triple stores, object storage, SQL, and NoSQL backends
- **Modular Frontend**: Svelte/SvelteKit with semantic-aware UI components

## System Components

### Frontend Stack

**sdl-site-gen** - Documentation site generator
- SvelteKit-based static site generator
- Processes markdown documentation with RDF metadata
- Builds to static HTML for deployment

**sdl-ui** - Modular component library  
- Atomic design pattern (atoms, molecules, organisms)
- SSR-safe components with selective imports
- Tree-shakeable bundles (5KB atoms → 200KB+ full organisms)

**sdl-doc-gen** - Documentation processing
- Markdown to component transformation
- RDF metadata extraction and processing
- Content validation and linking

**sdl-bpmn** - Workflow visualization
- BPMN diagram generation and rendering
- Scientific workflow representation

### Backend Services

**Registry Service** - Service discovery and registration
- FastAPI-based microservice
- MQTT-based messaging for heartbeat monitoring
- Service lifecycle management

**Catalog Service** - Data cataloging and metadata
- DCAT-compliant catalog management
- RDF metadata storage and querying
- SPARQL endpoint access

**Repository Service** - Data repository management
- Linked Data Platform resource containers
- Version control and provenance tracking
- Multi-format data ingestion

**Storage Service** - Polyglot data storage
- MinIO object storage integration
- Blazegraph triple store management
- SQL/NoSQL database abstraction

**Workspace Service** - Collaborative workspaces
- Multi-user workspace management
- Permission and access control
- Resource organization and sharing

### Core Libraries

**intersect-sdl** - Shared SDL library
- LDP middleware and utilities
- Base service implementation framework
- RDF processing and serialization
- INTERSECT SDK integration

**sdl-rdf** - RDF utilities and vocabularies
- RDF graph manipulation
- Vocabulary definitions (DCAT, SSN, PROV)
- SPARQL query builders and helpers

## Quick Start for Developers

### Prerequisites

- **Node.js** 18+ and **pnpm** for frontend development
- **Python** 3.11+ and **uv** for backend services
- **Docker** for local development environment
- **Git** for version control

### Development Setup

1. **Clone the monorepo workspace:**
   ```bash
   git clone https://github.com/intersect-sdl/sdl-workspace
   cd sdl-workspace
   ```

2. **Frontend Development:**
   ```bash
   # Install dependencies across all frontend packages
   pnpm install
   
   # Start the documentation site
   cd sdl-site-gen
   pnpm dev  # → http://localhost:5173
   
   # Component development with Storybook
   cd ../sdl-ui  
   pnpm storybook  # → http://localhost:6006
   ```

3. **Backend Development:**
   ```bash
   cd sdl-ldp/backend
   
   # Install Python dependencies
   uv sync
   
   # Start core services
   docker-compose up -d  # Blazegraph, MinIO, MQTT
   
   # Run individual services
   cd services/registry-service
   uv run python -m src.main
   ```

### Key Development Commands

**Frontend:**
```bash
pnpm dev         # Start dev server
pnpm build       # Build for production  
pnpm lint        # ESLint + Prettier check
pnpm test:unit   # Run unit tests
pnpm storybook   # Component development
```

**Backend:**
```bash
uv run python -m pytest         # Run tests
uv run ruff check               # Linting  
uv run mypy src/                # Type checking
uv run python -m src.main      # Start service
```

## 🛠️ Development Workflows

### Frontend Component Development

1. **Create atomic components** in `sdl-ui/lib/atoms/`
2. **Compose into molecules** in `sdl-ui/lib/molecules/`  
3. **Build complex organisms** in `sdl-ui/lib/organisms/`
4. **Document in Storybook** with usage examples
5. **Test SSR compatibility** with browser checks

### Backend Service Development

1. **Extend SDLService base class** for LDP compliance
2. **Implement FastAPI routers** with OpenAPI documentation
3. **Add RDF/JSON-LD serialization** for semantic interoperability
4. **Configure INTERSECT SDK integration** for service discovery
5. **Write comprehensive tests** with pytest

### Adding New Documentation

1. **Create markdown files** in `documentation/docs/`
2. **Add RDF metadata** in frontmatter for semantic linking
3. **Process with doc-gen** for component transformation  
4. **Build with site-gen** for static deployment

## Architectural Patterns

### LDP Resource Patterns
SDL follows Linked Data Platform patterns for all resources:

```python
# Basic Container - contains other resources
GET    /catalog/               # List catalog entries
POST   /catalog/               # Create new entry
GET    /catalog/{id}           # Get specific entry  
PUT    /catalog/{id}           # Update entry
DELETE /catalog/{id}           # Delete entry
```

### RDF Data Patterns  
All resources support multiple serializations:

```http
Accept: application/ld+json    # JSON-LD
Accept: text/turtle            # Turtle
Accept: application/rdf+xml    # RDF/XML
Accept: application/json       # JSON (when available)
```

### Service Communication
Services communicate via:
- **HTTP APIs** for synchronous operations
- **MQTT messaging** for async events and heartbeats
- **SPARQL endpoints** for complex queries

## Configuration Management

### Frontend Configuration
- **Vite config** - Build and dev server settings
- **Tailwind config** - Design system and themes
- **TypeScript config** - Type checking and compilation
- **ESLint/Prettier** - Code quality and formatting

### Backend Configuration  
- **INTERSECT SDK** - Service registration and discovery
- **Environment variables** - Service-specific settings
- **Docker Compose** - Local development infrastructure
- **Pydantic models** - Configuration validation

## Testing Strategy

### Frontend Testing
- **Unit tests** with Vitest for component logic
- **Storybook tests** for visual regression
- **E2E tests** with Playwright for user journeys
- **SSR testing** to ensure server-side compatibility

### Backend Testing
- **Unit tests** with pytest for business logic
- **Integration tests** for service interactions  
- **API tests** with FastAPI test client
- **RDF validation** for semantic correctness

## Monitoring and Debugging

### Development Tools
- **Storybook** - Component documentation and testing
- **FastAPI docs** - Auto-generated API documentation  
- **SPARQL endpoints** - Query and inspect RDF data
- **Service dashboards** - Health and performance monitoring

### Debugging Workflows
- **Browser DevTools** for frontend debugging
- **FastAPI debug mode** with detailed error messages
- **RDF serialization** for semantic data inspection
- **Service logs** with structured logging (loguru)

## Contributing Guidelines

### Code Quality Standards
- **TypeScript** for all frontend code with strict mode
- **Python typing** with mypy for backend services
- **ESLint/Prettier** for consistent code formatting
- **Comprehensive tests** with good coverage

### Git Workflow
- **Feature branches** from main for all changes
- **Conventional commits** for clear change history  
- **Pull requests** with thorough reviews
- **CI/CD validation** before merge

### Documentation Requirements
- **RDF metadata** in all documentation files
- **API documentation** auto-generated from code
- **Storybook stories** for all UI components
- **README files** for each service and package

## Key Resources

### Architecture Documentation
- [Architecture Overview](/docs/architecture) - High-level system design
- [Backend Architecture](/docs/backend_architecture) - Microservices deep dive  
- [RDF Ontologies](/docs/ontologies) - Semantic vocabularies used

### API References  
- [SDL Services](/docs/sdl_services) - Service endpoint documentation
- [Entity Model](/docs/entities) - RDF class definitions
- Individual service OpenAPI docs via `/docs` endpoints

### Development Resources
- **Storybook** - Component library documentation
- **GitHub repositories** - Source code and issues
- **Community forum** - Developer discussions and Q&A

---

**Ready to contribute?** Check out our [architecture overview](/docs/architecture) to understand the system design, then dive into the [backend architecture](/docs/backend_architecture) for service implementation details.

For specific development questions, visit our community forum or open an issue on the relevant GitHub repository.