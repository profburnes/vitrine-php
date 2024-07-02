# Banco de Dados

Utilizando MAriaDB ou MySQL - Banco de Dados "vitrine"
O arquivo SQL para criar e popular o banco está em "_arquivos"

Usuário do admin: bill@gmail.com e senha 123456

Senha criptografada com Bcrypt

# Criar.htaccess

Criar arquivo .htaccess na raiz com a configuração:

Engine on
RewriteCond %{SCRIPT_FILENAME} !-f
RewriteCond %{SCRIPT_FILENAME} !-d
RewriteRule ^(.*)$ index.php?param=$1
