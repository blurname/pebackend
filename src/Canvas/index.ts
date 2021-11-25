import { Router, Response, useRequestInfo } from 'farrow-http'
import {pc} from '../db'
export const canvas = Router()

canvas.post('/create').use(async (req) => {
  let ri = useRequestInfo()
  const ownerId = ri.body.ownerId
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
  .post('/add/?<canvasid:int>&<spirittype:int>&<canvas_spirit_id:int>$<element:string>')
  .use(async (req) => {
    let model = useRequestInfo().body
    const res = await pc.spirit.create({
      data: {
        canvas_id: req.query.canvasid,
        canvas_spirit_id: req.query.canvas_spirit_id,
        spirit_type: req.query.spirittype,
				element:req.query.element,
        model: JSON.stringify(model),
      },
    })
    console.log(res)
    return Response.text('ok')
  })

canvas
  .post('/update_back/?<canvasid:int>&<spirittype:int>&<canvas_spirit_id:int>$<element:string>')
  .use(async (req) => {
    let model = useRequestInfo().body
    const res = await pc.spirit.updateMany({
			where:{
				canvas_id:req.query.canvasid,
				canvas_spirit_id:req.query.canvas_spirit_id
			},
      data: {
        canvas_id: req.query.canvasid,
        canvas_spirit_id: req.query.canvas_spirit_id,
        spirit_type: req.query.spirittype,
				element:req.query.element,
        model: JSON.stringify(model),
				unique_props:null
      },
    })
    console.log(res)
    return Response.text('ok')
  })
canvas
  .post('/update_model/?<canvasid:int>&<canvas_spirit_id:int>')
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

canvas
  .post('/update_unique_props/?<canvasid:int>&<canvas_spirit_id:int>')
  .use(async (req) => {
    let unique = useRequestInfo().body
    console.log(unique)
    const res = await pc.spirit.updateMany({
      where: {
        canvas_id: req.query.canvasid,
        canvas_spirit_id: req.query.canvas_spirit_id,
      },
      data: {
        unique_props: JSON.stringify(unique),
      },
    })
    console.log('res')
    console.log(res)
    return Response.text('ok')
  })

canvas.get('/get/?<ownerid:int>').use(async (req) => {
	console.log('req.query.ownerid:', req.query.ownerid)
  let canvases = await pc.canvas.findMany(
		{
			where:{
				owner_id:req.query.ownerid
			}
		}
	)
	console.log('aslkdfjlsakdfjl;k')
	console.log('canvas:', canvases)
  return Response.json(JSON.stringify(canvases))
})

canvas.get('/get_spirits/?<canvas_id:int>').use(async(req) => {
	let spirits = await pc.spirit.findMany({
		where:{
			canvas_id:req.query.canvas_id,
		}
	})
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
