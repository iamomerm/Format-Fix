CLS	   

Remove-Item -Path "C:\Temp\Format-Fix.txt" -ErrorAction SilentlyContinue

$File = Read-Host -Prompt "Enter File Path"

$File = $File -replace '"', ''

$TestPath = Test-Path -Path $File

If ($TestPath -eq $True)
{
	CLS
    
	Write-Host "Please Wait..."

	$Content = Get-Content $File

	Foreach ($Line in $Content)
	{
		$NewLine = $Line -replace '    ', "`t"

		Write-Output $NewLine >> "C:\Temp\Format-Fix.txt"
	}

	#Fix Encoding
	$nContent = Get-Content -Path "C:\Temp\Format-Fix.txt"

	Set-Content -Value $nContent -Path "C:\Temp\Format-Fix.txt" -Encoding Ascii

	CLS

	Write-Host "Finished!" -ForegroundColor Green
}

Else 
{
	CLS

	Write-Host 'Invalid File Path!' -ForegroundColor Red -BackgroundColor White 
}

Read-Host -Prompt "Press any Key to Continue..."
