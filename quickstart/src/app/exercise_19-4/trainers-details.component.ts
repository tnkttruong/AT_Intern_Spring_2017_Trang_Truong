import { Component, Input } from '@angular/core';
import { TrainerService } from './trainers.service';

@Component({
	selector: 'trainers-details',
	providers: [TrainerService],
	templateUrl: './template/trainers-details.component.html',
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
export class TrainersDetailsComponent  { 
	@Input('index') set config(index){
		this.selected = this.trainers[index];
	}
	//@Input() index: number;
	trainers: any;
	selected: any;
	constructor(private _trainer: TrainerService){
		this.trainers = [];
		this._trainer.getAllTrainer()
		.subscribe((data :any) => {
			this.trainers = data.trainers;
		});
	}
}


