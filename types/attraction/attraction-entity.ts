
export interface AdAttractionEntity extends Omit<AttractionEntity, 'id'> {
    id?: string,
}

export interface AttractionEntity {
    id: string,
    nameAttraction: string,
    town:string,
    text: string,
    img: string,
    valueLike: number,
    active: number,
    idCategory: number;
}

export interface UpdateAttReq {
  nameAttraction: string,
}

