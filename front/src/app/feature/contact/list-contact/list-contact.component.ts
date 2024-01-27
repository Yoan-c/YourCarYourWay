import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-list-contact',
  templateUrl: './list-contact.component.html',
  styleUrl: './list-contact.component.scss'
})
export class ListContactComponent {
  isChat : boolean = true;

  constructor(){}

  updateChatActive() {
    this.isChat = true;
  }
  updateChatInactive() {
    this.isChat = false;
  }
  
}
