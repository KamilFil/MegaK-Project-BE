import express, {json} from "express";
import "express-async-errors";
import cors from "cors";
import {handleError} from "./utils/errors";

const app = express()
app.use(json())
app.use(cors({
    origin:"http://localhost:3000"
}))
app.get('/', (req, res) => {
res.send('OK')
})

app.use(handleError)

app.listen(3001, "localhost", () => { console.log("Listening on http://localhost:3001")})