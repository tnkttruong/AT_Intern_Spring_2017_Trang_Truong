import { Component } from '@angular/core';
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
	`]
})
export class TrainersComponent  {
	trainers: any;
	selected: number;

	constructor(private _trainer: TrainerService){
		this.trainers = [];
		this._trainer.getAllTrainer()
		.subscribe((data :any) => {
			this.trainers = data.trainers;
		});
	}

	show(index: number){
		this.selected = index;
	}
}