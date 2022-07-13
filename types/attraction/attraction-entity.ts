
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
}

export interface addLikeReq {
    id: string,
}

export interface addLikeRes  {
    valueLike: number
    addLike: () => void;
}

export interface UpdateAttReq {
  nameAttraction: string,
}

