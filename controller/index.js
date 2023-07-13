import express from "express";
import morgan from "morgan";
import dotenv from "dotenv";
const app = express();
//config
dotenv.config();
morgan("dev");
//middlewares
app.use(express.json());
//routes
app.get("/", (req, res) => {
    res.send("a");
});
//listen
app.listen(process.env.PORT || 3000, () => {
    console.log(`Run on port ${process.env.PORT}, on route  `);
});
