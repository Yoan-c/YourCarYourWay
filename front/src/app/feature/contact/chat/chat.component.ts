import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { MessageChat } from '../../interface/message.interface';
import { ChatService } from '../service/chat.service';

@Component({
  selector: 'app-chat',
  templateUrl: './chat.component.html',
  styleUrl: './chat.component.scss'
})
export class ChatComponent implements OnInit {

  messageList: Array<MessageChat> = [];
  @ViewChild('message') message: ElementRef<HTMLInputElement> | undefined;

  constructor(private chatService: ChatService){}

  ngOnInit(): void {
    this.chatService.joinRoom("ABC");
    this.lisenerMessage();
  }

  sendMessage(msg : string){
    this.message!.nativeElement.value = ""
    let message: MessageChat  = {id : 1, message : msg, date : new Date()}
    this.chatService.sendMessage('ABC', message)   
  }

  lisenerMessage() {
    this.chatService.getMessageSubject().subscribe((messages: Array<MessageChat>) => {
      this.messageList = messages.map((messageChat: MessageChat) => ({
        ...messageChat
      }))
    });
  }
}
