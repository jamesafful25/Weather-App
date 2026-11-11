# Use the lightweight Nginx web server image
FROM nginx:alpine

# Copy the Weather App files into Nginx's web directory
COPY index.html style.css script.js /usr/share/nginx/html/

# Expose the HTTP port
EXPOSE 80