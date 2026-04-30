import { Component } from '@angular/core';
// import { NgForOf } from "@angular/core";

@Component({
  selector: 'app-user-form',
  standalone: true,
  imports: [],
  templateUrl: './user-form.component.html',
  styleUrl: './user-form.component.css'
})
export class UserFormComponent {
  roles = [
    { roleId: 1, roleName: 'admin'},
    { roleId: 2, roleName: 'user' },
    { roleId: 3, roleName: 'guest'}
  ]

  constructor(){

  }
}
