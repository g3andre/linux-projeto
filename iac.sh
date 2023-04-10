#!/bin/bash

# Criando os diretórios
echo "Criando os diretórios"
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

# Criando os grupos dos usuários
echo "Criando os grupos dos usuários"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Alterando as permissões dos diretórios
echo "Alterando as permissões dos diretórios"
chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

# Alterando os grupos dos diretórios
echo "Alterando os grupos dos diretórios"
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

#removendo contas antigas
echo "removendo contas antigas"
userdel carlos
userdel debora
userdel josefina
# Adicionando os usuários
echo "Adicionando os usuários"
useradd carlos -c "Carlos" -G GRP_ADM -m -p $(openssl passwd -6 Senha123) -s /bin/bash
useradd debora -c "Debora" -G GRP_VEN -m -p $(openssl passwd -6 Senha123) -s /bin/bash
useradd josefina -c "Josefina" -G GRP_SEC -m -p $(openssl passwd -6 Senha123) -s /bin/bash
