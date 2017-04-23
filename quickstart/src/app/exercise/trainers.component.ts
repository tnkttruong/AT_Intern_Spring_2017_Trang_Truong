import { Component, Input } from '@angular/core';
import { TrainerService } from './trainers.service';

@Component({
	selector: 'trainers',
	providers: [TrainerService],
	templateUrl: './template/trainers.component.html',
	styles: [`
		table, td {
   		border: 1px solid black;
   		text-align: center;
		}
		table{
			width: 500px;
		}
		input{
		  width: 345px;
		}
	`]
})
export class TrainersComponent  {
	@Input('myCity') strCity : string;
	trainers: any;
	selected: number;
	team_name: string;
	input_name: string;
	constructor(private _trainer: TrainerService){
		this.trainers = [];
		this._trainer.getAllTrainer()
		.subscribe((data :any) => {
			this.trainers = data.trainers;
		});
		this.team_name = 'load';
	}

	show(index: number){
		this.selected = index;
	}

	get_member(){
		this.team_name = this.input_name;
	}
}