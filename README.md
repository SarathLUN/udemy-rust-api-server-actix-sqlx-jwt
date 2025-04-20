# Creating an API server in Rust with Actix, SQLx and JWT

## Section 1: Introduction

1. create project

```shell
cargo new moneyflow
```

2. add dependencies

```shell
cargo add actix-web
```

3. test actix-web

- run the server
```shell
cargo run 
```

- client access to the server
```shell
> curl http://localhost:8080/                                                                                                                        +
Hello world!%
> curl http://localhost:8080/hey                                                                                                                     +
Hey there!%
> curl -d "Hello ECHO" -X POST http://localhost:8080/echo                                                                                            +
Hello ECHO%
```

4. additional resources:

- Quick intro to Rust syntax: [Rust quick intro](https://fasterthanli.me/articles/a-half-hour-to-learn-rust)
- The Rust Book: [Rust book](https://doc.rust-lang.org/book/)
- Rust Cheatsheet: [Rust cheatsheet](https://cheats.rs/)
- A Gentle Introduction to Rust: [rust-gentle-intro](https://stevedonovan.github.io/rust-gentle-intro/)

## Section 2: MoneyFlow

1. MoneyFlow requirement
![requirements.png](./documentation/requirements.png)

2. Database Structure
![db.png](./documentation/db.png)

3. API Design
![api.png](./documentation/api.png)

## Section 3: Database Setup with SQLx

1. install sqlx-cli via this [link](https://github.com/launchbadge/sqlx/tree/main/sqlx-cli)
```shell
cargo install sqlx-cli
```
- verify by
```shell
sqlx -V
```
- add dependency
```toml
sqlx = { version = "0.8", features = [ "runtime-tokio", "tls-rustls","mysql","chrono" ] }
```
- create `.env` file and add database connection string
- create database via
```shell
sqlx database create
```
- create migration file
```shell
sqlx migrate add create_user_table
```
- design table users in the generated file
- apply the migration
```shell
sqlx migration run
```
- do the same process for other 2 tables: `categories` and `transactions`

## Section 4: Basic Controller Setup

- create controller module
```shell
mkdir "controllers"
touch controllers/mod.rs
```
- declare controller module in `main.rs`
```rust
mod controllers; // place at the top of the file
```

- create `auth` controller
```shell
touch controllers/auth.rs
```
- public the `auth` controller in the `mod.rs` file
```rust
pub mod auth;
``` 
- create 2 handler functions for sign-up and sign-in that implement `Responder`
- then we can register as service in `main.rs`
- do the same process for controller user provide `me.rs`
- let start the server and test the 4 service functions
```shell
cargo run
```
```shell
> curl -X POST http://localhost:8080/auth/sign-up
Sign up%
> curl -X POST http://localhost:8080/auth/sign-in
sign in%
> curl -X POST http://localhost:8080/me
update profile%
> curl -X GET http://localhost:8080/me
profile%
```