import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ContactAdminComponent } from './contact-admin/contact-admin.component';
import { AdminRoutingModule } from './admin-routing.module';



@NgModule({
  declarations: [
    ContactAdminComponent
  ],
  imports: [
    CommonModule,
    AdminRoutingModule
  ]
})
export class AdminModule { }
