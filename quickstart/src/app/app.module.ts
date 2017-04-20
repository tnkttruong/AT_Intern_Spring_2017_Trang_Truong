import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpModule } from '@angular/http';

import { TrainersComponent }  from './exercise_19-4/trainers.component';
import { TrainersDetailsComponent }  from './exercise_19-4/trainers-details.component';

@NgModule({
  imports:      [ BrowserModule, HttpModule ],
  declarations: [ TrainersComponent, TrainersDetailsComponent ],
  bootstrap:    [ TrainersComponent ]
})
export class AppModule { }
