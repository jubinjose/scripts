@echo on
REM loops through and zips the folders
for %%f in (*.log) do (
 "D:\LogFiles\WZZIP" %%f.zip %%f
 del %%f
)
