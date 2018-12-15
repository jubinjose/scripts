@echo on
for /D %%g in (*.*) do (
echo %%g
cd %%g
D:\logfiles\ziplogs.cmd
cd ..
)