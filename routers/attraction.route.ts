import {Router} from "express";
import {AttractionRecord} from "../record/attraction.record";
import {addLikeReq, UpdateAttReq} from "../types";

export const attractionRoute = Router()
    .get('/', async (req, res) => {
        const attListRes = await AttractionRecord.getAll();
        res.json(attListRes)
        // res.json(attListRes)
    })

    .post('/add', async (req, res) => {
        const attAd = new AttractionRecord(req.body);
        await attAd.insert()
        res.json(attAd.nameAttraction).redirect('/')

    })

    .patch('/like/:id', async (req, res) => {

        const att = await AttractionRecord.getOne(req.params.id)
        if (att === null) {
            throw new Error("Brak takiego ID")
        }

        att.valueLike++

        await att.updateAttraction()

        // const attListRes = await AttractionRecord.getAll();
        res.json(att)

    })


    .get('/:id', async (req, res) => {
        const attRes = await AttractionRecord.getOne(req.params.id)
        if(attRes == null) {
            return res.status(404).redirect('/404/')
        }
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
        console.log(att)
        att.active === 0 ? att.active = 1 : att.active = 0
        att.nameAttraction = body.nameAttraction;

        await att.updateAttraction()
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


