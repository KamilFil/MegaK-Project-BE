import {AdAttractionEntity, AttractionEntity} from "../types";
import {pool} from "../utils/db";
import {FieldPacket} from "mysql2";
import {v4 as uuid} from "uuid"

type AttractionResult = [AttractionEntity[], FieldPacket[]]

export class AttractionRecord implements AttractionEntity {
    id: string;
    // categoryId: string;
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

    async insert(): Promise<string> {
        if (!this.id) {
            this.id = uuid()
        } else {
            throw new Error("Wystapił problem z przypisaniem ID")
        }

        await pool.execute("INSERT INTO `attraction`(`id`, `nameAttraction`, `img`, `text`, `town`) VALUES(:id, :nameAttraction, :img, :text, :town)",this)
        return this.id
    }

    static async getAll(): Promise<AttractionRecord[]> {
        const [results] = (await pool.execute("SELECT * FROM `attraction` ORDER BY nameAttraction DESC")) as AttractionResult
        return results.map(obj => new AttractionRecord(obj))
    }

    static async getOne(id: string): Promise<AttractionRecord | null> {
        const [results] = await pool.execute("SELECT * FROM `attraction` WHERE `id` = :id",{
            id,
        }) as AttractionResult;
        return results.length === 0 ? null : new AttractionRecord(results[0]);
    }
}