import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { ContactAdminComponent } from "./contact-admin/contact-admin.component";

const routes: Routes = [
    { title: 'chat', path: '', component: ContactAdminComponent },
  ];
  
  @NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
  })
  export class AdminRoutingModule { }