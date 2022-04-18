import { Router, Response, useRequestInfo, useReq } from 'farrow-http'
import { Unknown } from 'farrow-schema'
import * as path from 'path'
import {pc} from '../db'
export const image = Router()
image.get('/get_all').use((req) => {
  return Response.file(path.join(__dirname, '/../../', 'public/images/t2.jpg'))
})
image.get('/get_single/<image_name:string>').use((req) => {
  const imgUrl = req.params.image_name
  return Response.file(path.join(__dirname, '/../../public/images/', imgUrl))
})
image.post('/upload/?<type:int>&<owner:int>').use(async(req) => {
  const payload = useRequestInfo().body
  console.log('upload',payload)
  const res = await pc.element.create({
    data:{
      name:payload.name,
      type:1,
      owner:req.query.owner
    }
  })
  console.log('upload', res)
  console.log('reqInfo:', req)
  return Response.text('upload successfully')
})
