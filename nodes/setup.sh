#!/bin/bash
set -e

# Проверяем, что переменные окружения установлены
: "${SERVER_ID:?Переменная SERVER_ID не установлена}"
: "${HOSTNAME:?Переменная HOSTNAME не установлена}"

# Заменяем плейсхолдеры в файле конфигурации my.cnf
sed -i "s/@@SERVER_ID@@/$SERVER_ID/g" /etc/mysql/my.cnf
sed -i "s/@@HOSTNAME@@/$HOSTNAME/g" /etc/mysql/my.cnf

# Выводим итоговую конфигурацию для проверки
echo "Конфигурация my.cnf после замены:"
grep -E "server_id|report_host" /etc/mysql/my.cnf

# Запускаем MySQL сервер, используя exec для корректного перенаправления сигналов
exec docker-entrypoint.sh mysqld
