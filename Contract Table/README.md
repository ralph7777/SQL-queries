# Student Score Table

This is an script example of using TRIGGER in PL/SQL to manipulate contract database of a company.

The ContractCount attribute of JOB stores a count of how many workers have signed contracts to work on that job

– that is, the number of records in CONTRACT with that JobID – and its value should never exceed 4.  

There are three triggers written to maintain the value of the ContractCount attribute in JOB as changes are made to the CONTRACT table.

## 1.NewContract

The first trigger, named NewContract, will fire when a user attempts to INSERT a row into CONTRACT.  

This trigger will check the value of ContractCount for the corresponding job.  

If ContractCount is less than 4, then there is still room in the job for another worker, 

so it will allow the INSERT to occur and will increase the value of ContractCount by one.  

If ContractCount is equal to 4, then the job is full, 

so it will cancel the INSERT and display an error message stating that the job is full.

## 2.EndContract

The second trigger, named EndContract, will fire when a user attempts to DELETE one or more rows from CONTRACT.  

This trigger will update the values of ContractCount for any affected jobs 

to make sure they are accurate after the rows are deleted, 

by decreasing the value of ContractCount by one each time a worker is removed from a job.


## 3.NoChanges

The third trigger, named NoChanges, will fire when a user attempts to UPDATE one or more rows of CONTRACT.  

The trigger will cancel the UPDATE and display an error message

stating that no updates are permitted to existing rows of CONTRACT.




