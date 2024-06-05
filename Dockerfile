#setup the working dir
WORKDIR /app

# code
COPY . .

RUN npm i 

# stage 2
FROM node:21-slim

#setup the working dir
WORKDIR /app

#copy the above stage as compressed
Copy --from=backend-builder /app .

copy .env.sample .env

#Port
EXPOSE 5000
#App
CMD ["npm", "start"]
