import {Router} from "express";
import {AttractionRecord} from "../record/attraction.record";



export const attractionRoute = Router()
    .get('/', async (req, res) => {
        const attractionList = await AttractionRecord.getAll();
        res.json(attractionList)
    })

    .post('/add', (req, res) => {
        res.send("Dodawanie atrakcji")
    })

    .get('/:id', (req, res) => {
        res.send('Pobiaranie 1 atrakcji')
    })


