import {AdAttractionEntity, AttractionEntity} from "../types";
import {pool} from "../utils/db";
import {FieldPacket} from "mysql2";

type AttractionResult = [AttractionEntity[], FieldPacket[]]

export class AttractionRecord implements AttractionEntity {
    id: string;
    categoryId: string;
    nameAttraction: string;
    img: string;
    text: string;
    town: string;
    valueLike: number;

    constructor(obj: AdAttractionEntity) {
        this.id = obj.id;
        this.nameAttraction = obj.nameAttraction;
        this.img = obj.img;
        this.text = obj.text;
        this.town = obj.town;
    }

    static async getAll(): Promise<AttractionRecord[]> {
        const [results] = (await pool.execute("SELECT * FROM `attraction`")) as AttractionResult
        return results.map(obj => obj)
    }
}