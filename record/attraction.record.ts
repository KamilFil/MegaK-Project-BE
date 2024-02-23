import {AdAttractionEntity, AttractionEntity} from "../types";
import {pool} from "../utils/db";
import {FieldPacket} from "mysql2";
import {v4 as uuid} from "uuid"

type AttractionResult = [AttractionEntity[], FieldPacket[]]


export class AttractionRecord implements AttractionEntity {
    id: string;
    idCategory: number;
    nameAttraction: string;
    img: string;
    text: string;
    town: string;
    valueLike: number;
    active: number;

    constructor(obj: AdAttractionEntity) {
        this.id = obj.id;
        this.idCategory = obj.idCategory;
        this.nameAttraction = obj.nameAttraction;
        this.img = obj.img;
        this.text = obj.text;
        this.town = obj.town;
        this.valueLike = obj.valueLike;
        this.active = obj.active;

    }

    async insert(): Promise<string> {
        if (!this.id) {
            this.id = uuid()
        } else {
            throw new Error("Wystapił problem z przypisaniem ID")
        }

        await pool.execute("INSERT INTO `attraction`(`id`, `nameAttraction`, `img`, `text`, `town`, `idCategory`) VALUES(:id, :nameAttraction, :img, :text, :town, :idCategory)",this)
        return this.id
    }

    async updateAttraction(): Promise<void> {
        await pool.execute("UPDATE `attraction` SET `nameAttraction` = :nameAttraction, `active` = :active, `valueLike` = :valueLike WHERE `id` = :id",{
            id: this.id,
            nameAttraction: this.nameAttraction,
            active: this.active,
            valueLike: this.valueLike
        })
    }

    async delete(): Promise<void> {
        await pool.execute("DELETE FROM `attraction` WHERE `id` = :id", {
            id: this.id
        })
    }

    static async getAllForAdmin():Promise<AttractionRecord[]> {
        const [results] = (await pool.execute("SELECT * FROM `attraction` ORDER BY nameAttraction DESC")) as AttractionResult
        return results.map(obj => new AttractionRecord(obj))
    }

    static async getAll(): Promise<AttractionRecord[]> {
        const [results] = (await pool.execute("SELECT * FROM `attraction` ORDER BY nameAttraction DESC")) as AttractionResult
        return results.map(obj => new AttractionRecord(obj))
    }

    static async getAttCat(categoryId:number): Promise<AttractionRecord[]> {
        const [results] = (await pool.execute("SELECT * FROM `attraction` WHERE `idCategory` = :categoryId", {
            categoryId
        })) as AttractionResult
        return results.map(obj => new AttractionRecord(obj))
    }


    static async getOne(id: string): Promise<AttractionRecord | null> {
        const [results] = await pool.execute("SELECT * FROM `attraction` WHERE `id` = :id",{
            id,
        }) as AttractionResult;
        return results.length === 0 ? null : new AttractionRecord(results[0]);
    }

}