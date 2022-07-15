import {Router} from "express"
import {AttractionRecord} from "../record/attraction.record";

export const adminRoute = Router()

    .get('/', async (req, res) => {
        const attListRes = await AttractionRecord.getAllForAdmin();
        res.json(attListRes)
    })



