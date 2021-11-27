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
			this.onMove(socket)
			this.edit(socket)
    })
  }
  create(socket: Socket) {
    socket.on('create', (canvasId: number) => {
      //this.canvasArray.push(new Canvas(canvasId, socket))
      this.canvasMap.set(canvasId, new Canvas(canvasId, socket))
    })
  }
  join(socket: Socket) {
    socket.on('server-join', (canvasId: number, userId: number) => {
      let can = this.canvasMap.get(canvasId)
      if (!can) {
        const temp = new Canvas(canvasId, socket)
        temp.joinUser({ id: userId })
        console.log(`user: ${userId} Join the ${canvasId}`)
        this.canvasMap.set(canvasId, temp)
        this.io.to(canvasId + '').emit('client-users', mapToJson(temp.users))
      } else {
        if (!can.users.get(userId)) {
          can.joinUser({ id: userId })
          //socket.emit('newJoin', JSON.stringify(can.users))
          console.log(`user: ${userId} Join the ${canvasId}`)
        } else {
          console.log(`user: ${userId} has Join the ${canvasId}`)
        }
        socket.join(canvasId + '')
        this.io.to(canvasId + '').emit('client-users', mapToJson(can.users))
      }
      console.log('sdfj')
    })
  }
  exit(socket: Socket) {
    socket.on('preExit', (canvasId: number, userId: number) => {
      //console.log('preExit',canvasId,userId)
      //console.log(this.canvasMap)

      const can = this.canvasMap.get(canvasId)
      can.users.delete(userId)

      //socket.emit('sureExit', 't')
      socket.to(canvasId + '').emit('client-users', mapToJson(can.users))
      //else socket.emit('sureExit', 'f')
    })
  }
  controll(socket: Socket) {
    socket.on(
      'server-controll',
      (canvasId: number, userId: number, spiritId: number) => {
        console.log(`user:${userId} is controlling the number ${spiritId}`)
        socket.to(canvasId + '').emit('client-who-controll', userId, spiritId)
      },
    )
  }
  onMove(socket: Socket) {
    socket.on(
      'server-move',
      (canvasId: number, spiritId: number, distance: Pos) => {
			console.log('move')
			console.log('move distance',distance)
        socket.to(canvasId + '').emit('client-move', spiritId, distance)
      },
    )
  }
	edit(socket:Socket){
	socket.on('server-editor', (canvasId:number,spiritId:number,from:any,to:any) => {
		console.log('server-editor',spiritId,from,to)
		socket.to(canvasId+'').emit('client-editor',spiritId,from,to)
	})
	}
}
export const mapToJson = (map: Map<any, any>) => {
  return JSON.stringify([...map])
}
type Pos = {
  left: number
  top: number
}
