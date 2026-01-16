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

## 📂 Contenu du dépôt
* `monitoring.sh` : Le script de surveillance système développé en Bash.
