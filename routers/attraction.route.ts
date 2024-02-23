import {Router} from "express";
import {AttractionRecord} from "../record/attraction.record";
import { UpdateAttReq} from "../types";
import {CategoryRecord} from "../record/category.record";

export const attractionRoute = Router()
    .get('/', async (req, res) => {
        const attListRes = await AttractionRecord.getAll();
        const allCategory = await CategoryRecord.getAllCat();
        res.json({attListRes, allCategory})
    })


    .post('/add', async (req, res) => {
        const attAd = new AttractionRecord(req.body);
        await attAd.insert()
        res.json(attAd.nameAttraction)

    })

    .patch('/like/:id', async (req, res) => {

        const att = await AttractionRecord.getOne(req.params.id)
        if (att === null) {
            throw new Error("Brak takiego ID")
        }

        att.valueLike++

        await att.updateAttraction()

        res.json(att)

    })




    .get('/att/:id', async (req, res) => {
        const attRes = await AttractionRecord.getOne(req.params.id)
        if(attRes == null) {
            return res.status(404).redirect('/404/')
        }
        res.json(attRes)
    })

    .patch('/att/:id', async (req, res) => {
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

    .delete('/att/:id', async (req, res) => {
        const attDel = await AttractionRecord.getOne(req.params.id)
        if(!attDel) {
            throw new Error('Brak attrakcji z takim ID')
        }
        await attDel.delete()
        res.json(attDel.nameAttraction)
    })


    .get('/:category', async (req, res) => {
        const attListRes = await AttractionRecord.getAttCat(Number(req.params.category));
        const oneCategory = await CategoryRecord.getOneCat(Number(req.params.category));
        res.json({attListRes, oneCategory})
    })





