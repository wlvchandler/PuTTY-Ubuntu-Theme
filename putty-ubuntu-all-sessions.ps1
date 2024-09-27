# Define the path to the PuTTY sessions in the registry
$puttySessionsPath = "HKCU:\SOFTWARE\SimonTatham\PuTTY\Sessions"

# Define the settings to apply to each session
$settings = @{
    "Colour21"="238,238,236"
    "Colour20"="211,215,207"
    "Colour19"="52,226,226"
    "Colour18"="6,152,154"
    "Colour17"="173,127,16"
    "Colour16"="117,80,123"
    "Colour15"="114,159,207"
    "Colour14"="52,101,164"
    "Colour13"="255,233,79"
    "Colour12"="196,160,0"
    "Colour11"="138,226,52"
    "Colour10"="78,154,6"
    "Colour9"="239,41,41"
    "Colour8"="204,0,0"
    "Colour7"="85,87,83"
    "Colour6"="46,52,54"
    "Colour5"="187,187,187"
    "Colour4"="255,255,255"
    "Colour3"="48,10,36"
    "Colour2"="48,10,36"
    "Colour1"="238,238,236"
    "Colour0"="238,238,236"
    "Xterm256Colour"="dword:00000001"
    "UseSystemColours"="dword:00000000"
    "FontHeight"="dword:00000010"
    "FontIsBold"="dword:00000000"
    "Font"="Consolas"
    "Beep"="dword:00000002"
    "BeepInd"="dword:00000000"
}

# Get all session keys
$sessionKeys = Get-ChildItem -Path $puttySessionsPath

# Apply settings to each session
foreach ($session in $sessionKeys) {
    foreach ($setting in $settings.GetEnumerator()) {
        Set-ItemProperty -Path "$puttySessionsPath\$($session.PSChildName)" -Name $setting.Key -Value $setting.Value
    }
}

Write-Host "Settings applied to all PuTTY sessions."
