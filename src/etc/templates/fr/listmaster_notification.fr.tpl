From: [conf->email]@[conf->host]
To: Listmaster <[to]>
[IF type=request_list_creation]
Subject: Demande de cr�ation de la liste "[list->name]"

Une demande de cr�ation pour la liste "[list->name]" a �t� faite par [email].

[list->name]@[list->host]
[list->subject]
[conf->wwsympa_url]/info/[list->name]

Pour activer/supprimer cette liste :
[conf->wwsympa_url]/get_pending_lists
[ELSIF type=virus_scan_failed]
Subject: Echec de la d�tection antivirale

L'appel � l'antivirus a �chou� lors du traitement du fichier suivant :
	[filename]

Le message d'erreur est :
	[error_msg]
[error_msg]
[ELSIF type=edit_list_error]
Subject: Format incorrect de edit_list.conf

Le format du fichier de configuration edit_list.conf a chang� :
'default' n'est plus reconnu pour une population.

Reportez-vous � la documentation pour adapter [param0].
D'ici l�, nous vous sugg�rons de supprimer [param0].
La configuration par d�faut sera utilis�e.
[ELSIF type=sync_include_failed]
Subject: probl�me de mise � jour des membres de la liste [param0]

Sympa n'a pas pu mettre � jour la liste des membres � partir des sources de 
donn�es externes ; la base de donn�es ou l'annuaire LDAP ne sont probablement
pas int�rogeables.
Consultez les logs de Sympa pour plus de pr�cisions.

[ELSIF type=automatic_bounce_management]
Subject: Gestion automatique des abonn�s en erreur de la liste [list->name]

[IF action=notify_bouncers]
Notre serveur ayant re�u de NOMBREUX rapports de non-remise, les [aaa] abonn�s list�s ci-dessous ont �t�
inform�s qu'ils risquaient d'�tre d�sabonn� de la liste [list->name] :
[ELSIF action=remove_bouncers]
Notre serveur ayant re�u de NOMBREUX rapports de non-remise, les [aaa] abonn�s list�s ci-dessous ont �t�
d�sabonn�s de la liste [list->name] :
[ELSIF action=none]
Notre serveur ayant re�u de NOMBREUX rapports de non-remise, les [aaa] abonn�s list�s ci-dessous ont �t�
marqu�s par Sympa comme des adresses gravement en erreur :
[ENDIF]

[FOREACH user IN  user_list]
[user]
[END]

[ELSE]
Subject: [type]

[param0]

[ENDIF]
