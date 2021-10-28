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
  console.log('canvas:', canvas)
  return Response.json(JSON.stringify({ id: canvas.id }))
})

canvas
  .post('/add/?<canvasid:int>&<spirittype:int>&<canvas_spirit_id:int>')
  .use(async (req) => {
    let model = useRequestInfo().body
    const res = await pc.spirit.create({
      data: {
        canvas_id: req.query.canvasid,
        canvas_spirit_id: req.query.canvas_spirit_id,
        spirit_type: req.query.spirittype,
        model: JSON.stringify(model),
      },
    })
    console.log(res)
    return Response.text('ok')
  })

canvas
  .post('/update/?<canvasid:int>&<canvas_spirit_id:int>')
  .use(async (req) => {
    let model = useRequestInfo().body
    console.log(model)
    const res = await pc.spirit.updateMany({
      where: {
        canvas_id: req.query.canvasid,
        canvas_spirit_id: req.query.canvas_spirit_id,
      },
      data: {
        model: JSON.stringify(model),
      },
    })
    console.log('res')
    console.log(res)
    return Response.text('ok')
  })
canvas.get('/get/?<ownerid:int>').use(async (req) => {
  let canvases = await pc.canvas.findMany()
  return Response.json(JSON.stringify(canvases))
})

canvas.get('/get_spirits/?<canvas_id:int>').use(async(req) => {
	let spirits = await pc.spirit.findMany({
		where:{
			canvas_id:req.query.canvas_id,
		}
	})
	//console.log(spirits[0])
	return Response.json(spirits)
})
canvas.get('/get_is_having_spirits/?<canvas_id:int>').use(async (req) => {
	let count = await pc.spirit.count({
		where:{
			canvas_id:req.query.canvas_id
		}
	})
	return Response.json(count)
})
