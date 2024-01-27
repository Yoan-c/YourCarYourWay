import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ChatComponent } from './chat/chat.component';
import { FormContactComponent } from './form-contact/form-contact.component';
import { ListContactComponent } from './list-contact/list-contact.component';
import { ContactRoutingModule } from './contact-routing.module';



@NgModule({
  declarations: [ChatComponent, FormContactComponent, ListContactComponent],
  imports: [
    CommonModule,
    ContactRoutingModule
  ]
})
export class ContactModule { }
