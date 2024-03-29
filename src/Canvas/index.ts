import { Router, Response, useRequestInfo } from 'farrow-http'
import {pc} from '../db'
export const canvas = Router()
const group = (array:any[],count:number) => {
  let index = 0
  let newArr = []
  while (index<array.length) {
    newArr.push(array.slice(index,index+count))
    index+=count
  }
  return newArr
}

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
  .post('/del/?<canvas_id:int>&<spirit_id:int>')
  .use(async (req) => {
    const res = await pc.spirit.deleteMany({
      where:{
        canvas_id: req.query.canvas_id,
        canvas_spirit_id: req.query.spirit_id
      } 
    })
    console.log('del res', res)
    return Response.text('ok')
  })

//type offset = {
  //left:number
  //top:number
//}
canvas
  .post('/addElementContainer/?<canvasid:int>&<spirittype:int>&<canvas_spirit_id:int>')
  .use(async (req) => {
    let payload = useRequestInfo().body
    const posArray:number[] = JSON.parse(payload.element)
    console.log('pos',posArray)
    const offsets = group(posArray,2)
    console.log('afterPos',offsets)

    const res = await pc.spirit.create({
      data: {
        canvas_id: req.query.canvasid,
        canvas_spirit_id: req.query.canvas_spirit_id,
        spirit_type: req.query.spirittype,
        model: JSON.stringify(JSON.parse(payload.model)),
      },
    })
    const spirit_id = res.id
    offsets.forEach(async (offset) => {
      const res = await pc.point.create({
        data:{
          top:offset[1],
          left:offset[0],
          spirit_id:spirit_id
        }
      })
      console.log(res)
    })

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
canvas.get(`/get_single_spirit/?<spirit_id:int>`).use(async(req)=>{
  let singleSpirit = await pc.spirit.findMany({
    where:{
      id: req.query.spirit_id
    }
  })
  return Response.json(singleSpirit)
})
canvas.get(`/get_single_point_container/?<canvas_id:int>&<canvas_spirit_id:int>`).use(async(req)=>{
  // setTimeout(async () => {
    console.log('look at me',req.query.canvas_id,req.query.canvas_spirit_id)
    let pointContainer = await pc.spirit.findMany({
      where:{
        canvas_id:req.query.canvas_id,
        canvas_spirit_id:req.query.canvas_spirit_id
      }
    })
    console.log('hihihi',pointContainer)
    return Response.json(pointContainer)
  // }, 100);
  
})
canvas.get('/get_is_having_spirits/?<canvas_id:int>').use(async (req) => {
	let count = await pc.spirit.count({
		where:{
			canvas_id:req.query.canvas_id
		}
	})
	return Response.json(count)
})
canvas.get('/get_point/?<spirit_id:int>').use(async (req)=>{
  let points = await pc.point.findMany({
    where:{
      spirit_id:req.query.spirit_id
    }
  })
  console.log({points})
  return Response.json(points)
})
