# 1. Actualizar repositorios, instalar Nginx y Git para clonar el repositorio, e instalar vsftpd
apt update
apt install -y nginx git vsftpd

# 2. Verificar si Nginx está en funcionamiento
sudo systemctl status nginx

# 3. Crear el directorio para el sitio web
sudo mkdir -p /var/www/webPrueba/html

# 4. Clonar el repositorio de ejemplo en el directorio del sitio web
git clone https://github.com/cloudacademy/static-website-example /var/www/webPrueba/html

# 5. Establecer permisos adecuados para el directorio web
sudo chown -R www-data:www-data /var/www/
sudo chmod -R 775 /var/www/

