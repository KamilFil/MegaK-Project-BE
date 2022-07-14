import {pool} from "../utils/db";
import {FieldPacket} from "mysql2";
import {CategoryEntity} from "../types";

type CategoryResult = [CategoryEntity[], FieldPacket[]]

export class CategoryRecord implements CategoryEntity{
    idCategory: number;
    name: string;

    constructor(obj: CategoryRecord){
        this.idCategory = obj.idCategory;
        this.name = obj.name
    }

    static async getAllCat():Promise<CategoryRecord[]> {
        const [results] = (await pool.execute("SELECT * FROM `att-caregory`")) as [[], FieldPacket[]]
        return results.map(obj => new CategoryRecord(obj))
    }

    static async getAttCat(categoryId:number): Promise<CategoryRecord> {
        const [results] = (await pool.execute("SELECT * FROM `att-caregory` WHERE `idCategory` = :categoryId", {
            categoryId,
        })) as CategoryResult
        return results.length === 0 ? null : new CategoryRecord(results[0]);
    }
}




