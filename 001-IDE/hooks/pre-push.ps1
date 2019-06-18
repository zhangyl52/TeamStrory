
# 如果脚本文件编码为UTF-8 BOM,, 则需要加上下面这句
# chcp 65001 | Out-Null

$MSBuildPathList = @(
    "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\MSBuild.exe",
    "D:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\MSBuild.exe",
    "D:\Visual Studio 2017\MSBuild\15.0\Bin\MSBuild.exe"
)

$MSBuild = ""

foreach ($item in $MSBuildPathList) {
    if (Test-Path -Path $item) {
        $MSBuild = $item;
        break;
    }
}

if ($MSBuild -eq "") {
    Write-Host 'MSBuild is not found!!!'
    exit 1
}
<#
add by liwei: 2019-06-15
1. 原本的实现方案是想直接输出中文错误信息。但visual studio按编码错误。
    '中国' | Write-Host   ===> vs直接报错
2. 如果直接将msbuild的构建日志保存在变量中，编码也有问题。索性借助文件中转一下。
#>
# -clp:ErrorsOnly;WarningsOnly;Summary
$BuildLogPath = 'msbuild.log'
&$MSBuild -nologo -noconlog -t:rebuild '-clp:Summary' -flp:logfile=$BuildLogPath '-flp:Encoding=UTF-8;Summary;Verbosity=minimal;' -m:4 -v:q -p:Configuration=Debug ./$((Get-Item -Path *.sln).Name)
$buildOutput = Get-Content -Path $BuildLogPath -Encoding UTF8

$m_info = $buildOutput | Out-String -Stream | Select-String -Pattern '(\d)+ (个警告|warning|个错误|error)' -AllMatches
if ($m_info.Matches.Count -gt 0) {
    $error_list = $m_info.Matches | foreach-Object { [System.Convert]::ToInt32($_.Groups[1].Value) } | Where-Object { $_ -gt 0 }
    if ($error_list.Count -gt 0) {
        'all errors or warnings need to be repaired!' | Write-Host
        exit 1
    }
}

# no problem, remove it.
Remove-Item -Path $BuildLogPath
