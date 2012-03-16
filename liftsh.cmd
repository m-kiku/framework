@echo off

@REM Internal options, always specified
set INTERNAL_OPTS=-Dfile.encoding=UTF-8 -Xmx768m -noverify -XX:ReservedCodeCacheSize=96m -XX:+UseCompressedOops -XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC -XX:MaxPermSize=512m

@REM Default options, if nothing is specified
set DEFAULT_OPTS=

if "%LIFTSH_OPTS%"=="" (
  set LIFTSH_OPTS=%DEFAULT_OPTS%
)

@REM Call with INTERNAL_OPTS followed by LIFTSH_OPTS (or DEFAULT_OPTS). java always takes the last option when duplicate.
java %INTERNAL_OPTS% %LIFTSH_OPTS% -jar "%~dp0\project\sbt-launch-0.12.0-M2.jar" %*
