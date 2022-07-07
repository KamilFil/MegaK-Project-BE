import {Router} from "express";
import {AttractionRecord} from "../record/attraction.record";


export const attractionRoute = Router()
    .get('/', async (req, res) => {
        const attListRes = await AttractionRecord.getAll();
        res.json(attListRes)
    })

    .post('/add', async (req, res) => {
        const attAd = new AttractionRecord(req.body);
        console.log(req.body)
        // await attAd.insert()
        res.json(attAd)
    })

    .get('/:id', async (req, res) => {
        const attRes = await AttractionRecord.getOne(req.params.id)
        res.json(attRes)
    })



