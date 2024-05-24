import subprocess

commands = [
    'php artisan migrate',
    'php artisan config:clear',
    'php artisan cache:clear',
    'sudo systemctl restart apache2',
]


for command in commands:
    print(command)
    subprocess.run(command, shell=True)
