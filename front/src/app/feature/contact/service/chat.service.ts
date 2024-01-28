import { Injectable } from '@angular/core';
import { Stomp } from '@stomp/stompjs';
import SockJS from 'sockjs-client';
import { MessageChat } from '../../interface/message.interface';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ChatService {
 
 
  private stompClient: any
  private messageSubject: BehaviorSubject<MessageChat[]> = new BehaviorSubject<MessageChat[]>([]);

  constructor() { 
    this.initConnenctionSocket();
  }

  initConnenctionSocket() {
    const url = '//localhost:3000/chat-socket';
    const socket = new SockJS(url);
    this.stompClient = Stomp.over(socket)
  }

  joinRoom(roomId: string) {
    this.stompClient.connect({}, ()=>{
      this.stompClient.subscribe(`/topic/${roomId}`, (messages: any) => {
        const messageContent = JSON.parse(messages.body);
        const currentMessage = this.messageSubject.getValue();
        currentMessage.push(messageContent);

        this.messageSubject.next(currentMessage);

      })
    })
  }

  sendMessage(roomId: string, messageChat: MessageChat) {
    this.stompClient.send(`/app/chat/${roomId}`, {}, JSON.stringify(messageChat))
  }

  getMessageSubject(){
    return this.messageSubject.asObservable();
  }
}
