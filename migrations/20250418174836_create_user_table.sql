-- Add migration script here
CREATE TABLE `users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` varchar(255) not null ,
    `first_name` varchar(255) not null ,
    `last_name` varchar(255) not null ,
    `password` varchar(255) not null ,
    `balance` bigint unsigned not null default 0,
    `created_at` datetime not null default CURRENT_TIMESTAMP,
    `updated_at` datetime not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    primary key (`id`)
)