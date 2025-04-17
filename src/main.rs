use actix_web::{App, HttpResponse, HttpServer, Responder, get, post, web};

#[get("/")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().body("Hello world!")
}
// curl http://localhost:8080/
// -> Hello world!

#[post("/echo")]
async fn echo(req_body: String) -> impl Responder {
    HttpResponse::Ok().body(req_body)
}
// curl http://localhost:8080/hey
// -> Hey there!

async fn manual_hello() -> impl Responder {
    HttpResponse::Ok().body("Hey there!")
}
// curl -d "Hello ECHO" -X POST http://localhost:8080/echo
// -> Hello ECHO

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(hello)
            .service(echo)
            .route("/hey", web::get().to(manual_hello))
    })
    .bind(("127.0.0.1", 8080))?
    .run()
    .await
}
