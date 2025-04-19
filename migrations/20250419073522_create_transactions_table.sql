-- Add migration script here
create table `transactions`(
    `id` bigint unsigned not null auto_increment,
    `user_id` bigint unsigned not null ,
    `category_id` bigint unsigned not null ,
    `type` varchar(255) not null ,
    `amount` bigint unsigned not null default 0,
    `memo` varchar(255) not null,
    `description` text,
    `created_at` datetime not null default current_timestamp,
    `updated_at` datetime not null default current_timestamp on update current_timestamp,
    primary key (`id`),
    foreign key (`user_id`) references `users` (`id`) on delete cascade ,
    foreign key (`category_id`) references `categories` (`id`) on delete cascade
);
