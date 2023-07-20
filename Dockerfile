
FROM node:18-alpine as base_packages

# Base should hold all our code dependencies from our package.json file
# and sets up the environment ready to run the app
FROM base_packages as base
# install all our dependencies in /api
WORKDIR /api
COPY package.json package-lock.json ./
RUN npm i
# ensure that nested directories have access to node_modules
ENV PATH /api/node_modules/.bin:$PATH
# move to /api/app to avoid conflicts with host node_modules
# see the comments in docker-compose for more info on why we need to do this
WORKDIR /api/app

FROM base as dev
ENV NODE_ENV=development
COPY . .
CMD ["npm", "start"]
