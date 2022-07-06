
export interface AdAttractionEntity extends Omit<AttractionEntity, 'id' | "valueLike"> {
    id?: string,
    valueLike?: number,

}

export interface AttractionEntity {
    id: string,
    nameAttraction: string,
    town:string,
    text: string,
    img: string,
    categoryId: string,
    valueLike: number;
}

