@if not defined DEBUG echo off
call env.cmd

if not exist %IMAGES_SAVE_DIR% mkdir %IMAGES_SAVE_DIR%

call docker_save.cmd docker.gitea.com/gitea gitea-%SERVER_VERSION%-rootless %SERVER_VERSION%-rootless
if ErrorLevel 1 goto failure

:complete
goto end

:failure
if ErrorLevel 1 goto end
:: strict fail
echo [1] %0 %*
exit /b 1

:end
if ErrorLevel 1 echo [%ErrorLevel%] %0 %*
exit /b %ErrorLevel%
