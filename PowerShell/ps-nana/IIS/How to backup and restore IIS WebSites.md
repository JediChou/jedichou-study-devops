# How to backup and restore IIS WebSites

* [REF](https://technet.microsoft.com/en-us/library/99a7c12c-0deb-484c-a113-3920a49c7faa)

* Sample 1
  * BACKUP: msdeploy -verb:sync -source:metakey=lm/w3svc/1 -dest:archivedir=c:\archive
  * RESTORE: command: msdeploy -verb:sync -source:archivedir=c:\archive -dest:metakey=lm/w3svc/1

* Sample 2
  * BACKUP: msdeploy -verb:sync -source:webServer -dest:package='c:\archive\JediBackup5.zip'
  * RESTORE: msdeploy -verb:sync -source:package='c:\archive\JediBackup5.zip' -dest:webServer
