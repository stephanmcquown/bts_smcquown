# Pentaho Version Migration Requirements

## Spoon

- Repository objects (.kjb, .ktr)
  - Typical load and save times should be <= 8 seconds  
- Local .bat should load < 2 minutes

## DI

- Logging
  - Daily job and transformation logs
  - Cannot have log table deadlocks for (this happens all the time)
  - Address obscure error messages  
  
## Install

- NOD will provide whatever host (Linux, Windows) configuration is recommended
- Pentaho will perform migration soup to nuts
  - Set up of DI server
  - Migration of 7.1 jobs
  - Automatic purge of old logs > 30 days (both DI and Tomcat / Pentaho-server logs)
  - Other automatic maintenance related to operation of DI server (cache)
  - Testing of DI server
- IF file system based repository for development, need easy ability to import into "Pentaho Repository"