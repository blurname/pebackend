import { Server, Socket } from 'socket.io'
import { Canvas } from './canvas'

export class SocketCanvas {
  io: Server
  canvasMap: Map<number, Canvas>
  constructor(server: Server) {
    this.io = server
    this.canvasMap = new Map()
  }
  onConnection() {
    this.io.on('connection', (socket) => {
      //this.create(socket)
      this.join(socket)
      this.controll(socket)
			this.exit(socket)
    })
  }
  create(socket: Socket) {
    socket.on('create', (canvasId: number) => {
      //this.canvasArray.push(new Canvas(canvasId, socket))
      this.canvasMap.set(canvasId, new Canvas(canvasId, socket))
    })
  }
  join(socket: Socket) {
    socket.on('join', (canvasId: number, userId: number) => {
      const canvas = this.canvasMap.get(canvasId)
      if (canvas === undefined) {
        const canvas = new Canvas(canvasId, socket)
        canvas.joinUser({ id: userId })
        socket.emit('newJoin', JSON.stringify(canvas.users))
        console.log(`user: ${userId} Join the ${canvasId}`)
        this.canvasMap.set(canvasId, canvas)
      } else {
        const canvas = this.canvasMap.get(canvasId)
        //const userIsExist = canvas.users.filter((user) => user.id === userId)
        //
        if (!canvas.users.get(userId)) {
          canvas.joinUser({ id: userId })
          socket.emit('newJoin', JSON.stringify(canvas.users))
          console.log(`user: ${userId} Join the ${canvasId}`)
        } else {
          console.log(`user: ${userId} has Join the ${canvasId}`)
        }
      }
    })
  }
  exit(socket: Socket) {
    socket.on('preExit', (canvasId: number, userId: number) => {
      console.log('preExit')
      const res = this.canvasMap.get(canvasId).users.delete(userId)
      console.log('res:', res)
      socket.emit('sureExit', 't')
      //else socket.emit('sureExit', 'f')
    })
  }
  controll(socket: Socket) {
    socket.on('controll', (userId: number, selectNum: number) => {
      console.log(`user:${userId} is controlling the number ${selectNum}`)
    })
  }
}
