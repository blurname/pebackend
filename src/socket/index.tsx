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
        const temp = new Canvas(canvasId, socket)
        temp.joinUser({ id: userId })
          console.log(`user: ${userId} Join the ${canvasId}`)
        this.canvasMap.set(canvasId, temp)
      } else {
        const canvas = this.canvasMap.get(canvasId)
        const userIsExist = canvas.users.filter((user) => user.id === userId)
        if (userIsExist.length === 0) {
          canvas.joinUser({ id: userId })
          console.log(`user: ${userId} Join the ${canvasId}`)
        } else {
          console.log(`user: ${userId} has Join the ${canvasId}`)
        }
      }
    })
  }
}
//const create = (canvasId: number, socket: Socket, canvasMap: Map<number,Canvas>) => {
//canvasMap.set(canvasId,)
//}
