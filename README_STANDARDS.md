# ABOUT 

This document covers high level standards for coding and version control.  It details 

1. Naming conventions for using Github
2. Boiler plate comment blocks for code
3. Workflows

## 1. Naming Conventions for Github

Repositories are ALL lower case.  There is a prefix indicating the code type followed by a descriptive name.  The prefix and name are separated by an underscore.  Words in the name are separated by dashes.

Naming Convention: prefix_descriptive-name  

Examples:  

- **bts_smcquown_sql** (miscallaneous SQL code used by Stephan McQuown)  
- **scr_magento-image-processing** (scripts related to ecommerce images)  
- **app_edi-eoms-orderweb**  (an application that processes EDI orders)  

Prefixes:

- **bts** (bits) raw work, does not function as stand alone; typically works in progress
- **scr** (scripts) - stand alone blocks of code that are executed by installed software (ie .bat, .sh, .py, .sql, etcetera)  
- **app** (applications) - finished standalone programs that typically have a UI; can be compiled or interpreted; an assembly of scripts  

## 2. Boiler Plate Comment Blocks for Code

Code should inlcude the following boiler plate comments.  They should be written using Markdown syntax when possible (shown in code block below).  

Comments should be explicit and succinct.    Because a code base may include multiple files, you do not need to repeat redundant comments.  Others people should be able to review the boiler plate comments and understand what the code does without being able to code the language themselves.  

(Required) indicates required information.  (Required) would not be included in the actual comments.  In others words ## ABOUT (Required) would actually be written ## ABOUT.  

**Template:**

    # INFO or NAME literally right here, in place of this Markdown header line
    
    Copyright YYYY National Oak Distributors, Inc.  
    
    ## TEST 
    
    Example usage w expected result
    
    ## ABOUT (Required)
    
    Purpose and biz environment here, what it does
    
    ## REQUIREMENTS 
    
    Needed features and prerequisites here
    
    ## PROGRAM (Required)
    
    Logic summary here, how it does it
    
    ## DEVELOPMENT  
    
    ### Authors
    
    Bulleted list of who wrote the code here
    
    ### History
    
    Major version history here


## 3. Workflows

Users have code base on network or local file system.  All significant work is pushed to Git based version control repositories.  We are using Github.  

1. Development is done locally (laptop/desktop) or in domain test environments
2. Push code to Github
3. Production servers pull from Github