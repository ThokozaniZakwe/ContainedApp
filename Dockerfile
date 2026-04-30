# FROM node:alpine

# WORKDIR '/app'
# COPY package.json .

# RUN npm install
# COPY ./ ./

# CMD [ "npm", "run", "start", "--", "--host", "0.0.0.0" ]



# Stage 1: Build the Angular application
FROM node:alpine as builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
# Use 'run build' to execute the script in package.json
RUN npm run build -- --configuration production

# Stage 2: Serve with Nginx
FROM nginx:alpine
# IMPORTANT: In newer Angular versions, the path is often /app/dist/[project-name]/browser
# Check your angular.json "outputPath" to verify
COPY --from=builder /app/dist/contained-app/browser /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
