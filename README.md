<div align="center">
   🐋
  <h1>Docker containers for servicescope</h1>
</div>

## ✨ Features / Tech stack

- ⚙️  Swarm mode
- 🌍 i18n (multilang configs)
- ⌨️  Dev / Production environments
- 🔵 nginx
- 📙 PostgreSQL
- 🤹 redis
- 🎈 memcached
- 🧯 AWS


## 🔨 Usage


0. ClientId, ClientSecrets, Admin email, passwords should be configured using env files. They will be written into DB using help scripts automatically.
1. Copy all files from `env-templates` into `.envs/.local` or `.envs/.production`. Move .env file into the current folder from `.envs/.*`

   - `.env` is a common env for all services - **this file and docker .yml file should be in the same folder**
   - `.env.api` is for api service
   - `.common.internal.env` is for api and db services
   - `.webclient.env` is for webclient service
   - `.wrapper.env` is for wrapper service

2. Configure environments
3. Build images: `docker-compose -f docker-stack.yml build`

   This should build these images: `saascontainerization_wrapper, saascontainerization_webclient, saascontainerization_api`

4. Run docker swarm: `docker stack deploy -c <(docker-compose -f docker-stack.yml config) {stack name}`
5. Go to django admin panel (`http://127.0.0.1:9999/saas_api/admin/`), create a new Api Key.
6. Add the key to `.env` file.
7. Re-deploy the stack; `docker stack deploy -c <(docker-compose -f docker-stack config) <stack name>`

OR: 

<!-- 7. Rebuild `webclient` service -->

8. Restart `webclient` service in your stack (this will rebuild the angular project and run ssr server)
9. Restart `wrapper` service in your stack


## ❓ How to update a service

- Rebuild Image: `docker-compose -f docker-stack.yml build wrapper`
- Update: `docker service update --force --image saascontainerization_wrapper saasApp_wrapper`
- Restart: `docker service update --force <stack_name>_<service_name>`

## 🤝 Contact

Email us at [brainhublab@gmail.com](mailto:brainhublab@gmail.com) or [timadevelop@gmail.com](mailto:timadevelop@gmail.com)
