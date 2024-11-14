# 6. Configurar Nginx para servir el sitio web
# Copiar el archivo de configuración del sitio a sites-available
sudo cp /vagrant/webPrueba /etc/nginx/sites-available/

# 7. Crear un enlace simbólico en sites-enabled
sudo ln -s /etc/nginx/sites-available/webPrueba /etc/nginx/sites-enabled/

# 8. Crear el usuario "mario"
sudo adduser mario
echo "mario:mario" | sudo chpasswd

# 9. Crear el directorio FTP del usuario "mario" y establecer permisos
sudo mkdir -p /home/mario/ftp
sudo chown mario:mario /home/mario/ftp
sudo chmod 775 /home/mario/ftp

# 10. Generar certificados de seguridad
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=ES/ST=Granada/L=Granada/O=Global Security/OU=IES ZAIDIN VERGELES/CN=exploreX.test"

# 11. Subir el archivo de configuración de vsftpd desde /vagrant
sudo cp -v /vagrant/vsftpd.conf /etc/vsftpd.conf

# 12. Iniciar el servicio vsftpd
sudo systemctl start vsftpd

# 13. Agregar el usuario "mario" al grupo www-data
sudo usermod -aG www-data mario

# 14. Crear el directorio para el nuevo sitio web
sudo mkdir -p /var/www/exploreX/html/

# 15. Copiar el archivo de configuración de /vagrant a /etc/nginx/sites-available
sudo cp /vagrant/exploreX /etc/nginx/sites-available/

# 16. Crear un enlace simbólico en sites-enabled para el nuevo sitio web
sudo ln -s /etc/nginx/sites-available/exploreX /etc/nginx/sites-enabled/

# 17. Verificar la configuración de Nginx antes de reiniciar
sudo nginx -t

# 18. Reiniciar Nginx para aplicar los cambios
sudo systemctl restart nginx

# 19. Verificar si Nginx está en funcionamiento
sudo systemctl status nginx

# 20. Reiniciar el servicio vsftpd
sudo systemctl restart vsftpd
