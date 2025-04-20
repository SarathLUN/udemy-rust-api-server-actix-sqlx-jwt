use actix_web::{get, post, Responder};

#[get("/me")]
pub async fn get_profile() -> impl Responder{
    "profile"
}

#[post("/me")]
pub async fn update_profile() -> impl Responder{
    "update profile"
}