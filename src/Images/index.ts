import { Router, Response, useRequestInfo } from 'farrow-http'
import {join} from 'path'
export const image = Router()
image.get('/get_all').use((req) => {
	return Response.file(join(__dirname,"/../../","public/images/t2.jpg"))
})
image.get('/get_single/<image_name:string>').use((req) => {
	const imgUrl = req.params.image_name
	return Response.file(join(__dirname,"/../../public/images/",imgUrl))
})
image.post('/upload').use((req) => {
	let reqInfo = useRequestInfo()
	return Response.text('upload successfully')
})
