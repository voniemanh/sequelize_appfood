import express from "express";
import process from "process";
import rootRouter from "./src/routers/root.router.js";
import cors from "cors";
import { appErorr } from "./src/common/helpers/handle-error.helper.js";
import { NotFoundException } from "./src/common/helpers/exception.helper.js";

const app = express();

app.use(express.json())
app.use(
    cors({
        origin: ["http://localhost:3000", "https://www.google.com"],
    })
);

app.use("/api", rootRouter);
app.use((req, res, next) => {
    const method= req.method;
    const url= req.originalUrl;
    const ip = req.ip;
    console.log(`${method} - ${url} - ${ip}`); 
    throw new NotFoundException();
});
app.use(appErorr)

const port = 3069;
app.listen(port, () => {
    console.log(`🤷 Server online at: ${port}`);
});
// process.setMaxListeners(20);