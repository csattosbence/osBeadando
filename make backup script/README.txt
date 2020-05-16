Tisztelt Tanár úr!

Egy olyan script-et készítettem, amely hetente lefut és a kiválasztott
directory-ból készít egy backup fájlt.

Ahhoz, hogy a script lefusson, a root directory-ban létre kell hozni kettő
darab config  fájlt.

Ezek nélkül a script nem indul el.

Az egyik "backup_dirs.conf", ebben a fálban tudjuk megadni hogy miről
készüljön mentés. Például:"/home/bence/Desktop"

A másik fájl "backup_loc.conf" pedig a mentési útvonal megadására szolgál.
Például:"/" 

Mikor elinditjuk terminálba a scriptet bemásolódik "/etc/cron.weekly/"
,majd minden héten lefut.


