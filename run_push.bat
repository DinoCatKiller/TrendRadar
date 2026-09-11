@echo off
cd /d I:\TrendRadar

REM 加载密钥文件（已被 .gitignore 排除，请勿提交）
if exist "config\secrets.env" (
    for /f "usebackq eol=# tokens=1,* delims==" %%A in ("config\secrets.env") do (
        if not "%%~A"=="" set "%%~A=%%~B"
    )
)

set PYTHONIOENCODING=utf-8
"C:\Users\28643\.local\bin\uv.exe" --directory I:\TrendRadar run python main.py >> I:\TrendRadar\output\push.log 2>&1
