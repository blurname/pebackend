import {Socket} from "socket.io"
type User= {
	id:number
}
export class Canvas{
	id:number
	socket:Socket
	users:Map<number,User>
	constructor(id:number,socket:Socket){
		this.id = id
		this.users = new Map()
		this.socket = socket
		this.socket.join(this.id.toString())
	}
	joinUser(user:User){
		this.users.set(user.id,user)
		console.log(this.users)
	}
}
