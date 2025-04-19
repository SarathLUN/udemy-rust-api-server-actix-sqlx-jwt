-- Add migration script here
CREATE TABLE `categories`
(
    `id`          bigint unsigned not null auto_increment,
    `user_id`     bigint unsigned not null,
    `name`        varchar(255)    not null,
    `description` text,
    `balance`     bigint unsigned not null default 0,
    `created_at`  datetime        not null default current_timestamp,
    `updated_at`  datetime        not null default current_timestamp on update current_timestamp,
    primary key (`id`),
    foreign key (`user_id`) references `users` (`id`) on DELETE cascade
);