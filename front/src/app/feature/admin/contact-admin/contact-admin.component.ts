import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { ChatService } from '../../contact/service/chat.service';
import { MessageChat } from '../../interface/message.interface';

@Component({
  selector: 'app-contact-admin',
  templateUrl: './contact-admin.component.html',
  styleUrl: './contact-admin.component.scss'
})
export class ContactAdminComponent implements OnInit {
  
  messageList: Array<MessageChat> = [];
  @ViewChild('message') message: ElementRef<HTMLInputElement> | undefined;

  constructor(private chatService: ChatService){}

  ngOnInit(): void {
    this.chatService.joinRoom("ABC");
    this.lisenerMessage();
  }

  sendMessage(msg : string){
    this.message!.nativeElement.value = ""
    let message: MessageChat  = {id : 2, message : msg, date : new Date()}
    this.chatService.sendMessage('ABC', message)
  }

  lisenerMessage() {
    this.chatService.getMessageSubject().subscribe((messages: Array<MessageChat> ) => {
      this.messageList = messages.map((item: MessageChat)=> ({
        ...item
      }))
    });
  }
}

