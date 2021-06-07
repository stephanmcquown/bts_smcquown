# Versioning Process

- Users have code base on network or local file system
- All significant work is pushed to Git based version control repositories
- Users push and pull to Bitbucket (credentials in LastPass) on a daily<sup>1</sup> basis


### Rules

  - All lower case separated by underscores

### Nomenclature 

prefix & functional area {1,} & action verb {0,1} & brief description {1}  
prefix & server {0,1} & action verb {0,1} & name {1}  
& == _

### Prefixes (leading descriptors) 

- nod_bts (bits) - raw work, does not function as stand alone script; typically works in progress
- nod_scr (scripts) - stand alone blocks of code that are intended to be executed by installed software (ie .bat, .sh, .py, .sql, etcetera)
- nod_prg (programs) - stand alone programs that DO not have a UI; an assembly of scripts
- nod_app (applications) - finished standalone programs that have a UI; can be compiled or interpreted; an assembly of scripts and / or programs
- nod_dbs (database) - database files 

--- 

- Bitbucket organized by project with repositories downstream in the directory structure.  Also, all users have a miscellaneous repository for their general work.  Symbols in this document are / for folder,  <> for repository
- **Example Structure**  
    - / major_project_name  
      - <> csharp_code  
      - <> sql_code  
      - <> pic_basic_code      
    - / databases
      - / nodmysql9901
        - <> nod_pm
      - / nodrhelbiaz
        - <> bi
      - / nodsql2016a
        - <> edi_production  
    - / sandbox
      - <> aaa_general
      - <> bwarembourg 
      - <> smcquown      


1. Daily means where there are either significant changes, or the project is actively being worked on.  Typical workflow would be to pull in the AM when starting work and push at the end of the day.