# BskyId

<div align = center>

<br>
<br>
    
<img
  src = 'https://cdn.jsdelivr.net/gh/Aptivi/BskyId@main/OfficialAppIcon-BskyId-512.png'
  width = 256
  align = center
/>

<br>

</div>

This project, written in Bash and PowerShell, is a simple tool that gives you your BlueSky ID that is unique to your username. Just get your BlueSky handle from your BlueSky account that you can find over the [BlueSky](https://bsky.app) website, and pass it to the script. This ID is a unique identifier for your BlueSky account and can't be edited.

## Usage

```shell
./bskyid $handle [-plain]
```

```powershell
Set-ExecutionPolicy Bypass -Scope Process
./bskyid.ps1 $handle [-plain]
```

Both scripts return just a BlueSky ID associated with your BlueSky account.

## Running

This script doesn't require installation. You can download this script from here using your terminal emulator and run it, too!

### Windows

It can be installed anywhere using this method.

```powershell
Invoke-WebRequest -Uri https://raw.githubusercontent.com/Aptivi/bskyid/main/src/bskyid -OutFile bskyid.ps1
```

### Linux

It can be installed either locally on your home directory or system-wide.

#### cURL

* Local install

```shell
curl -fsSL https://raw.githubusercontent.com/Aptivi/bskyid/main/src/bskyid > $HOME/bskyid
chmod +x $HOME/bskyid
```

* System-wide install

```shell
curl -fsSL https://raw.githubusercontent.com/Aptivi/bskyid/main/src/bskyid | sudo tee /usr/local/bin/bskyid
sudo chmod +x /usr/local/bin/bskyid
```

#### WGet

* Local install

```shell
wget -O$HOME/bskyid https://raw.githubusercontent.com/Aptivi/bskyid/main/src/bskyid
chmod +x $HOME/bskyid
```

* System-wide install

```shell
sudo wget -O/usr/local/bin/bskyid https://raw.githubusercontent.com/Aptivi/bskyid/main/src/bskyid
sudo chmod +x /usr/local/bin/bskyid
```

## Affiliation

We are not affiliated with BlueSky in any shape or form, and this script is not an official BlueSky tool, although it contacts the official BlueSky servers.