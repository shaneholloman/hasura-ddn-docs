FROM --platform=linux/amd64 node:18.14.2

ENV PORT=8080
ENV release_mode="production"
ENV BUILD_VERSION="3.0"

# Create app directory
WORKDIR /graphql-engine/docs


# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

RUN yarn

# Copy needed files
COPY . .

# Build static files
RUN yarn build

EXPOSE 8080

CMD ["yarn", "serve", "-p", "8080", "--host", "0.0.0.0"]