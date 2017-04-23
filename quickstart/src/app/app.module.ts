
import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpModule } from '@angular/http';
import { FormsModule } from '@angular/forms';

import { TrainersComponent }  from './exercise/trainers.component';
import { MemberComponent }  from './exercise/member.component';
import { TrainersDetailsComponent }  from './exercise/trainers-details.component';
import { AvatarDemoPiPe }  from './exercise/avatar.pipe';
import { MemberDemoPiPe }  from './exercise/member.pipe';

@NgModule({
  imports:      [ BrowserModule, HttpModule, FormsModule ],
  declarations: [ TrainersComponent, TrainersDetailsComponent, AvatarDemoPiPe, MemberComponent, MemberDemoPiPe ],
  bootstrap:    [ TrainersComponent ]
})
export class AppModule { }