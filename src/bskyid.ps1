#   BskyId  Copyright (C) 2024  Aptivi
# 
#   This file is part of BskyId
# 
#   BskyId is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
# 
#   BskyId is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
# 
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Some variables
$address = "https://bsky.social/xrpc/com.atproto.identity.resolveHandle?handle="

# Check for arguments and look for switches
$argCount = $args.Length
$plain = 0
$asText = 0
for ($idx = 1; $idx -lt $argCount; $idx++)
{
    if ("$($args[$idx])" -eq "-plain")
    {
        $plain = 1
    }
    if ("$($args[$idx])" -eq "-asText")
    {
        $asText = 1
    }
}
if ($argCount -lt 1)
{
    throw "Provide a handle. Usage: bskyid.ps1 <handle> [-plain] [-asText]"
}

# Now, get the handle and return the handle ID
$handle = $($args[0])
$resultJson = $(Invoke-WebRequest -Uri $address$handle).Content
$resultJsonObj = ConvertFrom-Json $resultJson
if ($plain)
{
    Write-Output $(if ($asText) {$resultJson} else {$resultJsonObj})
}
else
{
    Write-Output $($resultJsonObj.did)
}
