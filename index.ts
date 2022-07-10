import express, {json} from "express";
import "express-async-errors";
import cors from "cors";
import {handleError} from "./utils/errors";
import {attractionRoute} from "./routers/attraction.route";
import {adminRoute} from "./routers/admin.route";

const app = express()
app.use(json())
app.use(cors({
    origin:"http://localhost:3000"
}))

app.use('/attraction/', attractionRoute)
app.use('/admin/', adminRoute)

app.use(handleError)

app.listen(3001, "localhost", () => { console.log("Listening on http://localhost:3001")})