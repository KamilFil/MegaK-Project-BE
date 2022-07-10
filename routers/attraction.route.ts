import {Router} from "express";
import {AttractionRecord} from "../record/attraction.record";
import {UpdateAttReq} from "../types";

export const attractionRoute = Router()
    .get('/', async (req, res) => {
        const attListRes = await AttractionRecord.getAll();
        res.json(attListRes)
    })

    .post('/add', async (req, res) => {
        const attAd = new AttractionRecord(req.body);
        await attAd.insert()
        res.json(attAd.nameAttraction).redirect('/')

    })

    .get('/:id', async (req, res) => {
        const attRes = await AttractionRecord.getOne(req.params.id)
        res.json(attRes)
    })

    .patch('/:id', async (req, res) => {
        const {body}: {
            body: UpdateAttReq;
        } = req;

        const att = await AttractionRecord.getOne(req.params.id)
        if(att === null) {
            throw new Error('Brak atrakcji o podanym ID')
        }

        att.active === 0 ? att.active = 1 : att.active = 0
        att.nameAttraction = body.nameAttraction;

        await att.updateAtraction()
        res.json(att)
    })

    .delete('/:id', async (req, res) => {
        const attDel = await AttractionRecord.getOne(req.params.id)
        if(!attDel) {
            throw new Error('Brak attrakcji z takim ID')
        }
        await attDel.delete()
        res.json(attDel.nameAttraction)
    })


