import {Socket} from "socket.io"
type User= {
	id:number
}
export class Canvas{
	id:number
	socket:Socket
	users:User[]
	constructor(id:number,socket:Socket){
		this.id = id
		this.users = []
		this.socket = socket
		this.socket.join(this.id.toString())
	}
	joinUser(user:User){
		this.users.push(user)
		console.log(this.users)
	}
}
