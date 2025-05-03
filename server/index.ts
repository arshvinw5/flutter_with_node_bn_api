// const server = Bun.serve({
//   port: Bun.env.PORT || 8000,

//   fetch(req) {
//     const url = new URL(req.url);

//     if (url.pathname === "/") {
//       return new Response("Home Page");
//     }

//     if (url.pathname === "/json") {
//       const data = JSON.stringify({
//         status: "200",
//         message: "This is Json data",
//       });

//       return new Response(data, {
//         headers: { "Content-Type": "application/json" },
//       });
//     }
//     return new Response("404");
//   },
// });

// console.log(`Listening on http://localhost:${server.port}`);

const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

const PORT = Bun.env.PORT || 8000;
const app = express();

app.use(express.json());
app.use(authRouter);

const DB = Bun.env.MONGODB_URL;

mongoose
  .connect(DB)
  .then(() => {
    console.log("Database connected");
  })
  .catch((err: any) => {
    console.log(err);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server is running on port ${PORT}`);
});
