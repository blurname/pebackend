import { Router, Response, useRequestInfo } from 'farrow-http'
import {pc} from '../db'
export const collaboration = Router()
collaboration.get('/mine/?<user_id:int>').use(async (req) => {
	let query = req.query
	let col = await pc.collaboration.findMany({where:{
		collaborator_id:query.user_id,
	}})
	return Response.json(col)
})

