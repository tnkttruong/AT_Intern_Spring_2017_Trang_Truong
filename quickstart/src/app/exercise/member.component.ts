import { Component, Input, OnChanges } from '@angular/core';
import { TrainerService } from './trainers.service';

@Component({
    selector: 'member',
    providers: [TrainerService],
    templateUrl: './template/member.component.html',
})
export class MemberComponent{
	trainers: any;
	@Input() team_name: string;
	constructor(private _trainer: TrainerService){
		this.trainers = [];
		this._trainer.getAllTrainer()
		.subscribe((data :any) => {
			this.trainers = data.trainers;
		});
	}
	ngOnChanges() {
		if(this.team_name === ''){
			this.team_name = "All";
		}
  }
}