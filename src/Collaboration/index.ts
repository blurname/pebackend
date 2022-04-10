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
collaboration
.post('/invite/?<canvas_id:int>&<owner_id:int>&<collaborator_name:string>')
.use(async (req)=>{
	const query = req.query
	console.log(query.collaborator_name)
	
	const collaborator = await pc.user.findFirst(
		{
			where:{
				name:query.collaborator_name
			}
		}
	)
	const isInvited = await pc.collaboration.findFirst({
		where:{
			canvas_id:query.canvas_id,
				owner_id:query.owner_id,
				collaborator_id:collaborator.id
		}
	})
	if(isInvited){
		return Response.text('isInvited')
	}
	console.log('col',collaborator)
	const res = await pc.collaboration.create(
		{
			data:{
				canvas_id:query.canvas_id,
				owner_id:query.owner_id,
				collaborator_id:collaborator.id
			}
		}
	)
	return Response.text('invitedSuccess')
})
