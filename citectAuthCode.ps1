function citectAuthCode {
  param(
    [Parameter(Position = 0, Mandatory = $true)]
    # basically the first argument
    [string]$Key
  )

  if (-not $Key) {
    Write-Error "Key parameter is required. Please pass it as an argument."
    return
  }

  $body = @{
      "usbKeySerialNumber" = $Key
  }
  $response = Invoke-WebRequest -Uri "https://avevagcs-citectlicensegeneratorms.azurewebsites.net/api/CitLicenseGeneratorProxy/getLicenseDetailsForUsbKey" -Body $body

  # Convert the JSON response content into a PowerShell object
  $jsonResponse = $response.Content | ConvertFrom-Json

  # Access the auth code (here is just Citect one)
  $authCode = $jsonResponse.authCode.AuthorizationCode

  # Output the extracted values
  Write-Output "The following PlantSCADA / Citect auth code has been copied to clipboard:"
  Write-Output ""
  Write-Output "$authCode"

  # Copy the authCode to the clipboard
  Set-Clipboard -Value $authCode
}
