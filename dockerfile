# Используем официальный образ nginx на Alpine (очень легкий)
FROM nginx:alpine

# Удаляем дефолтную конфигурацию nginx, которая слушает на порту 80
RUN rm /etc/nginx/conf.d/default.conf

# Копируем нашу кастомную конфигурацию nginx (см. шаг 2)
COPY nginx.conf /etc/nginx/conf.d

# Копируем собранный статический сайт из текущей директории (хоста)
# в директорию, которую nginx будет раздавать
COPY . /usr/share/nginx/html

# Сообщаем Docker, что контейнер слушает на порту 80
EXPOSE 80

# Команда для запуска nginx при старте контейнера
CMD ["nginx", "-g", "daemon off;"]
