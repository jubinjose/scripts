set sourcedrive=D
set targetdrive=Y
set logfile=D:\logs\Robocopy-%SourceDrive%-to-%TargetDrive%.log
del %logfile%
set flags=/MIR /XA:SH /XD AppData /XJD /R:1 /W:0 /MT:32 /V /NP /xf thumbs.db db.lock /LOG:%logfile%
Robocopy %sourcedrive%:\source_folder %targetdrive%:\target_folder %flags%