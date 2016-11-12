--version version
select @@version

--turn on
Exec sp_configure  'external scripts enabled', 1  

--run and then RESTART SQL SERVER service
Reconfigure  with  override  

--verify, output should be '1'
Exec sp_configure  'external scripts enabled' 

--run a test R script
exec sp_execute_external_script  @language =N'R',  
@script=N'OutputDataSet<-InputDataSet',    
@input_data_1 =N'select 1 as hello'  
with result sets (([hello] int not null));  
go 

--full reference here
https://msdn.microsoft.com/en-us/library/mt696069.aspx