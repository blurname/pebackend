import { Http, Response } from 'farrow-http'
import {cors} from 'farrow-cors'
import { PrismaClient } from '@prisma/client'
import {user} from './User'
import {canvas} from './Canvas'
import { Server, Socket } from 'socket.io'
import {image} from './Images'
import {SocketCanvas} from './socket'
const http = Http()
const server = http.server()
const io = new Server(server, {
	cors: { origin: 'http://localhost:3000', methods: ['GET', 'POST'] },
})
//const io = new Server(server)
http.use(cors())
//http.route('/user').use(user)
//http.route('/canvas').use(canvas)
//http.route('/image').use(image)
//http.route('/').use((req) => {
	//return Response.text('ok')
//})

const socketCanvas = new SocketCanvas(io)
socketCanvas.onConnection()

server.listen(30000, () => {
	console.log('server listening')
})

//http.listen(30001)
