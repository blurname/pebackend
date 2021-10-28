import { Http, Response } from 'farrow-http'
import {cors} from 'farrow-cors'
import { PrismaClient } from '@prisma/client'
import {user} from './User'
import {canvas} from './Canvas'
import { Server } from 'socket.io'
import {image} from './Images'
const http = Http()
const server = http.server()
const io = new Server(server, {
  cors: { origin: 'http://localhost:3000', methods: ['GET', 'POST'] },
})
http.use(cors())
http.route('/user').use(user)
http.route('/canvas').use(canvas)
http.route('/image').use(image)
http.route('/').use((req) => {
	return Response.text('ok')
})

//io.on('connection', (socket) => {
  //console.log(`a user is connected${socket.id}`)
  //socket.emit('hello', 'world')
	//socket.emit('number','number coming')
	//console.log('look')
	//socket.on('number', (args) => {
		//socket.emit('add', number++)
		//console.log(args)
	//})
//})
//let number = 0

//server.listen(30000, () => {
  //console.log('server listening')
//})
http.listen(30001)
