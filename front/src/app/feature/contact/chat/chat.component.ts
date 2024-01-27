import { Component, OnInit } from '@angular/core';
import { MessageChat } from '../../interface/message.interface';

@Component({
  selector: 'app-chat',
  templateUrl: './chat.component.html',
  styleUrl: './chat.component.scss'
})
export class ChatComponent implements OnInit {

  tabChat : Array<MessageChat> = [];

  constructor(){}

  ngOnInit(): void {
    this.tabChat.push({id : 1, message : 'bonjour', date : new Date() })
    this.tabChat.push({id : 2, message : `Bonjour`, date : new Date() })
    this.tabChat.push({id : 1, message : `J'ai un probleme pouvez vous m'aider`, date : new Date() })
    this.tabChat.push({id : 2, message : `Oui biensur dites moi tout`, date : new Date() })
    this.tabChat.push({id : 2, message : `Quel est votre soucis ?`, date : new Date() })
  }

  sendMessage(msg : String){
    console.log(`Message contact ${msg}`);
    this.tabChat.push({id : 1, message : msg, date : new Date() })
    console.log(this.tabChat);
  }
}
