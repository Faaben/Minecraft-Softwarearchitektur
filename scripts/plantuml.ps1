param(
    [Parameter(Position=0, Mandatory=$false)]
    [string]$InputPath = ".",

    [Parameter(Mandatory=$false)]
    [string]$OutputDir,

    [Parameter(Mandatory=$false)]
    [ValidateSet('png','svg','pdf','eps','txt','utxt')]
    [string]$Format = 'svg'
)

$ErrorActionPreference = 'Stop'

# Resolve paths
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot  = Resolve-Path (Join-Path $scriptDir '..')
$jarPath   = Resolve-Path (Join-Path $repoRoot 'tools/plantuml/plantuml.jar')

if (-not (Test-Path $jarPath)) {
    Write-Error "PlantUML JAR not found at '$jarPath'. Run setup to download it."
}

# Prefer system Java
$java = 'java'
try {
    $null = & $java -version 2>$null
} catch {
    $candidate = Get-ChildItem -Path 'C:\Program Files','C:\Program Files (x86)' -Filter java.exe -Recurse -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1 -ExpandProperty FullName
    if ($candidate) {
        $java = $candidate
    } else {
        Write-Error 'Java is not installed or not on PATH.'
    }
}

# Try to locate Graphviz dot and export GRAPHVIZ_DOT for PlantUML
$dotPath = (Get-Command dot.exe -ErrorAction SilentlyContinue | Select-Object -First 1).Source
if ($dotPath) { $env:GRAPHVIZ_DOT = $dotPath }

$argsList = @('-jar', $jarPath, "-t$Format")
if ($OutputDir) { $argsList += @('-o', $OutputDir) }
$argsList += $InputPath

Write-Host "Running: java $($argsList -join ' ')" -ForegroundColor Cyan
& $java @argsList
exit $LASTEXITCODE
