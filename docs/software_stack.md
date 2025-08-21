---
id: 072274ab-812e-40f5-9df8-cb3171794a5f
title: SDL Prototype Software Stack
date: 
published: false
---

## Notes about the software stack

The stack consists of the following components:

- NGINX
- postgresql
- keycloak
- blazegraph
- open policy agent ([opa](https://www.openpolicyagent.org))
- web console (ui)
- backends for the DMS services
  - Repository Service
  - Storage Service
  - Catalog Service
  - Data Transport Service

NGINX  
Serves as api gateway and web server for the frontend.

postgresql  
Serves as the (R)DMS.

keycloak  
Serves as authentication service

blazegraph  
Serves as the PDF Graph database

open policy agent  
to decouple policy from application logic
