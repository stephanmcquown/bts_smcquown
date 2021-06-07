# W Ron Rob About Percona

## RAQs 

- They need to full data environ, I assume this means server and DB permissions at an elevated level

## Svcs 

- $13,110 approx 40 hrs work @ $327 / hr
  - Full health analysis of the production system w recommendations for improvements in
    - Hardware
    - Operating system
    - Server level metrics
    - MySQL configuration
    - MySQL metrics
    - Database schema design
    - Top queries running in the system
  - Architectural analysis of system  w recommendations for
    - Replication
    - Archiving
    - Backup and Restores
    - Disaster Recovery
    - 8.0 upgrade considerations
  - Will provide a detailed report with all recommendations from evaluation

## Support

- $10,000 @ x? / hr
- Up to 10 contacts ?
- See pg 11 of PDF (could not easily copy-paste)

## <mark> Turn-Key Migration from 5.x to 8.x </mark>  Svcs and support is too much.  REALLY NEED UPGRADE, what can you do?  After demonstrated upgrade, then we can discuss support

- $25,000 approx 80 hrs work @ $312 / hr

## FAB of Percona Software

  - Most Pertinent
    - PAM Authentication Plugin (basically integrate with AD)
    - Improved MEMORY Storage Engine
    - INFORMATION_SCHEMA More Tables
    - Per-Column Compression for VARCHAR/BLOB and JSON
    - InnoDB Full-Text Search Improvements
    - Extra Hash/Digest Functions; think these are to compare objects
    - Extended SHOW GRANTS
    - Ability to Kill Idle Transactions
  - Less Pertinent
    - Per-Table Performance Counters
    - Per-Table Performance Counters
    - Per-Index Performance Counters
    - Per-User Performance Counters
    - Per-Client Performance Counters
    - Per-Thread Performance Counters
    - Global Query Response Time Statistics
    - Enhanced SHOW INNODB ENGINE STATUS
    - Undo Segment Information
    - Temporary Tables Information
    - Extended Slow Query Logging
    - User Statistics
    - Audit Logging Plugin
    - Encrypt Binary Logs
    - Encrypt Temporary Files
    - Key Rotation with Scrubbing
    - Enforce Encryption
    - Changed Page Tracking
    - Backup Locks
    - Improved Scalability By Splitting Mutexes
    - Improved Flushing
    - Parallel Doublewrite Buffer
    - Configurable Fast Index Creation
    - Compressed Columns with Dictionaries
    - Improved Handling of Corrupted Tables
    - Improvements to START TRANSACTION WITH CONSISTENT SNAPSHOT

<hr>

# W Percona

- Intros
- Do we have support contract w?
- What is FAB of Percona?
- Is still free vs Oracle Enterprise version
  - Has "Enterprise Features" that would not get in Community MySQL
    - They DO OFFER support vs Community
    - AD integration
    - Replication (load balancing, etc)
    - Backup solutions FASTER BETTER than SQLDump
- They provide
  - Consulting
  - Training
  - Support
    - Essentials
    - Advanced
    - Premium (includes version updgrades)
  - Managed Svcs
- Maybe sign up for a health audit ?
- Maybe architecture consultation ?
- <mark><strong> Next steps: </strong></mark> 
  - Conversation w Barret and get scope of work on Thursday 10/1
  - Rob & SLM: Get hardware and software specs for MySQL servers
    - NODMYSQL9901
      - MySQL: v 5.5.52 MySQL Community Server (GPL)
      - Schemas (DBs): 15
      - Size (total): 130 GB
      - OS: Linux
      - Machine: x86_64
    - NODRHELBIAZ
      - MySQL: v 5.7.31-34-log | Percona Server (GPL), Release 34, Revision 2e68637
      - Schemas (DBs): 20      	
      - Size (total): 555 GB
      - OS: Linux
      - Machine: x86_64
  - Datetime of flash crash: 9/9/2020 @ 12:30 PM - 13:00 PM NODMYSQL9901 probably NOD_PM was source of problem