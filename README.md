Blog app
========

# Requirements

- Ruby 3.2.2

# Run instructions

1. Install dependencies:
    ```shell
   bundle install
   ```
2. Setup database server via docker (or any other mother):
    ```shell
   docker run \
    --name blog-db \
    -p 5432:5432 \
    -e POSTGRES_HOST_AUTH_METHOD=trust \
    -d postgres:16-alpine
   ```
   Database needs to have default user `postgres` with **empty** password. Server port is `5432`. Please check the `config/database.yml` file for more information.
   
3. Setup database:
    ```shell
   bundle exec rails db:create
   bundle exec rails db:migrate
   bundle exec rails db:seed
   ```
   
4. Start the app:
    ```shell
    bundle exec foreman start -f Procfile.dev
    ```

After the steps above, the database will be prepopulated with some data. There will be 3 users which you can use to login:
1. username: `aleksa1`, email: `aleksa1@fcc.com` password: `secret123`
2. username: `aleksa2`, email: `aleksa2@fcc.com` password: `secret123`
3. username: `aleksa3`, email: `aleksa3@fcc.com` password: `secret123`