
# E:\Repos\Git\fooww-web\FoowwWeb\Fooww.Web.WebApi\bin
# Get-Location

# save to restore
$OldLocation = (Get-Location).Path

# 解决方案根目录
Set-Location -Path ../../

$SlnDir = (Get-Location).Path

$GitHookDir = "${SlnDir}\.git\hooks\"

$PrePushHook = "${GitHookDir}\pre-push"

if (-not (Test-Path -Path $PrePushHook)) {
    Copy-Item -Path "${SlnDir}\pre-push" -Destination $GitHookDir
}


# restore path
Set-Location -Path $OldLocation