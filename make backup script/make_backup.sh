#!/bin/bash

## hetente mentéseket készít a kiválasztott directoryban

##válltozók
##log file
log_loc = "/var/log/mybackup.log"
##
function check_dir_loc {
  ##check for dir list files
  if [ ! -s  "/backup_dirs.conf" ]
  then
    echo "Kérem készítsen egy listát azokról a mappákról/directory-ról amről mentést szeretne készíteni.
    Készítsen egy backup_dir.conf nevű fájlt a root directory-ban"
    exit]
  fi
}
function check_backup_loc {
  if [ ! -s "/backup_loc.conf" ]
  then
    echo "Kérem adja meg, hogy hol szeretné tárolni a mentési fájlokat.
    Készitsen egy backup_loc.conf nevű fájlt a root directory-ban"
    exit ]
  fi
}
function check_schedule {
  #nézzük meg hogy a script megtalálható-e a hetente lefutó scriptek között
  if [ ! -s "/etc/cron.weekly/make_backup" ]
  then
    #ha nincs benne a directoryban akkor másoljuk át a scriptet
    sudo cp make_backup.sh /etc/cron.weekly/make_backup
    echo "A fájl mentés be lett állitva heti mentésre"
    exit ]
  fi

}
function perform_backup {
  #eltároljuk a mentési helyet
  backup_path = $(cat /backup_loc.conf)

  echo "A mentés elkezdődött..." > $log_loc
  #minen egyes directory-t letömör0tünk a mentési heylre
  while read dir_path
  do
    dir_name=$(basename $dir_path)

    filename=$backup_path$dir_name.tar.gz

    tar -zcf $filename $dir_path 2>>$log_loc

    ##megváltoztatjuk a mentési fájlok tulajdon jogát root-ra
    chown bence:bence $filename

    echo "A $dir_name mentése elkészült." >> $log_loc

  done < /backup_dirs.conf

  echo "A mentés befejeződött ekkor:" >> $log_loc
  date >> $log_loc
}

check_dir_loc
check_backup_loc
check_schedule
perform_backup
