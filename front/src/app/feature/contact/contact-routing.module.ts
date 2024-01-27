import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { ListContactComponent } from "./list-contact/list-contact.component";

const routes: Routes = [
    { title: 'contact', path: '', component: ListContactComponent },
  ];
  
  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  export class ContactRoutingModule { }