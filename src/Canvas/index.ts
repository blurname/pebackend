import { Prisma, PrismaClient } from '@prisma/client'
import { Router, Response, useRequestInfo } from 'farrow-http'
const pc = new PrismaClient()
export const canvas = Router()

canvas.post('/create').use(async (req) => {
  let ri = useRequestInfo()
  const ownerId = ri.body.ownerId
	console.log(ri.body)
  const time = Date.now()
  await pc.canvas.create({
    data: {
      owner_id: ownerId,
      created_at: time.toString(),
    },
  })
  const canvas = await pc.canvas.findFirst({
    where: {
      owner_id: ownerId,
      created_at: time.toString(),
    },
  })
	return Response.json(JSON.stringify({id:canvas.id}))
})

canvas.post('/add/?<canvasid:int>&<spirittype:int>&<canvas_spirit_id:int>').use(async (req) => {
  let model = useRequestInfo().body
	const res = await pc.spirit.create({data:{
		canvas_id:req.query.canvasid,
		canvas_spirit_id:req.query.canvas_spirit_id,
		spirit_type:req.query.spirittype,
		model:JSON.stringify(model),
	}})
	console.log(res)
	return Response.text('ok')
})
canvas.post('/update/?<canvasid:int>').use((req) => {
  let ri = useRequestInfo()
  console.log(ri.body)
  return Response.json(ri.body)
})
