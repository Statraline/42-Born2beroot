# 42 - Born2beroot

![Langage](https://img.shields.io/badge/System-Linux_Debian-FCC624?logo=debian&logoColor=black)
![Langage](https://img.shields.io/badge/Script-Bash-green)
![Note](https://img.shields.io/badge/Score-125%2F100-brightgreen)

## 💡 Description

**Born2beroot** est le premier projet d'administration système (SysAdmin) de 42.
L'objectif est de créer une machine virtuelle (VM) stricte et sécurisée sous **Debian** (sans interface graphique).

## 🛠️ Configuration mise en place

### 1. Système & Partitionnement
* **OS :** Debian (Stable)
* **LVM (Logical Volume Manager) :** Partitionnement chiffré.
* **Sudo :** Configuration stricte (limite d'essais, logs, chemins restreints).

### 2. Sécurité (SSH & Firewall)
* **SSH :** Port 4242 uniquement, root login désactivé, authentification par mot de passe.
* **UFW (Uncomplicated Firewall) :** Seul le port 4242 est ouvert.
* **Politique de mot de passe :** Règle de complexité forte (longueur, majuscules, chiffres, expiration tous les 30 jours).

### 3. Monitoring (Bonus)
Création d'un script Bash (`monitoring.sh`) qui s'exécute toutes les 10 minutes (via Crontab) et diffuse un message sur tous les terminaux avec :
* Architecture et version du kernel.
* Nombre de processeurs physiques/virtuels.
* Utilisation de la RAM et du Disque.
* Charge CPU et dernière connexion sudo.
## 🌟 Partie Bonus

Pour valider le projet à **125%**, j'ai transformé cette machine virtuelle en un véritable serveur web sécurisé.

### 1. Stack Web (LEMP)
Installation et configuration d'un environnement serveur complet :
* **Lighttpd** : Serveur Web léger et performant.
* **MariaDB** : Système de gestion de base de données relationnelle (SQL).
* **PHP (FPM)** : Langage de script pour le traitement dynamique.

### 2. WordPress
* Déploiement d'un site **WordPress** local.
* Configuration de la base de données et connexion SQL.
* Site accessible via l'adresse IP de la VM.

### 3. Service Supplémentaire : Fail2Ban 🛡️
J'ai installé et configuré **Fail2Ban** pour protéger le serveur contre les attaques par force brute (Brute-Force) :
* Analyse des logs en temps réel.
* Bannissement automatique des IPs après plusieurs échecs d'authentification (sur le port SSH 4242 et sur le serveur Web).
* Configuration d'une durée de bannissement (bantime) spécifique.
* 
## 📂 Contenu du dépôt
* `monitoring.sh` : Le script de surveillance système développé en Bash.
