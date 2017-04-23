import { Component, Input, OnChanges } from '@angular/core';
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
	@Input() index: number;
	trainers: any;
	selected: any;
	constructor(private _trainer: TrainerService){
		this.trainers = [];
		this._trainer.getAllTrainer()
		.subscribe((data :any) => {
			this.trainers = data.trainers;
		});
		this.selected = this.trainers[0];
	}

	ngOnChanges() {
		if(this.index != null){
			this.selected = this.trainers[this.index];
		}
  }
}
