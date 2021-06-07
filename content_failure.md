# Content Failure

## Preamble 

Most of the below centers around updating preferred content after it is received from Unilog.  Updating existing data is the heart of the matter.  That is, there are no concerns about initial processing of Unilog data nor unpacking their provided media files.  
It is also important to realize that the ecommerce updates occur daily.  They are not in real time, which all NOD parties would prefer.

## Synopsis

- The daily job is not finishing processing data BEFORE it starts again the following day
- Elements of the data get written incorrectly because you can have two distinct steps writing to the same part number (record) at the same time
- The basic reason for this lengthy processing is because the whole set of SKUs is torn down and rebuilt daily.  It's a lot of data, but note this was fine until the last batch of Unilog parts pushed the job time over 24 hours.
- I haven't verified that this is 100% the cause.  I am highly confident it is because it explains a lot of the errors I came accross in testing.  I still should run an end-to-end test on production.  I currently have ecommerce looking at static data and will continue until I can verify a bona-fide production test.

## Fix

- Only rebuild parts as required due to data changes (was thought of in initial design phases but not done because of numerous locations in systems that data comes from, a lot of potential for mistakes)
- Safety: rebuild no more than X SKUs per day (will need to run time trials), should take less than 4 hours
- Safety: rebuild parts that are X timeframe old?  TBD but I advocate as fail safe
- Change processing technique (still debating which way to go, there are tradeoffs)
  - Changing batch processing to serial
  - Pre-stage complete batch and update as batch
- Safety: create logging checks to ensure prior job completed before new job starts
- Raise errors when known data integrity violations exist
  - "Child" or "Standard" part number tagged as "Parent"
  - Missing media file paths
  - TBD

## Timeline

- On October 12th (timestamp on file despite file title as "October 9") we received a new batch of Unilog part numbers
- 3 business days later, I became aware there were problems with import
  - Saw failed job on DBA dashboard
  - Started preliminary investigation
- 6 business days later (October 20th), I got a help ticket for missing SDS sheets
- Started thorough investigation
  - I tried rerunning the job.  It failed, and to quickly fix the problem, the **content data was reverted** from backup that pre-existed the Unilog Oct 12 batch
- From there, I began exhaustive trouble-shooting of the problem
  - Diabled the existing job
  - Ran job locally, had errors: "Primary Key" repeats, connection drops
  - Moved testing to test server
    - Ran unit tests
      - Reprocess batch: Okay
      - Build "biz rules": Okay
      - Build media links: Okay
      - Unpack and move files: Okay
- Became aware that "reverted" part numbers persisted on ecommerce with 1/2 done content.  Therefore, I pushed the testing data live because it was most complete
- After successful tests, ran job on production to coincide with weekend
  - Failure
- Sunday November 15 
  - Reran modules of job to troubleshoot ***from ETL tool***
  - Had connection failure
- Monday November 16
  - Reran modules of job to troubleshoot ***from command line*** to check permissions
  - Began unit testing media
  - Determined that Unilog filenaming convention changed slightly, fixed my code accordingly
- November 17, the wheels fall off
  - Had numerous SKUs not showing on ecommerce
  - Determined provided data was wrong
  - Figured out that the long-running job was colliding with itself
  - Reverted the data given to ecommerce and had them reimport

## Glossary

<u>batch</u>: mulitple part numbers  
<u>command line</u>: the DOS prompt  
<u>ETL Tool</u>: software we have for handling data jobs  
<u>serial</u>: one part number at a time  
<u>triggers</u>: database mechanisms that can "fire" when something happens