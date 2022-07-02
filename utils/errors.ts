import {NextFunction, Request, Response} from "express";


class ValidatorError extends Error{}

export const handleError = (err:Error, req:Request, res:Response, next: NextFunction) => {
    console.error(err)
    res
        .status(err instanceof ValidatorError ? 400 : 500)
        .json({
            message: err instanceof ValidatorError ? err.message : "Wróć później"
        })
}

